#!/bin/sh

# Copyright 2015-2021 Espressif Systems (Shanghai) PTE LTD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RESETPIN=""
BT_INIT_SET="0"
TEST_RAW_TP="0"
IF_TYPE="sdio"
MODULE_NAME="esp32_${IF_TYPE}.ko"

wlan_init()
{
    if [ `lsmod | grep esp32 | wc -l` != "0" ]; then
        sudo rm /dev/esps0
        if [ `lsmod | grep esp32_sdio | wc -l` != "0" ]; then
            sudo rmmod esp32_sdio &> /dev/null
            else
            sudo rmmod esp32_spi &> /dev/null
        fi
    fi

    if [ "$TEST_RAW_TP" = "0" ] ; then
        VAL_CONFIG_TEST_RAW_TP=n
    else
        VAL_CONFIG_TEST_RAW_TP=y
    fi

    # For Linux other than Raspberry Pi, Please point
    # CROSS_COMPILE -> <Toolchain-Path>/bin/arm-linux-gnueabihf-
    # KERNEL        -> Place where kernel is checked out and built
    # ARCH          -> Architecture

    if [ "$RESETPIN" = "" ] ; then
        #By Default, BCM6 is GPIO on host. use resetpin=6
        # sudo insmod $MODULE_NAME resetpin=6
    else
        #Use resetpin value from argument
        insmod $MODULE_NAME
    fi
    if [ `lsmod | grep esp32 | wc -l` != "0" ]; then
        echo "esp32 module inserted "
        mknod /dev/esps0 c 221 0
        chmod 666 /dev/esps0
        echo "/dev/esps0 device created"
        echo "RPi init successfully completed"
    fi
}

bt_init()
{
}

usage()
{
    echo "This script prepares RPI for wlan and bt/ble operation over esp32 device"
    echo "\nUsage: ./rpi_init.sh [arguments]"
    echo "\nArguments are optional and are as below"
    echo "  spi:    sets ESP32<->RPi communication over SPI"
    echo "  sdio:   sets ESP32<->RPi communication over SDIO"
    echo "  btuart: Set GPIO pins on RPi for HCI UART operations with TX, RX, CTS, RTS (defaulted to option btuart_4pins)"
    echo "  btuart_2pins: Set GPIO pins on RPi for HCI UART operations with only TX & RX pins configured (only for ESP32-C2)"
    echo "  resetpin=6:     Set GPIO pins on RPi connected to EN pin of ESP32, used to reset ESP32 (default:6 for BCM6)"
    echo "\nExample:"
    echo "  - Prepare RPi for WLAN operation on SDIO. sdio is default if no interface mentioned"
    echo "   # ./rpi_init.sh or ./rpi_init.sh sdio"
    echo "\n  - Use spi for host<->ESP32 communication. sdio is default if no interface mentioned"
    echo "   # ./rpi_init.sh spi"
    echo "\n  - Prepare RPi for bt/ble operation over UART and WLAN over SDIO/SPI"
    echo "   # ./rpi_init.sh sdio btuart or ./rpi_init.sh spi btuart"
    echo "\n  - use GPIO pin BCM5 (GPIO29) for reset"
    echo "   # ./rpi_init.sh resetpin=5"
    echo "\n  - do btuart, use GPIO pin BCM5 (GPIO29) for reset over SDIO/SPI"
    echo "   # ./rpi_init.sh sdio btuart resetpin=5 or ./rpi_init.sh spi btuart resetpin=5"
}

parse_arguments()
{
    while [ "$1" != "" ] ; do
        case $1 in
            --help | -h )
                usage
                exit 0
                ;;
            sdio)
                IF_TYPE=$1
                ;;
            spi)
                IF_TYPE=$1
                ;;
            resetpin=*)
                echo "Recvd Option: $1"
                RESETPIN=$1
                ;;
            btuart | btuart_4pins | btuart_4pin)
                echo "Configure Host BT UART with 4 pins, RX, TX, CTS, RTS"
                BT_INIT_SET="4"
                ;;
            btuart_2pins | btuart_2pin)
                echo "Configure Host BT UART with 2 pins, RX & TX"
                BT_INIT_SET="2"
                ;;
            rawtp)
                echo "Test RAW TP"
                TEST_RAW_TP="1"
                ;;
            *)
                echo "$1 : unknown option"
                usage
                exit 1
                ;;
                esac
        shift
    done
}


parse_arguments $*
if [ "$IF_TYPE" = "" ] ; then
    echo "Error: No protocol selected"
    usage
    exit 1
else
    echo "Building for $IF_TYPE protocol"
    MODULE_NAME=esp32_${IF_TYPE}.ko
fi

if [ "$IF_TYPE" = "spi" ] ; then
    rm spidev_disabler.dtbo
    # Disable default spidev driver
    dtc spidev_disabler.dts -O dtb > spidev_disabler.dtbo
    sudo dtoverlay -d . spidev_disabler
fi

if [ `lsmod | grep bluetooth | wc -l` = "0" ]; then
    echo "bluetooth module inserted"
    sudo modprobe bluetooth
fi

if [ `lsmod | grep bluetooth | wc -l` != "0" ]; then
    wlan_init
fi

if [ "$BT_INIT_SET" != "0" ] ; then
    bt_init
fi

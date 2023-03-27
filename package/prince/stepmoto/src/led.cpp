#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <sys/types.h>
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <signal.h>

#include "led.h"

#include <iostream>

LedCtrl::LedCtrl(std::string dev)
{
    led_ctrl_fd_ = -1;

    led_ctrl_fd_ = open(dev.c_str(), O_RDWR);
    if(led_ctrl_fd_ < 0) {
        std::cout << "open led wifi r fail"<< std::endl;
        exit (1);
    }
}

LedCtrl::~LedCtrl()
{
    if(led_ctrl_fd_ > 0) {
        close(led_ctrl_fd_);
        led_ctrl_fd_ = -1;
    }
}

bool LedCtrl::LedOn(void)
{
    int ret = write(led_ctrl_fd_, "1", 1); //LED ON
    if(ret < 0) {
        std::cout << "write error" << led_ctrl_fd_ << std::endl;
        return false;
    }
    return true;
}

bool LedCtrl::LedOff(void)
{
    int ret = write(led_ctrl_fd_, "0", 1); //LED OFF
    if(ret < 0) {
        std::cout << "write error" << led_ctrl_fd_ << std::endl;
        return false;
    }
    return true;
}

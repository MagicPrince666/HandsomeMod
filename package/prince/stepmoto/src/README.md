# rk3308 蓝牙通讯示例

## 文件结构
```
    cmake
    ├── ... 适配各个平台的cmake文件
    libs
    ├── ... 三方库二进制文件和头文件存放位置
    src
    ├── error.h
    ├── gatt        # 真正使用到的代码
    │   ├── gatt_service.c
    │   └── gatt_service.h
    ├── main.cpp    # main函数
    ├── mycode      # 无关代码
    │   ├── socket.cpp
    │   ├── socket.h
    │   ├── xepoll.cpp
    │   └── xepoll.h
    └── rk3308      # rk3308 sdk烤过来的
        ├── rk3308-gatt-service.c
        └── rk3308-gatt-table.h
```

## 编译
```
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/build_for_rk3308.cmake ..
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/build_for_rk3308.cmake -DCMAKE_BUILD_TYPE=Debug ..
```

## 命令

* rk3308
```
echo 0 > /sys/class/rfkill/rfkill0/state
echo 1 > /sys/class/rfkill/rfkill0/state
rtk_hciattach -n -s 115200 /dev/ttyS4 rtk_h5 &

hciconfig hci0 up

/usr/libexec/bluetooth/bluetoothd -C -E -d -n &
/userdata/bt_cputools &
```

* h616平台
firmware
```
mkdir /lib/firmware/rtlbt
ln -s /system/vendor/etc/firmware/rtlbt/rtl8723d_fw /lib/firmware/rtlbt/rtl8723d_fw
ln -s /system/vendor/etc/firmware/rtlbt/rtl8723d_config /lib/firmware/rtlbt/rtl8723d_config

echo 0 > /sys/class/rfkill/rfkill0/state
echo 1 > /sys/class/rfkill/rfkill0/state
rtk_hciattach -n -s 115200 /dev/ttyS1 rtk_h5 &

hciconfig hci0 up

bluetoothd -C -E -d -n &
```

停止运行
```
killall gatt-service
killall bluetoothd
killall rtk_hciattach
```

# 问题点
1. 蓝牙名称已修改，但已连接过的设备不会显示新的名字
2. 蓝牙调试助手连接经常超时，原因未明
3. 蓝牙刷新时间有点慢

## 郭
1. 蓝牙作为从机模式
2. 蓝牙发送接收api（消息交互通道+蓝牙高速通道）
3. 蓝牙接入（被动）和退出api
4. 如何判断蓝牙断连，断链后需要重连？/清理上次连接？
5. 蓝牙扫描间隔问题
6. 调试方法

## 数据传输
```
{
    "fix": { // 修复部件
        "face": "string", // 面容修复
        "color": "string", // 原彩修复
        "battary": "string", // 电池修复
        "mic": "string",    // 听筒修复
        "chip": "string",   // 码片修复
        "checkra1n": false // 越狱
    },
    "info" : { // 验机
        "dev": "string", // 设备名
        "id": "string", // 设备ID
        "type": "string", // 设备类型
        "serial": "string", // 序列号
        "mlb": "string", // 主板序列号
        "bat": "string", // 电池序列号
        "bcam": "string", // 后置相机序列
        "fcam": "string", // 前置相机序列
        "lcd": "string", // 液晶显示屏
        "mtsn": "string", // 盖板码
        "lcm": "string", // 液晶码
        "mesa": "string", // 指纹码
        "crashes": "string" // 崩溃报告
    },
    "wifi": { // 连接wifi
        "ssid": "string", // 热点名
        "password": "string" // 密码
    }
}
```
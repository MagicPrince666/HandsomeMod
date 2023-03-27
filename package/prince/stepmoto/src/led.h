#ifndef __LED_H__
#define __LED_H__

#include <iostream>

class LedCtrl
{
public:
    LedCtrl(std::string dev);
    ~LedCtrl();

    bool LedOn();
    bool LedOff();

private:
    int led_ctrl_fd_;
};

#endif

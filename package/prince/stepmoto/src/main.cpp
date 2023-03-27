#include <unistd.h>
#include <stdio.h>
#include <cstring>
#include <iostream>
#include <memory>

#include "led.h"
#include "pwm.h"

// 捕获异常信号用于调试
#define BACKTRACE_DEBUG 0

#if BACKTRACE_DEBUG
#include <signal.h>
#include <execinfo.h>

#define PRINT_SIZE_ 100

static void _signal_handler(int signum)
{
    void *array[PRINT_SIZE_];
    char **strings;

    size_t size = backtrace(array, PRINT_SIZE_);
    strings     = backtrace_symbols(array, size);

    if (strings == nullptr) {
        fprintf(stderr, "backtrace_symbols");
        exit(EXIT_FAILURE);
    }

    switch (signum) {
    case SIGSEGV:
        fprintf(stderr, "widebright received SIGSEGV! Stack trace:\n");
        break;

    case SIGPIPE:
        fprintf(stderr, "widebright received SIGPIPE! Stack trace:\n");
        break;

    case SIGFPE:
        fprintf(stderr, "widebright received SIGFPE! Stack trace:\n");
        break;

    case SIGABRT:
        fprintf(stderr, "widebright received SIGABRT! Stack trace:\n");
        break;

    default:
        break;
    }

    for (size_t i = 0; i < size; i++) {
        fprintf(stderr, "%d %s \n", i, strings[i]);
    }

    free(strings);
    signal(signum, SIG_DFL); /* 还原默认的信号处理handler */

    exit(1);
}
#endif

int main(int argc, char **argv)
{
#if BACKTRACE_DEBUG
    signal(SIGPIPE, _signal_handler); // SIGPIPE，管道破裂。
    signal(SIGSEGV, _signal_handler); // SIGSEGV，非法内存访问
    signal(SIGFPE, _signal_handler);  // SIGFPE，数学相关的异常，如被0除，浮点溢出，等等
    signal(SIGABRT, _signal_handler); // SIGABRT，由调用abort函数产生，进程非正常退出
#endif

    std::cout << "start step moto" << std::endl;
    LedCtrl dir("/sys/class/leds/dir/brightness");
    LedCtrl en("/sys/class/leds/en/brightness");
    dir.LedOff();
    en.LedOff();

    PwmPram moto_pwm;
    moto_pwm.chip = 0;
    moto_pwm.channel = 0;
    moto_pwm.polarity = true;
    moto_pwm.period = 200000;
    moto_pwm.dutycycle = 100000;
    std::unique_ptr<Pwm> moto(new Pwm(moto_pwm));
    moto->PwmDutyCycle(100000);

    PwmPram servo_pwm;
    servo_pwm.chip = 0;
    servo_pwm.channel = 1;
    servo_pwm.polarity = true;
    servo_pwm.period = 20000000;
    servo_pwm.dutycycle = 1500000;
    std::unique_ptr<Pwm> servo(new Pwm(moto_pwm));
    servo->PwmDutyCycle(1500000);

    while(1) {
        sleep(2);
    }
    return 0;
}

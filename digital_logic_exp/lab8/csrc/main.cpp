#include "VSingleCycleCPU_top.h"
#include <chrono>
#include <ctime>
#include <nvboard.h>
#include <thread>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME *top);

std::clock_t lastTime = std::clock();

static void single_cycle() {
    dut.CLK = 0;
    dut.eval();
    // std::this_thread::sleep_for(std::chrono::milliseconds(500));
    while (lastTime / 50000 == std::clock() / 50000)
        ;
    lastTime = std::clock();
    dut.CLK = 1;
    // std::this_thread::sleep_for(std::chrono::milliseconds(500));
    dut.eval();
    while (lastTime / 50000 == std::clock() / 50000)
        ;
    lastTime = std::clock();
}

static void reset(int n) {
    dut.BTNC = 1;
    while (n-- > 0)
        single_cycle();
    dut.BTNC = 0;
}

int main() {
    nvboard_bind_all_pins(&dut);
    nvboard_init();

    reset(10);

    while (1) {
        // VL_PRINTF_MT("%x\n", dut.VGA_R);
        nvboard_update();
        single_cycle();
    }
}

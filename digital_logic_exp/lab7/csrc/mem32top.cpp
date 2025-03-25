#include "Vmem32b_top.h"
#include <nvboard.h>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME *top);

static void single_cycle() {
    dut.CLK100MHZ = 0;
    dut.eval();
    dut.CLK100MHZ = 1;
    dut.eval();
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

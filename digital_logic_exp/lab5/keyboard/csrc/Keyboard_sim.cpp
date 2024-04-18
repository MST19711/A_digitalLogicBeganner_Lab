
#include "VKeyboardSim.h"
#include <nvboard.h>
static TOP_NAME dut;
void nvboard_bind_all_pins(TOP_NAME *top);

static void single_cycle() {
    dut.CLK100MHZ = 0;
    dut.eval();
    dut.CLK100MHZ = 1;
    dut.eval();
}

int main() {
    nvboard_bind_all_pins(&dut);
    nvboard_init();
    while (1) {
        nvboard_update();
        single_cycle();
    }
    return 0;
}
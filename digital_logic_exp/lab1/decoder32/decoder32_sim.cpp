#include "obj_dir/Vdecoder32.h"
#include "verilated.h"

int main(int argc, char **argv) {
    VerilatedContext *contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    Vdecoder32 *top = new Vdecoder32{contextp};
    while (!contextp->gotFinish()) {
        for (int i = 0; i < 32; i++) {
            top->INPUT = i;
            top->eval();
            for (int j = 0; j < 32; j++) {
                VL_PRINTF("%x", (top->OUTPUT & (1 << j)) != 0);
            }
            VL_PRINTF("\n");
        }
        break;
    }
    delete top;
    delete contextp;
    return 0;
}
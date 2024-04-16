#include "Vdecoder32.h"
#include <iostream>

int main() {
    Vdecoder32 *top = new Vdecoder32;

    // 设置输入信号
    top->clk = 0;
    top->reset = 1;

    // 模拟时钟
    for (int i = 0; i < 10; ++i) {
        top->eval();
        top->clk = !top->clk; // 切换时钟信号
    }

    // 读取输出信号
    std::cout << "Output value: " << top->output << std::endl;

    delete top;
    return 0;
}
#include <stdio.h>
//-march=rv32i -mabi=ilp32

unsigned int umul(unsigned int a, unsigned int b) {
    unsigned int result = 0;
    while (b) {
        result += (b & 1) ? a : 0;
        a <<= 1;
        b >>= 1;
    }
    return result;
}
unsigned int udiv(unsigned int a,
                  unsigned int b) { // a/b
    unsigned int result = 0;
    unsigned ptr = 1 << 31;
    unsigned long long int x = (unsigned long long int)b << 31;
    unsigned long long int A = (unsigned long long int)a;
    while (ptr != 0) {
        if (A >= x) {
            A -= x;
            result += ptr;
        }
        x >>= 1;
        ptr >>= 1;
    }
    return result;
}
unsigned int umod(unsigned int a,
                  unsigned int b) { // a%b
    return a - umul(udiv(a, b), b);
}

typedef struct console {
    char *data;
    int ptr;
    int size, line_size;
} console;

void console_clear(console *con) {
    con->ptr = 0;
    for (int i = 0; i < con->size; i++) {
        *(con->data + i) = 0;
    }
}

void console_putc(console *con, char c) {
    if (con->ptr < con->size) {
        if (c == '\n' && con->size - con->ptr > con->line_size) {
            con->ptr = umod((con->ptr + con->line_size), con->line_size);
        } else {
            *(con->data + con->ptr) = c;
            con->ptr++;
        }
    }
}

int print_int(console *con, unsigned x) {
    int ret;
    if (x != 0)
        ret = print_int(con, udiv(x, 10));
    else
        return 0;
    console_putc(con, umod(x, 10) + '0');
    return ret + 1;
}
unsigned int hexToBcd(unsigned int hexValue) {
    unsigned int bcdResult = 0;
    unsigned int shiftCounter = 0;

    while (hexValue != 0) {
        // 取出十六进制数的最低位
        int digit = hexValue & 0xF;
        // 将该位转换为BCD，并左移适当的位数
        bcdResult |= (digit << (shiftCounter << 2));
        // 准备处理下一个十六进制位
        hexValue >>= 4;
        // 更新位移计数器
        shiftCounter++;
    }
    return bcdResult;
}
int main() {
    unsigned int a = 1;
    /*
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    */
    // volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    while (1) {
        a++;
        printf("%x\n", hexToBcd(a));
        //*SEG_LED = hexToBcd(a);
        /*
        console_clear(&con0);
        print_int(&con0, c);
        */
        // printf("seg display : %x\n", f);
    }
}
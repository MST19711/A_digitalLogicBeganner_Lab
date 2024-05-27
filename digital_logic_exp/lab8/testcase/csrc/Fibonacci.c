#include <stdio.h>
//-march=rv32i -mabi=ilp32
int main() {
    unsigned int a = 1, b = 1, c;
    volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    while (1) {
        c = a + b;
        a = b;
        b = c;
        unsigned int d = 1, e = c % 100000000;
        while (e) {
            d *= 16;
            d += e % 10;
            e /= 10;
        }
        // printf("ans : %d\n", c);
        // printf("%x\n", d);
        unsigned int f = 0;
        while (d) {
            f *= 16;
            f += d % 16;
            d /= 16;
        }
        f /= 16;
        *SEG_LED = f;
        // printf("seg display : %x\n", f);
    }
}
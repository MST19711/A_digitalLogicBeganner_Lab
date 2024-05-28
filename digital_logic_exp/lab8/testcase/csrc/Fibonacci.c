#include <stdio.h>
//-march=rv32i -mabi=ilp32
__attribute__((always_inline)) unsigned int umul(unsigned int a,
                                                 unsigned int b) {
    unsigned int result = 0;
    while (b) {
        result += (b & 1) ? a : 0;
        a <<= 1;
        b >>= 1;
    }
    return result;
}
__attribute__((always_inline)) unsigned int udiv(unsigned int a,
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
__attribute__((always_inline)) unsigned int umod(unsigned int a,
                                                 unsigned int b) { // a%b
    return a - umul(udiv(a, b), b);
}
int main() {
    unsigned int a = 1, b = 1, c;
    volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    while (1) {
        c = a + b;
        a = b;
        b = c;
        unsigned int d = 1, e = umod(c, 100000000);
        while (e) {
            d *= 16;
            d += umod(e, 10);
            e = udiv(e, 10);
        }
        // printf("ans : %d\n", c);
        // printf("%x\n", d);
        unsigned int f = 0;
        while (d) {
            f *= 16;
            f += umod(d, 16);
            d = udiv(d, 16);
        }
        f = udiv(f, 16);
        *SEG_LED = f;
        // printf("seg display : %x\n", f);
    }
}
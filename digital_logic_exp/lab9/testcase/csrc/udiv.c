#include <stdio.h>
__attribute__((always_inline)) unsigned int udiv(unsigned int a,
                                                 unsigned int b) { // a/b
    unsigned int result = 0;
    unsigned ptr = 1 << 31;
    unsigned long long int x = (unsigned long long int)b << 31;
    unsigned long long int A = (unsigned long long int)a;
    while (ptr != 0) {
        if (A > x) {
            A -= x;
            result += ptr;
        }
        x >>= 1;
        ptr >>= 1;
    }
    return result;
}
int main() { printf("%u\n", udiv(134523, 13)); }
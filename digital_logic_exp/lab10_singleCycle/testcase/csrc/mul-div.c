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
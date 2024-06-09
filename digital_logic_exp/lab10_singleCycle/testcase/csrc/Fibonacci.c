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

unsigned int umod(unsigned int a, unsigned int b) {
    // 如果除数为0，返回错误
    if (b == 0) {
        return -1; // 或者其他错误处理
    }
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
    return (unsigned int)A;
}

typedef struct console {
    char *data;
    int ptr;
    int *conptr;
    int size, line_size;
} console;

void console_clear(console *con) {
    con->ptr = 0;
    *(con->conptr) = con->ptr;
    for (int i = 0; i < con->size; i++) {
        *(con->data + i) = 0;
    }
}

void console_putc(console *con, char c) {
    if (con->ptr < con->size) {
        *(con->data + con->ptr) = c;
        if (c == '\n' && con->size - con->ptr > con->line_size) {
            con->ptr = umod((con->ptr + con->line_size), con->line_size);
        } else {
            con->ptr++;
        }
        *(con->conptr) = con->ptr;
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

int main() {
    unsigned int a = 1, b = 1, c;
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    con0.conptr = (int *)0xa0000FFF;
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
        console_clear(&con0);
        print_int(&con0, c);
        // printf("seg display : %x\n", f);
    }
}
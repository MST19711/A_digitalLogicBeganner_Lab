
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
#define kb_snapshot_addr 0xb0000000 // 到0xb00000FF
#define kb_memmap_addr 0xa0001000   // 到0xa00010FF

unsigned get_kbcode() {
    for (int i = 0; i < 0xFF; i++) {
        if (*((char *)kb_snapshot_addr + i) != *((char *)kb_memmap_addr + i) &&
            *((char *)kb_snapshot_addr + i) == 0) {
            *((char *)kb_snapshot_addr + i) = *((char *)kb_memmap_addr + i);
            return i;
        }
        *((char *)kb_snapshot_addr + i) = *((char *)kb_memmap_addr + i);
    }
    return 0xFFFFFFFF;
}

int main() {
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    con0.conptr = (int *)0xa0000FFF;
    volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    while (1) {
        int kbc = get_kbcode();
        if (kbc != 0xFFFFFFFF) {
            *SEG_LED = kbc;
            // console_clear(&con0);
            print_int(&con0, kbc);
            console_putc(&con0, ' ');
        }
        // printf("seg display : %x\n", f);
    }
}
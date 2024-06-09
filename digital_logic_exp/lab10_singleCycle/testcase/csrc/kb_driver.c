// LED
void write2LED(int x) {
    volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    *SEG_LED = x;
}

// time memmap
#define TIME_MEMMAP_ADDR 0xa0001B00
#define TIME_MS *((unsigned int *)TIME_MEMMAP_ADDR)

// umul, udiv and umod
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
// keyboard driver
#define kb_snapshot_addr 0xb0000000                    // 到0xb00000FF
#define kb_snapshot(x) *((char *)kb_snapshot_addr + x) // 到0xa00010FF
#define kb_memmap_addr 0xa0001000                      // 到0xa00010FF
#define kb_memmap(x) *((char *)kb_memmap_addr + x)     // 到0xa00010FF

char kb_getc() {
    char c = 0;
    int kbc = 0xFFFFFFFF;
    for (int i = 0; i < 0xFF; i++) {
        if (kb_snapshot(i) != kb_memmap(i) && kb_snapshot(i) == 0) {
            kb_snapshot(i) = kb_memmap(i);
            kbc = i;
            break;
        }
        kb_snapshot(i) = kb_memmap(i);
    }
    if (kbc != 0xFFFFFFFF) {
        *((volatile unsigned *)0x1004F000) = kbc;
        if (kbc == 0x66)
            c = 0x08; // backspace
        if (kbc == 0x5a)
            c = 0x0A; // Line Feed
        if (kbc == 0x76)
            c = 0x1B; // esc
        if (kbc == 0x75)
            c = 0x11; // up
        if (kbc == 0x72)
            c = 0x12; // down
        if (kbc == 0x6b)
            c = 0x13; // left
        if (kbc == 0x74)
            c = 0x14; // right
        if (kbc == 0x0D)
            c = 0x20;
        if (kbc == 0x0E)
            c = 0x60;
        if (kbc == 0x15)
            c = 0x71;
        if (kbc == 0x16)
            c = 0x31;
        if (kbc == 0x1A)
            c = 0x7A;
        if (kbc == 0x1B)
            c = 0x73;
        if (kbc == 0x1C)
            c = 0x61;
        if (kbc == 0x1D)
            c = 0x77;
        if (kbc == 0x1E)
            c = 0x32;
        if (kbc == 0x21)
            c = 0x63;
        if (kbc == 0x22)
            c = 0x78;
        if (kbc == 0x23)
            c = 0x64;
        if (kbc == 0x24)
            c = 0x65;
        if (kbc == 0x25)
            c = 0x34;
        if (kbc == 0x26)
            c = 0x33;
        if (kbc == 0x29)
            c = 0x20;
        if (kbc == 0x2A)
            c = 0x76;
        if (kbc == 0x2B)
            c = 0x66;
        if (kbc == 0x2C)
            c = 0x74;
        if (kbc == 0x2D)
            c = 0x72;
        if (kbc == 0x2E)
            c = 0x35;
        if (kbc == 0x31)
            c = 0x6E;
        if (kbc == 0x32)
            c = 0x62;
        if (kbc == 0x33)
            c = 0x68;
        if (kbc == 0x34)
            c = 0x67;
        if (kbc == 0x35)
            c = 0x79;
        if (kbc == 0x36)
            c = 0x36;
        if (kbc == 0x3A)
            c = 0x6D;
        if (kbc == 0x3B)
            c = 0x6A;
        if (kbc == 0x3C)
            c = 0x75;
        if (kbc == 0x3D)
            c = 0x37;
        if (kbc == 0x3E)
            c = 0x38;
        if (kbc == 0x41)
            c = 0x2C;
        if (kbc == 0x42)
            c = 0x6B;
        if (kbc == 0x43)
            c = 0x69;
        if (kbc == 0x44)
            c = 0x6F;
        if (kbc == 0x45)
            c = 0x30;
        if (kbc == 0x46)
            c = 0x39;
        if (kbc == 0x49)
            c = 0x2E;
        if (kbc == 0x4A)
            c = 0x2F;
        if (kbc == 0x4B)
            c = 0x6C;
        if (kbc == 0x4C)
            c = 0x3A;
        if (kbc == 0x4D)
            c = 0x71;
        if (kbc == 0x4E)
            c = 0x2D;
        if (kbc == 0x52)
            c = 0x27;
        if (kbc == 0x54)
            c = 0x5B;
        if (kbc == 0x55)
            c = 0x3D;
        if (kbc == 0x5B)
            c = 0x5D;
        if (kbc == 0x5D)
            c = 0x5C;
        if (kbc == 0x66)
            c = 0x08;
        if (kbc == 0x69)
            c = 0x31;
        /*
        if (kbc == 0x6B)
            c = 0x34;
        */
        if (kbc == 0x6C)
            c = 0x37;
        if (kbc == 0x70)
            c = 0x30;
        if (kbc == 0x71)
            c = 0x2E;
        /*
        if (kbc == 0x72)
            c = 0x32;
        */
        if (kbc == 0x73)
            c = 0x35;
        /*
        if (kbc == 0x74)
            c = 0x36;
        */
        /*
        if (kbc == 0x75)
            c = 0x38;
        */
        if (kbc == 0x79)
            c = 0x2B;
        if (kbc == 0x7A)
            c = 0x33;
        if (kbc == 0x7B)
            c = 0x2C;
        if (kbc == 0x7C)
            c = 0x2A;
        if (kbc == 0x7D)
            c = 0x39;
    }
    if (*((char *)kb_memmap_addr + 0x12) != 0 ||
        *((char *)kb_memmap_addr + 0x59) != 0) {
        if (c >= 'a' && c <= 'z') {
            c += ('A' - 'a');
        } else {
            if (c == '1')
                c = '!';
            else if (c == '2')
                c = '@';
            else if (c == '3')
                c = '#';
            else if (c == '4')
                c = '$';
            else if (c == '5')
                c = '%';
            else if (c == '6')
                c = '^';
            else if (c == '7')
                c = '&';
            else if (c == '8')
                c = '*';
            else if (c == '9')
                c = '(';
            else if (c == '0')
                c = ')';
            else if (c == '[')
                c = '{';
            else if (c == ']')
                c = '}';
            else if (c == ',')
                c = '<';
            else if (c == '.')
                c = '>';
            else if (c == '/')
                c = '?';
            else if (c == ';')
                c = ':';
            else if (c == '=')
                c = '+';
            else if (c == '-')
                c = '_';
            else if (c == '`')
                c = '~';
            else if (c == '\\')
                c = '|';
            else if (c == '\'')
                c = '\"';
        }
    }
    return c;
}

// console driver
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
        if (c == '\n' && con->size - con->ptr > con->line_size) {
            con->ptr = con->ptr + con->line_size -
                       umod((con->ptr + con->line_size), con->line_size);
        } else {
            *(con->data + con->ptr) = c;
            con->ptr++;
        }
        *(con->conptr) = con->ptr;
    }
}
#define conBuffer_char(con, ptr) (ptr < con->size ? con->data[ptr] : 0)
void console_putc_at(console *con, char c, int addr) {
    if (addr < con->size) {
        con->data[addr] = c;
    }
}
void console_insert_char(console *con, char c) {
    if (c == '\n') {
        console_putc(con, c);
        return;
    }
    int i;
    if (con->ptr < con->size) {
        for (i = con->ptr; conBuffer_char(con, i) != 0; i++)
            ;
        if (i == con->size)
            i--;
        while (i > con->ptr) {
            console_putc_at(con, conBuffer_char(con, i - 1), i);
            i--;
        }
        console_putc(con, c);
    }
}
void console_backspace(console *con) {
    if (con->ptr > 0) {
        con->ptr--;
        if (*(con->data + con->ptr) == 0) {
            while (*(con->data + con->ptr) == 0 &&
                   umod(con->ptr, con->line_size) != 0)
                con->ptr--;
            if (*(con->data + con->ptr) != 0) {
                con->ptr++;
            }
        }
        *(con->data + con->ptr) = 0;
        *(con->conptr) = con->ptr;
    }
}

void console_moveptr(console *con, int c) {
    if (c == 0x11) {
        if (con->ptr >= con->line_size) {
            con->ptr -= con->line_size;
        }
    }
    if (c == 0x12) {
        if (con->ptr < con->size - con->line_size) {
            con->ptr += con->line_size;
        }
    }
    if (c == 0x13) {
        if (umod(con->ptr, con->line_size) != 0) {
            con->ptr--;
        }
    }
    if (c == 0x14) {
        if (umod(con->ptr, con->line_size) != (con->line_size - 1)) {
            con->ptr++;
        }
    }
    *(con->conptr) = con->ptr;
}

void console_backspace_inline(console *con) {
    if (con->ptr < con->size && con->ptr > 0) {
        int i;
        for (i = con->ptr; umod((i + 1), con->line_size) != 0; i++) {
            console_putc_at(con, con->data[i + 1], i);
        }
        con->ptr--;
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

#define getc_fromStr(str, addr) (char)*((char *)str + addr)
void console_nputline(console *con, char *str, int max_len) {
    for (int i = 0; getc_fromStr(str, i) != 0 && i < max_len; i++) {
        console_putc(con, getc_fromStr(str, i));
    }
}
void console_rollUp(console *con) {
    int i = 0;
    for (int i = 0; i < con->size; i++) {
        console_putc_at(con,
                        (i + con->line_size < con->size
                             ? con->data[i + con->line_size]
                             : 0),
                        i);
    }
    con->ptr -= con->line_size;
    *(con->conptr) = con->ptr;
}
char getc() { return kb_getc(); }
int main() {
    char c;
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    con0.conptr = (int *)0xa0000FFF;
    while (1) {
        c = getc();
        if (c != 0) {
            if (c == 0x08)
                console_backspace_inline(&con0);
            else if (c == 0x11 || c == 0x12 || c == 0x13 || c == 0x14)
                console_moveptr(&con0, c);
            else
                console_insert_char(&con0, c);
        }
    }
    return 0;
}
#ifndef DRIVER
#define DRIVER
// LED
#define LEDSET_MEMMAP_ADDR 0x1004F000

// time memmap
#define TIME_MEMMAP_ADDR 0xa0001B00
#define TIME_MS *((const unsigned int *)TIME_MEMMAP_ADDR)

// heap
// from 0xb0000100
#define prompt_addr 0xb0000200
#define hello_addr 0xb0000220
#define getline_buffer_addr 0xb0000300 // to 0xb0000400
#define getline_buffer ((char *)getline_buffer_addr)

// keyboard driver
#define kb_snapshot_addr 0xb0000000 // 到0xb00000FF
#define kb_memmap_addr 0xa0001000   // 到0xa00010FF

typedef struct keyboard {
    char *memmap_addr;
    char *snapshot_addr;
} keyboard;
char kb_getc(keyboard *kb);

// console driver
#define conBuffer_char(con, ptr) (ptr < con->size ? con->data[ptr] : 0)
#define getc_fromStr(str, addr) (char)*((char *)str + addr)

typedef struct console {
    char *data;
    int ptr;
    int *conptr;
    int size, line_size;
} console;

// console driver
#define conBuffer_char(con, ptr) (ptr < con->size ? con->data[ptr] : 0)
#define getc_fromStr(str, addr) (char)*((char *)str + addr)

inline void __attribute__((always_inline)) console_clear(console *con) {
    con->ptr = 0;
    *(con->conptr) = con->ptr;
    for (int i = 0; i < con->size; i++) {
        con->data[i] = 0;
    }
}
// 指针位置不移动
inline void __attribute__((always_inline)) console_putc(console *con, char c) {
    con->data[con->ptr] = c;
}
// 移动指针，0x11 = up， 0x12 = down, 0x13 = left, 0x14 = right。
// 显示器上的ptr始终与con->ptr保持一致
inline void __attribute__((always_inline))
console_moveptr(console *con, char dir) {
    if (dir == 0x11) {
        if (con->ptr >= con->line_size) {
            con->ptr -= con->line_size;
        }
    }
    if (dir == 0x12) {
        if (con->ptr + con->line_size < con->size) {
            con->ptr += con->line_size;
        }
    }
    if (dir == 0x13) {
        if (con->ptr + 1 < con->size) {
            con->ptr += 1;
        }
    }
    if (dir == 0x14) {
        if (con->ptr - 1 >= 0) {
            con->ptr -= 1;
        }
    }
    *(con->conptr) = con->ptr;
}

inline char __attribute__((always_inline))
console_getc(console *con, int addr) {
    return con->data[addr];
}
#endif
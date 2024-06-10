#include "../../am/include/am.h"
#define putstr(con, s)                                                         \
    ({                                                                         \
        for (const char *p = s; *p; p++)                                       \
            putch(con, *p);                                                    \
    })

// umul, udiv and umod
typedef unsigned size_t;
typedef unsigned long uintptr_t;
unsigned int umul(unsigned int a, unsigned int b);
unsigned int udiv(unsigned int a, unsigned int b);
unsigned int umod(unsigned int a, unsigned int b);
size_t kstrlen(const char *s);

void backspace(console *con);
void ngetline(char *dst, int len, keyboard *kb, console *con);

/*
int printf(console *con, const char *format, ...);
*/

// aboue console
void console_putc_at(console *con, char c, int addr);
void console_insert_char(console *con, char c);
void console_rollUp(console *con);
void console_autorollUp(console *con);
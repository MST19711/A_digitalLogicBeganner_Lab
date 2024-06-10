#include "../../am/include/am.h"
#include "../include/arg.h"
#include "../include/klib.h"

int print_int(unsigned x, console *con) {
    int ret;
    if (x != 0)
        ret = print_int(udiv(x, 10), con);
    else
        return 0;
    putch(con, umod(x, 10) + '0');
    return ret + 1;
}
/*
int printf(const char *fmt, console *con, ...) {
    int counter = 0;
    va_list valist;
    va_start(valist, fmt);
    char *str_head;
    for (str_head = (char *)fmt; *str_head != 0; str_head++) {
        if (*str_head == '\\' && *(str_head + 1) != 0) {
            if (*(str_head + 1) == 'n') {
                putch(con, 10);
                counter++;
            }
        }
        if (*str_head == '%' && *(str_head + 1) != 0) {
            if (*(str_head + 1) == 'd') {
                int n = va_arg(valist, int);
                if (n == 0) {
                    putch(con, '0');
                    counter++;
                } else {
                    counter += print_int((unsigned)n, con);
                }
            }
            if (*(str_head + 1) == 's') {
                char *s = va_arg(valist, char *);
                counter += strlen(s);
                putstr(con, s);
            }
            if (*(str_head + 1) == 'p') {
                void *p = va_arg(valist, void *);
                if (p == 0) {
                    putch(con, '0');
                    counter++;
                } else {
                    counter += print_int((unsigned long)p, con);
                }
            }
            str_head++;
        } else {
            putch(con, *str_head);
            counter++;
        }
    }
    return counter;
}
*/
void backspace(console *con) {
    if (con->ptr == 0)
        return;
    int i = con->ptr - 1;
    while (con->data[i] != 0x0 && i < con->size - 1) {
        con->data[i] = con->data[i + 1];
        i++;
    }
    con->ptr--;
    *(con->conptr) = con->ptr;
}
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
void console_autorollUp(console *con) {
    if (con->ptr >= con->size - con->line_size) {
        console_rollUp(con);
    }
}
void ngetline(char *dst, int len, keyboard *kb, console *con) { // 不包括\n
    int i = 0;
    char c = getc(kb);
    int start = con->ptr;
    while (1) {
        c = getc(kb);
        if (c != 0x0) {
            if (c == 0x08 && con->ptr > start) {
                backspace(con);
                i--;
            } else if (c == 0x13 || c == 0x14) {
                if (con->ptr > start) {
                    console_moveptr(con, c);
                }
            } else {
                console_insert_char(con, c);
                if (c == '\n') {
                    break;
                }
                i++;
            }
        }
    }
    console_autorollUp(con);
    int j;
    for (j = 0; j < i && j < len - 1; j++) {
        dst[j] = console_getc(con, start + j);
    }
    dst[j] = 0;
}

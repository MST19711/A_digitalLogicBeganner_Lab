#include "../include/am.h"
#include "../include/driver.h"

void putch(console *con, char c) { console_putc(con, c); }
void del(console *con) { console_putc(con, 0); }

void movePtr(console *con, char dir) { console_moveptr(con, dir); }
// 获取屏幕上的字符
char getConChar(console *con, int addr) { return console_getc(con, addr); }

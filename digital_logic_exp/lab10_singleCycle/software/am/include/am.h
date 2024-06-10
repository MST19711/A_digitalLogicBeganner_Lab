#include "driver.h"
// 阻塞式从键盘接受一个字符(包括退格、回车等按键，但是屏蔽shift)，然后直接返回。显示问题请在程序中处理。
char getc(keyboard *kb);

// 在con的ptr位置放置一个字符，会冲刷掉当前位置的原有内容。同时ptr不会移动
void putch(console *con, char c);
// 清除con->ptr位置的内容，同时ptr不会移动
void del(console *con);
// 移动指针，0x11 = up， 0x12 = down, 0x13 = left, 0x14 = right。
// 显示器上的ptr始终与con->ptr保持一致
void movePtr(console *con, char dir);
// 获取屏幕上的字符
char getConChar(console *con, int addr);

// 获取系统运行时间，毫秒计数
const unsigned int getTime_ms();

// 在数码管上显示一个int
void showInt2SegDisplay(unsigned int num);

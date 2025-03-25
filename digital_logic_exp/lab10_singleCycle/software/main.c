int main();
void entry() { main(); }

#include "am/include/am.h"
#include "klib/include/klib.h"

char test[100];
console con0 = {.conptr = (int *)0xa0000FFF,
                .data = (char *)0xa0000000,
                .line_size = 80,
                .size = 2400,
                .ptr = 0};
int main() {
    test[0] = 'H';
    test[1] = 'e';
    test[2] = 'l';
    test[3] = 'l';
    test[4] = 'o';
    test[5] = ' ';
    test[6] = 'W';
    test[7] = 'o';
    test[8] = 'r';
    test[9] = 'l';
    test[10] = 'd';
    test[11] = '\n';
    test[12] = '\0';
    putstr(&con0, test);
    while (1) {
    };
    return 0;
}
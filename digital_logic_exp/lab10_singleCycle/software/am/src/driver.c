#include "../include/driver.h"

#define kb_snapshot(x, i) *(x->snapshot_addr + i) // 到0xa00010FF
#define kb_memmap(x, i) *(x->memmap_addr + i)     // 到0xa00010FF

char kb_getc(keyboard *kb) {
    char c = 0;
    int kbc = 0xFFFFFFFF;
    for (int i = 0; i < 0xFF; i++) {
        if (kb_snapshot(kb, i) != kb_memmap(kb, i) && kb_snapshot(kb, i) == 0) {
            kb_snapshot(kb, i) = kb_memmap(kb, i);
            kbc = i;
            break;
        }
        kb_snapshot(kb, i) = kb_memmap(kb, i);
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

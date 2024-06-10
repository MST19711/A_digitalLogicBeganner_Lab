#include "../include/klib.h"

size_t kstrlen(const char *s) {
    size_t len = 0;
    for (; *(s + len) != 0; len++)
        ;
    return len;
}

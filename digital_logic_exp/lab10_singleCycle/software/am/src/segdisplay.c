#include "../include/am.h"
#include "../include/driver.h"

void showInt2SegDisplay(unsigned int num) {
    *((unsigned int *)LEDSET_MEMMAP_ADDR) = num;
}
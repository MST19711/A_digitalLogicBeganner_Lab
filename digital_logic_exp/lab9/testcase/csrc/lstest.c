int main() {
    int a = 1, b = 2, c = 3, d;
    while (1) {
        d = a;
        a = b;
        b = c;
        c = d;
        *(volatile unsigned *)0x1004F000 = c;
    }
}
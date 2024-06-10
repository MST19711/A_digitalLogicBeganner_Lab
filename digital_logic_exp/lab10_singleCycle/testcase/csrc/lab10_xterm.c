// LED
void write2LED(int x) {
    volatile unsigned *SEG_LED = (volatile unsigned *)0x1004F000;
    *SEG_LED = x;
}

// time memmap
#define TIME_MEMMAP_ADDR 0xa0001B00
#define TIME_MS *((unsigned int *)TIME_MEMMAP_ADDR)

// umul, udiv and umod
unsigned int umul(unsigned int a, unsigned int b) {
    unsigned int result = 0;
    while (b) {
        result += (b & 1) ? a : 0;
        a <<= 1;
        b >>= 1;
    }
    return result;
}
unsigned int udiv(unsigned int a,
                  unsigned int b) { // a/b
    unsigned int result = 0;
    unsigned ptr = 1 << 31;
    unsigned long long int x = (unsigned long long int)b << 31;
    unsigned long long int A = (unsigned long long int)a;
    while (ptr != 0) {
        if (A >= x) {
            A -= x;
            result += ptr;
        }
        x >>= 1;
        ptr >>= 1;
    }
    return result;
}
unsigned int umod(unsigned int a, unsigned int b) {
    // 如果除数为0，返回错误
    if (b == 0) {
        return -1; // 或者其他错误处理
    }
    unsigned int result = 0;
    unsigned ptr = 1 << 31;
    unsigned long long int x = (unsigned long long int)b << 31;
    unsigned long long int A = (unsigned long long int)a;
    while (ptr != 0) {
        if (A >= x) {
            A -= x;
            result += ptr;
        }
        x >>= 1;
        ptr >>= 1;
    }
    return (unsigned int)A;
}
// heap
#define prompt_addr 0xb0000200
#define hello_addr 0xb0000220
#define Unknown_Command_addr 0xb0000250
#define getline_buffer_addr 0xb0000300 // to 0xb0000CFF
#define getline_buffer ((char *)getline_buffer_addr)
#define sort_buffer_addr 0xb0000D00 // to 0xb0000FFF (max to 150 nums)
#define sort_buffer ((int *)sort_buffer_addr)

// keyboard driver
#define kb_snapshot_addr 0xb0000000                    // 到0xb00000FF
#define kb_snapshot(x) *((char *)kb_snapshot_addr + x) // 到0xa00010FF
#define kb_memmap_addr 0xa0001000                      // 到0xa00010FF
#define kb_memmap(x) *((char *)kb_memmap_addr + x)     // 到0xa00010FF

char kb_getc() {
    char c = 0;
    int kbc = 0xFFFFFFFF;
    for (int i = 0; i < 0xFF; i++) {
        if (kb_snapshot(i) != kb_memmap(i) && kb_snapshot(i) == 0) {
            kb_snapshot(i) = kb_memmap(i);
            kbc = i;
            break;
        }
        kb_snapshot(i) = kb_memmap(i);
    }
    if (kbc != 0xFFFFFFFF) {
        //*((volatile unsigned *)0x1004F000) = kbc;
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

// console driver
typedef struct console {
    char *data;
    int ptr;
    int *conptr;
    int size, line_size;
} console;

void console_clear(console *con) {
    con->ptr = 0;
    *(con->conptr) = con->ptr;
    for (int i = 0; i < con->size; i++) {
        *(con->data + i) = 0;
    }
}

void console_putc(console *con, char c) {
    if (con->ptr < con->size) {
        if (c == '\n' && con->size - con->ptr > con->line_size) {
            con->ptr = con->ptr + con->line_size -
                       umod((con->ptr + con->line_size), con->line_size);
        } else {
            *(con->data + con->ptr) = c;
            con->ptr++;
        }
        *(con->conptr) = con->ptr;
    }
}
#define conBuffer_char(con, ptr) (ptr < con->size ? con->data[ptr] : 0)
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
void console_backspace(console *con) {
    if (con->ptr > 0) {
        con->ptr--;
        if (*(con->data + con->ptr) == 0) {
            while (*(con->data + con->ptr) == 0 &&
                   umod(con->ptr, con->line_size) != 0)
                con->ptr--;
            if (*(con->data + con->ptr) != 0) {
                con->ptr++;
            }
        }
        *(con->data + con->ptr) = 0;
        *(con->conptr) = con->ptr;
    }
}

void console_moveptr(console *con, int c) {
    if (c == 0x11) {
        if (con->ptr >= con->line_size) {
            con->ptr -= con->line_size;
        }
    }
    if (c == 0x12) {
        if (con->ptr < con->size - con->line_size) {
            con->ptr += con->line_size;
        }
    }
    if (c == 0x13) {
        if (umod(con->ptr, con->line_size) != 0) {
            con->ptr--;
        }
    }
    if (c == 0x14) {
        if (umod(con->ptr, con->line_size) != (con->line_size - 1)) {
            con->ptr++;
        }
    }
    *(con->conptr) = con->ptr;
}

void console_backspace_inline(console *con) {
    if (con->ptr < con->size && con->ptr > 0) {
        while (con->data[con->ptr - 1] == 0 && con->ptr > 0) {
            int i;
            con->ptr--;
            for (i = con->ptr; umod((i + 1), con->line_size) != 0; i++) {
                console_putc_at(con, con->data[i + 1], i);
            }
            *(con->conptr) = con->ptr;
        }
        int i;
        con->ptr--;
        for (i = con->ptr; umod((i + 1), con->line_size) != 0; i++) {
            console_putc_at(con, con->data[i + 1], i);
        }
        *(con->conptr) = con->ptr;
    }
}
int print_int(console *con, unsigned x, unsigned first_call) {
    int ret;
    if (x != 0)
        ret = print_int(con, udiv(x, 10), 0);
    else {
        if (first_call != 0)
            console_putc(con, '0');
        return 0;
    }
    console_putc(con, umod(x, 10) + '0');
    return ret + 1;
}
int print_signedInt(console *con, unsigned x, unsigned first_call) {
    if (x & 1 << 31) {
        console_putc(con, '-');
        print_int(con, (int)x * -1, 1);
    } else {
        print_int(con, x, 1);
    }
}
#define getc_fromStr(str, addr) (char)*((char *)str + addr)
void console_nputline(console *con, char *str, int max_len) {
    for (int i = 0; getc_fromStr(str, i) != 0 && i < max_len; i++) {
        console_putc(con, getc_fromStr(str, i));
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
char getc() { return kb_getc(); }
void console_autorollUp(console *con) {
    if (con->ptr >= con->size - con->line_size) {
        console_rollUp(con);
    }
}
void get_line(console *con) { // 不包括\n
    int i = 0;
    char c = getc();
    int start = con->ptr;
    while (1) {
        c = getc();
        if (c != 0x0) {
            if (c == 0x08 && con->ptr > start) {
                console_backspace_inline(con);
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
    for (int j = 0; j < i; j++) {
        getline_buffer[j] = con->data[start + j];
    }
    getline_buffer[i] = 0;
}

// apps
void hi(console *con, char *hello) {
    console_nputline(con, hello, 100);
    console_nputline(con, getline_buffer + 3, 100);
    console_putc(con, ' ');
    for (int i = 0; i < 5; i++)
        console_putc(con, '!');
    console_putc(con, '\n');
    console_autorollUp(con);
}
void print_time(console *con) {

    unsigned time_ms = TIME_MS;
    unsigned int h = udiv(time_ms, (1000 * 60 * 60));
    unsigned int m = udiv(time_ms, (1000 * 60));
    unsigned int s = udiv(time_ms, (1000));
    print_int(con, h, 1);
    console_putc(con, ':');
    print_int(con, m, 1);
    console_putc(con, ':');
    print_int(con, s, 1);
    console_putc(con, '\n');
    console_autorollUp(con);
}

void fib(console *con) {
    int i = 3;
    while (getline_buffer[i] < '0' || getline_buffer[i] > '9') {
        i++;
        write2LED(0);
    }
    int n = 0;
    while (getline_buffer[i]) {
        n = umul(n, 10);
        n += getline_buffer[i] - '0';
        i++;
    }
    int a = 1, b = 1, c;
    write2LED(n);
    if (n < 2)
        console_putc(con, '0');
    else {
        console_putc(con, '1');
        console_putc(con, '\n');
        console_autorollUp(con);
        console_putc(con, '1');
        console_putc(con, '\n');
        console_autorollUp(con);
        for (int j = 0; j < n - 2; j++) {
            // write2LED(j);
            c = a + b;
            b = a;
            a = c;
            print_int(con, c, 1);
            console_putc(con, '\n');
            console_autorollUp(con);
        }
    }
    console_putc(con, '\n');
    console_autorollUp(con);
}
#define not_a_num(x) (x < '0' || x > '9')
#define swap(a, b) a ^= b, b ^= a, a ^= b;
void sort(console *con) {
    console_clear(con);
    while (1) {
        get_line(con);
        int num = 0;
        int i;
        if (getline_buffer[0] == 'e' && getline_buffer[1] == 'x' &&
            getline_buffer[2] == 'i' && getline_buffer[3] == 't') {
            break;
        }
        char last_simble = 0;
        int meet_num = 0;
        sort_buffer[num] = 0;
        for (i = 0; getline_buffer[i] != 0 && i < con->size; i++) {
            if (not_a_num(getline_buffer[i])) {
                if (meet_num != 0 && !not_a_num(getline_buffer[i - 1])) {
                    if (last_simble == '-') {
                        sort_buffer[num] *= -1;
                    }
                    num++;
                    sort_buffer[num] = 0;
                }
            } else {
                meet_num = 1;
                if (not_a_num(getline_buffer[i - 1])) {
                    last_simble = getline_buffer[i - 1];
                }
                sort_buffer[num] *= 10;
                sort_buffer[num] += getline_buffer[i] - '0';
            }
        }
        if (not_a_num(getline_buffer[i - 1])) {
            num--;
        } else if (last_simble == '-') {
            sort_buffer[num] *= -1;
        }
        write2LED(num);
        for (int j = num; j > 0; j--) {
            for (int k = 0; k < j; k++) {
                if (sort_buffer[k] > sort_buffer[k + 1]) {
                    swap(sort_buffer[k], sort_buffer[k + 1]);
                }
            }
        }
        for (int j = 0; j <= num; j++) {
            print_signedInt(con, sort_buffer[j], 1);
            console_putc(con, ' ');
        }
        console_putc(con, '\n');
        console_autorollUp(con);
    }
    console_clear(con);
}

#define MAX_SIZE 100

typedef struct {
    int top;
    unsigned data[MAX_SIZE];
} NumStack;

typedef struct {
    int top;
    char data[MAX_SIZE];
} OpStack;

void pushNum(NumStack *s, unsigned num) { s->data[++s->top] = num; }

unsigned popNum(NumStack *s) { return s->data[s->top--]; }

void pushOp(OpStack *s, char op) { s->data[++s->top] = op; }

char popOp(OpStack *s) { return s->data[s->top--]; }

int isOperator(char c) { return c == '+' || c == '-' || c == '*' || c == '/'; }

int precedence(char op) {
    if (op == '+' || op == '-')
        return 1;
    else if (op == '*' || op == '/')
        return 2;
    else
        return 0;
}

void applyOp(NumStack *nums, char op) {
    unsigned b = popNum(nums);
    unsigned a = popNum(nums);
    if (op == '+')
        pushNum(nums, a + b);
    else if (op == '-')
        pushNum(nums, a - b);
    else if (op == '*')
        pushNum(nums, umul(a, b));
    else if (op == '/')
        pushNum(nums, udiv(a, b));
}

unsigned strlen(const char *s) {
    unsigned len = 0;
    for (; *(s + len) != 0; len++)
        ;
    return len;
}

unsigned evaluate(const char *expression) {
    NumStack nums;
    nums.top = -1;
    OpStack ops;
    ops.top = -1;
    for (int i = 0; expression[i] != '\0'; ++i) {
        if (expression[i] == ' ') {
            continue;
        } else if (expression[i] == '(') {
            pushOp(&ops, expression[i]);
        } else if (!not_a_num(expression[i])) {
            unsigned num = 0;
            while (i < strlen(expression) && !not_a_num(expression[i])) {
                num = num * 10 + (expression[i] - '0');
                i++;
            }
            i--;
            pushNum(&nums, num);
        } else if (expression[i] == ')') {
            while (ops.top != -1 && ops.data[ops.top] != '(') {
                applyOp(&nums, popOp(&ops));
            }
            popOp(&ops);
        } else if (isOperator(expression[i])) {
            while (ops.top != -1 &&
                   precedence(ops.data[ops.top]) >= precedence(expression[i])) {
                applyOp(&nums, popOp(&ops));
            }
            pushOp(&ops, expression[i]);
        }
    }
    while (ops.top != -1) {
        applyOp(&nums, popOp(&ops));
    }
    return popNum(&nums);
}

void calculator(console *con) {
    console_clear(con);
    while (1) {
        get_line(con);
        if (getline_buffer[0] == 'e' && getline_buffer[1] == 'x' &&
            getline_buffer[2] == 'i' && getline_buffer[3] == 't') {
            break;
        }
        print_int(con, evaluate(getline_buffer), 1);
        console_putc(con, '\n');
        console_autorollUp(con);
    }
    console_clear(con);
}
int main() {
    char c;
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    con0.conptr = (int *)0xa0000FFF;
    char *hello = (char *)hello_addr;
    hello[0] = 'H';
    hello[1] = 'e';
    hello[2] = 'l';
    hello[3] = 'l';
    hello[4] = 'o';
    hello[5] = ' ';
    hello[6] = 0;
    char *promp = (char *)prompt_addr;
    promp[0] = 'C';
    promp[1] = 'X';
    promp[2] = '_';
    promp[3] = 'L';
    promp[4] = 'i';
    promp[5] = '@';
    promp[6] = 'L';
    promp[7] = 'C';
    promp[8] = 'o';
    promp[9] = 'r';
    promp[10] = 'e';
    promp[11] = ':';
    promp[12] = '#';
    promp[13] = '~';
    promp[14] = ' ';
    promp[15] = 0;
    //"CX_Li@LCore ~ "
    char *UC = (char *)Unknown_Command_addr;
    UC[0] = 'U';
    UC[1] = 'n';
    UC[2] = 'k';
    UC[3] = 'n';
    UC[4] = 'o';
    UC[5] = 'w';
    UC[6] = 'n';
    UC[7] = ' ';
    UC[8] = 'C';
    UC[9] = 'o';
    UC[10] = 'm';
    UC[11] = 'm';
    UC[12] = 'a';
    UC[13] = 'n';
    UC[14] = 'd';
    UC[15] = ' ';
    UC[16] = 0;
    console_nputline(&con0, promp, 100);
    while (1) {
        get_line(&con0);
        // console_nputline(&con0, getline_buffer, 100);
        // console_putc(&con0, '\n');
        if (getline_buffer[0] == 'h' && getline_buffer[1] == 'i' &&
            getline_buffer[2] == ' ') {
            hi(&con0, hello);
        } else if (getline_buffer[0] == 'c' && getline_buffer[1] == 'l' &&
                   getline_buffer[2] == 'e' && getline_buffer[3] == 'a' &&
                   getline_buffer[4] == 'r' && getline_buffer[5] == 0) {
            console_clear(&con0);
        } else if (getline_buffer[0] == 't' && getline_buffer[1] == 'i' &&
                   getline_buffer[2] == 'm' && getline_buffer[3] == 'e' &&
                   getline_buffer[4] == 0) {
            print_time(&con0);
        } else if (getline_buffer[0] == 'f' && getline_buffer[1] == 'i' &&
                   getline_buffer[2] == 'b' && getline_buffer[3] == ' ') {
            fib(&con0);
        } else if (getline_buffer[0] == 's' && getline_buffer[1] == 'o' &&
                   getline_buffer[2] == 'r' && getline_buffer[3] == 't' &&
                   getline_buffer[4] == 0) {
            sort(&con0);
        } else if (getline_buffer[0] == 'c' && getline_buffer[1] == 'a' &&
                   getline_buffer[2] == 'l' && getline_buffer[3] == 0) {
            calculator(&con0);
        } else {
            console_nputline(&con0, UC, 100);
            for (int i = 0; i < 5; i++)
                console_putc(&con0, '!');
            console_putc(&con0, '\n');
        }
        console_nputline(&con0, promp, 100);
        /*
        c = getc();
        if (c != 0) {
            if (c == 0x08)
                console_backspace_inline(&con0);
            else if (c == 0x11 || c == 0x12 || c == 0x13 || c == 0x14)
                console_moveptr(&con0, c);
            else
                console_insert_char(&con0, c);
        }
        */
    }
    return 0;
}
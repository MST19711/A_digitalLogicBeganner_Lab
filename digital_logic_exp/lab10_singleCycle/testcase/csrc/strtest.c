char str[100] = "Hello, world!";
struct test {
    int a;
    char X[100];
} T = {.a = 1, .X = "test"};
int main() {
    char p[1000];
    for (int i = 0; i < 100; i++) {
        p[i] = str[i];
    }
}
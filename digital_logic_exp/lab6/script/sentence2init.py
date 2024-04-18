
offset = int(input())
f = input()
i = 0
for c in f:
    print("text[{}] = 8'd{};".format(str(i + offset), str(ord(c))))
    i += 1
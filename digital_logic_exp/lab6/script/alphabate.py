import string

# 遍历小写字母表
i = 0
for letter in string.ascii_lowercase:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(letter))))
    i += 1

print("assign text[{}] = 8'd32;".format(str(i)))  # 换行
i += 1
# 遍历大写字母表
for letter in string.ascii_uppercase:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(letter))))
    i += 1

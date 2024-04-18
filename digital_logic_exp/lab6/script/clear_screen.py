
offset = int(input())
len = int(input())
i = 0
for c in range(len):
    print("text[{}] = 8'd0;".format(str(i + offset)))
    i += 1
b = []
for i in range(0, 256):
    s = ""
    s = input()
    s.replace('@','')
    a = list(s.split(' '))
    t = []
    for j in a:
        if j != '':
            t.append(j)
    b.append(t)
    
print(b)

for i in b:
#    print("if(kbcode == 8'h{})     assign asciicode_r = 8'h{};".format(str(i[0][1:]), str(i[1]))) kb_mem
    print("kb_mem[{}] = 8'h{};".format(str(int(i[0][1:], 16)), str(i[1])))
import sys

# 检查是否有足够的命令行参数
if len(sys.argv) > 1:
    filename = sys.argv[1]  # 获取命令行中的第二个参数，即文件名
    print(f"操作的文件名为: {filename}")
else:
    print("请在命令行中指定文件名。")

# 指定要插入的文本
insert_text = "\tj\tmain\n"

# 读取文件内容
with open(filename, 'r', encoding='utf-8') as file:
    lines = file.readlines()

# 查找以".text"开头的行，并在其前面插入文本
for i, line in enumerate(lines):
    if line.lstrip().startswith('.text'):
        lines.insert(i, insert_text)
        break  # 找到第一个匹配的行后停止循环

# 将修改后的内容写回文件
with open(filename, 'w', encoding='utf-8') as file:
    file.writelines(lines)
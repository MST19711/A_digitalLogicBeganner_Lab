import sys
import r2pipe

# 获取命令行参数
path = sys.argv[1]
binPath = path.replace("hex", "bin")
with open(path, 'r') as hex_file, open(path.replace("hex", "bin"), 'wb') as bin_file:
    #bin_file.write(bytes.fromhex("0640"))
    # 读取文本文件的每一行
    for line in hex_file:
        # 去除行尾的空白字符（如果有的话）
        line = line.strip()
        # 忽略空行或注释（以 # 开头的行）
        if not line or line.startswith('#'):
            continue
        # 将十六进制字符串转换为字节
        byte_data = bytes.fromhex(line.replace('@', ''))
        # 写入二进制文件
        bin_file.write(byte_data)
    
r2 = r2pipe.open(binPath)
r2.cmd('e cfg.bigendian = false')
r2.cmd('e asm.arch = riscv')
r2.cmd('e asm.cset = false')
r2.cmd('e asm.align = 4')
# 执行 radare2 命令
r2.cmd("aaa")  # 分析文件
info = r2.cmd("iI")  # 获取二进制文件信息
disassembly = r2.cmd('pD ')
print(disassembly)
# 关闭 r2pipe
r2.quit()

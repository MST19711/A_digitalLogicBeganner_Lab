.PHONY: test
# 指定编译器
CC := riscv64-unknown-elf-gcc

# 指定链接器脚本
LD_SCRIPT := linker.ld

# 指定源文件目录
SRC_DIR := ./
INC_DIR := ./

# 指定构建目录
BUILD_DIR := build

# 自动查找所有的.c文件
SOURCES := $(shell find $(SRC_DIR) -name '*.c')
INCS := $(shell find $(INC_DIR) -name '*.h')

# 将源文件列表转换为.o文件列表
OBJECTS := $(SOURCES:%.c=$(BUILD_DIR)/%.o)

# 最终目标文件名
TARGET := xterm.o

# 默认目标
all: $(TARGET)

# 链接目标
$(TARGET): $(OBJECTS)
	$(CC) -r -o $@ $^ 
# -T $(LD_SCRIPT) -Wl,--no-relax -static-pie

# 编译.o文件
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) -nostdlib -nostdinc -fPIC -c $< -o $@

# 清理构建文件
clean:
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: all clean

test:
	riscv64-unknown-elf-gcc -c -nostdlib -march=rv32i -mabi=ilp32 csrc/strtest.c -o strtest.S
	riscv64-unknown-elf-ld -melf32lriscv -o final.o init.o main.o
	riscv64-unknown-elf-objcopy -O binary -j .text strtest.o strtest.bin
	riscv64-unknown-elf-objdump -D -b binary strtest.bin -mriscv
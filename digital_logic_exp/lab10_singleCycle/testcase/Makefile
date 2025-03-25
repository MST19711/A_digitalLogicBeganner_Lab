.PHONY: test lab10_xterm lab10_xterm_withAllloc

XLEN ?=64

RISCV_PREFIX ?=riscv$(XLEN)-unknown-elf-

GCC_WARNS := -Wall -Wextra -Wconversion -pedantic -Wcast-qual -Wcast-align -Wwrite-strings

RISCV_GCC_OPTS ?= -static -march=rv32i -mabi=ilp32 -fwhole-program -mcmodel=medany -fvisibility=hidden -Tsections.ld -nostdlib -nolibc -nostartfiles ${GCC_WARNS}

RISCV_GCC_OPTS_ALLOC ?= -static -march=rv32i -mabi=ilp32 -fwhole-program -mcmodel=medany -fvisibility=hidden -Tsections_alloc.ld -nostdlib -nolibc -nostartfiles ${GCC_WARNS}

RISCV_OBJDUMP ?=$(RISCV_PREFIX)objdump --disassemble-all
				--disassemble-zeroes --section=.text --section=.text.startup
				--section=.text.init --section=.data

test:
	riscv64-unknown-elf-gcc -c -nostdlib -march=rv32i -mabi=ilp32 csrc/strtest.c -o strtest.S
	riscv64-unknown-elf-ld -melf32lriscv -o final.o init.o main.o
	riscv64-unknown-elf-objcopy -O binary -j .text strtest.o strtest.bin
	riscv64-unknown-elf-objdump -D -b binary strtest.bin -mriscv

lab10_xterm:
	riscv64-unknown-elf-gcc -c $(RISCV_GCC_OPTS) csrc/lab10_xterm.c -o lab10_xterm.o
	riscv64-unknown-elf-gcc $(RISCV_GCC_OPTS) -e entry lab10_xterm.o -o lab10_xterm.elf
	$(RISCV_OBJDUMP) lab10_xterm.elf > lab10_xterm.dump
	riscv64-unknown-elf-objcopy -O binary -j .text lab10_xterm.elf lab10_xterm.bin
#	python3 ./script/addj2main.py lab10_xterm.S
#	riscv64-unknown-elf-gcc -c -march=rv32i -mabi=ilp32 -fwhole-program -nostdlib -ffreestanding -c lab10_xterm.S  -o lab10_xterm.o
#	riscv64-unknown-elf-objcopy -O -j .text lab10_xterm.elf lab10_xterm.bin  
	riscv64-unknown-elf-objdump -D -b binary lab10_xterm.bin -mriscv > lab10_xterm.asm
	python3 ./script/bin2hex.py lab10_xterm.bin

lab10_xterm_withAllloc:
	riscv64-unknown-elf-gcc -c $(RISCV_GCC_OPTS_ALLOC) csrc/lab10_xterm_withAllloc.c -o lab10_xterm_withAllloc.o
	riscv64-unknown-elf-gcc $(RISCV_GCC_OPTS_ALLOC) -e entry lab10_xterm_withAllloc.o -o lab10_xterm_withAllloc.elf
	$(RISCV_OBJDUMP) lab10_xterm_withAllloc.elf > lab10_xterm_withAllloc.dump
	riscv64-unknown-elf-objcopy -O binary -j .text lab10_xterm_withAllloc.elf lab10_xterm_withAllloc.bin
	riscv64-unknown-elf-objdump -D -b binary lab10_xterm_withAllloc.bin -mriscv > lab10_xterm_withAllloc.asm
	python3 ./script/bin2hex.py lab10_xterm_withAllloc.bin

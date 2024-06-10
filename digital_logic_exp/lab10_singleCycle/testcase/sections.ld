ENTRY(main)
OUTPUT_FORMAT("elf32-littleriscv")

SECTIONS{
    . = 0x00000000;
    .text : {
        *(entry)
        lab10_xterm.o (.text)
        *(.text*)
        *(text_end)
    }
    etext = .;
    _etext = .;
}
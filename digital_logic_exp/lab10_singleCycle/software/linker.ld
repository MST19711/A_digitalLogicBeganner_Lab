ENTRY(main)
MEMORY
{
  RAM (rwa) : ORIGIN = 0xb0000000, LENGTH = 0x10000
  ROM (rx) : ORIGIN = 0x00000000, LENGTH = 0x40000
}

SECTIONS
{
  .text : AT(0x00000000) { *(.text) }
  .data : AT(0xb0000000) { *(.data .data.*)
            . = ALIGN(8);
            PROVIDE(__global_pointer$ = . + 0x800);
            *(.sdata .sdata.*)
          }
  .bss : AT(0xb0000100) {  __bss_start = .;
            *(.bss)
            _end = .;
          }
}

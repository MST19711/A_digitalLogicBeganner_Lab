# A Lab for digital logic designing beganner

> 来自NJU CS课程《数字逻辑与计算机组成试验》

(branch `main` has been abandoned)

Some toy digital circuit, by a begainner of digital logic designning:
- lab1: Some basic combinatorial logic curcuit
- lab2: Some basic sequinoctial logic curcuit(like LFSR)
- lab3: A simple ALU
- lab4: Multiplier and divider
- lab5: PS2(on USB) keyboard
- lab6: VGA driver (and a calculator get input from PS2 keyboard and display on VGA). Attention, some code (may in VGACtrl.v) about VGA is design for [NVBoard](https://github.com/NJU-ProjectN/nvboard) emulator, please check if it can run on your physical VGA device!!!!!
- lab7: simple RAM
- lab8: A simple single cycle CPU, support a subset of RISC-V.
- lab9: A simple pipeline CPU. Implementation has some bugs, and it don‘t work. Sorry.
- lan10: A Combination of lab5, lab6, lab7 and lab8, and some simple c program (in `testcase`) which can be complied and worked on the circuit.

For lab from lab6 to lab10, you can easily use [NVBoard](https://github.com/NJU-ProjectN/nvboard) to test the design by adding path of [NVBoard](https://github.com/NJU-ProjectN/nvboard) on your computer to $PATH and running `make run` at corresponding lab path (for example, for lab6, at `A_digitalLogicBeganner_Lab/digital_logic_exp/lab6`).
The design in from lab6 to lab10 is design for [NVBoard](https://github.com/NJU-ProjectN/nvboard). If you run it on real FPGA and meet some error, you may get help from branch `main`.

**Please do not copy code in this repository for homework or exam.** Hope this repository will help you.

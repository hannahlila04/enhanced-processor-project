# Enhanced-Processor-Project
 
This project involved constructing a simple processor, and then adding additional features in order to improve the procesor's functionality. The processor in question had a unique ISA with 8 registers, r0 to r7, and 16-bit address space. This project was decomposed into 7 parts:

**Part 1:** The mv, mvt, add, and sub instructions were implemented

**Part 2:** Memory block and program counter was connected to the processor

**Part 3:** The processor code was augmented to include ld, and, and st instructions

**Part 4:** A verilog module called seg7 was created, allowing the processor to write data to the DE1-SoC HEX display

**Part 5:** The branch instructions were implemented as follows

b: branch (no conditions, always branches)
beq: branch if equal (to zero)
bne: branch if not equal (to zero)
bcc: branch if carry is clear
bcs: branch if carry is set
bpl: branch if positive
bmi: branch if negative

**Part 6:** An assembly-language program was written for this processor. The program displayed a binary counter on the LED port, incrementing in an endless loop. The assembly program was converted to a MIF file. The existing memory block was replaced with this MIF file and the circuit was then tested on the DE1-SoC board.

**Part 7:** Another assembly-language program was written and tested using this processor. This time the program displayed a counter on the seven-segment display, displaying decimal numbers from 0 to 65535 (the maximum value that could be loaded into the 16-bit address)

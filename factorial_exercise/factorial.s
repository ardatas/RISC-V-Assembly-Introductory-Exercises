
.globl _start
.globl __start
.option norelax



// Start address after reset
.org 0x00000200

.text

__start:
_start:
	li a0, 5
	
	jal factorial
	ebreak
	
factorial:
	#check base case ( return 1 if n <=1 
	addi t0, x0, 1
	ble a0, t0, base
	
	
	#save on stack
	addi sp, sp, -16
	sw a0, 12(sp)
	sw ra, 8(sp)
	
	
	# call factorial (n-1)
	addi a0, a0, -1
	jal factorial
	
	# lade n und multipliziere mit n-1
	lw t0, 12(sp)
	mul a0, t0, a0
	
	# restore
	
	lw      ra, 8(sp)           # Restore return address
    addi    sp, sp, 16           # Deallocate stack
    ret
    
base:
	li a0, 1
	ret
	
	

.org 0x400
.data

data_1:	.word	1, 2, 3, 4	// example how to fill data words

text_1: .asciz  "Hello world.\n"    // store zero terminated ASCII text

// if whole source compile is OK the switch to core tab
#pragma qtrvsim tab core

// The sample can be compiled by full-featured riscv64-unknown-elf GNU tool-chain
// for RV32IMA use
// riscv64-unknown-elf-gcc -c -march=rv64ima -mabi=lp64 template.S
// riscv64-unknown-elf-gcc -march=rv64ima -mabi=lp64 -nostartfiles -nostdlib template.o
// for RV64IMA use
// riscv64-unknown-elf-gcc -c -march=rv32ima -mabi=ilp32 template.S
// riscv64-unknown-elf-gcc -march=rv32ima -mabi=ilp32 -nostartfiles -nostdlib template.o
// add "-o template" to change default "a.out" output file name

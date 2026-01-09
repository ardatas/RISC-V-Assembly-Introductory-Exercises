.globl _start


.org 0x200
.text


_start:
    li a0, 4 ;test with n = 4, return value should be in a0
    jal ra, calc_Fn
    ebreak


# Recursive Function for Calculating F_n
# Definition: F_0 = 3, F_1 = 5, F_n = n + F_n-2 * 5 for n > 1
# Arguments:
# a0: n (the index of the sequence)
# Return:
# a0: The value of F_n 


calc_Fn:
	
	li t0, 0
	beq a0, t0, zero_case
	
	li t0, 1
	beq a0, t0, one_case
	
	addi sp, sp, -16
	sw ra, 12(sp)
	sw a0, 8(sp)
	
	addi a0, a0, -2
	jal calc_Fn

	
	li t1, 5	
	mul a0, a0, t1
	
	lw t0, 8(sp)	
	add a0, a0, t0
	
	
	#restore
	lw ra, 12(sp)
	addi sp, sp, 16
	ret 

zero_case: 
	li a0, 3
	ret
	
one_case: 
	li a0, 5
	ret
   
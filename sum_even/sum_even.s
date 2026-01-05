.globl _start

.org 0x400
.data

array_data: .word 2, 4, 1, 8, 1  ; Example array

.org 0x200
.text

_start:
    la a0, array_data  ; Pointer to the start of the array
    li a1, 5          ; Length of the array
    jal ra, sum_even_numbers ; Result in a0 -> 30 = 0x1e
    ebreak

# Function sum_even_numbers
# Input: 
#   a0: Pointer to the array
#   a1: Length of the array
# Output:
#   a0: Sum of the even numbers in the array

sum_even_numbers:
	addi t2, x0, 0
	
loop:

	beq a1, zero, end
	lw t1, 0(a0)			# load the first element in the array
	andi t0, t1, 0x1		# mask
	
	beq t0, x0, add_to_sum
	addi a0, a0, 4
	addi a1, a1, -1
	j loop
	
add_to_sum:
	add t2, t2, t1
	addi a0, a0, 4
	addi a1, a1, -1
	j loop

end:
	mv a0, t2
	ret	
	
	
	
	
	
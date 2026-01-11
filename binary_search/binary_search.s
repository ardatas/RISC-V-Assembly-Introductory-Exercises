.globl _start

.org 0x400
.data
    array: .word -100, 0, 100, 2100, 300

.org 0x200
.text

_start:
    li a0, 3800
    la a1, array
    addi a2, a1, 20  ; array consists of 5 elements, each one being 4 bytes big
    jal ra, binary_search
    ebreak

# Function decimal_to_binary
# Input:    a0 - Value to find
#           a1 - Start address of search interval
#           a2 - End address of search interval
# Output:   a0 - Address of the found element in the original array, or -1 if not found

binary_search:
	
	bgt a1, a2, not_found
	
	#find mid address
	
	sub t0, a2, a1
	srli t0, t0, 2
	srli t0, t0, 1
	slli t0, t0, 2
	
	add t0, t0, a1
		
	lw t1, 0(t0)
	
	beq a0, t1, found
	blt a0, t1, left
	
	addi t0, t0, 4
	mv a1, t0
	j binary_search
	
left:
	addi t0, t0, -4
	mv a2, t0
	j binary_search
	
found:
	mv a0, t0
	ret
	
not_found:
	li a0, -1
	ret
	

	
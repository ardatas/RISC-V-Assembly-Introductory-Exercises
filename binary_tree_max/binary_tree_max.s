.globl _start

.org 0x600
.data

; Example tree, don`t mind this part
binary_tree: 
    .word 3, 1548, 1560  ;3
    .word 2, 1572, 0     ;2
    .word 8, 1584, 1596  ;8 
    .word 4, 0, 0        ;4
    .word 5, 0, 0        ;5
    .word -6, 0, 0        ;-6

.org 0x200
.text

_start:
    la a0, binary_tree  ; Pointer to the start
    jal ra, binary_tree_max ; a0 should be returned as 8
    ebreak

# Assume a0 contains the address of the current node
# The binary tree node is assumed to have the following structure:
# 0 bytes: value (integer)
# 4 bytes: left child (pointer)
# 8 bytes: right child (pointer)

binary_tree_max:
	
	
	addi sp, sp, -16
	sw ra, 12(sp)
	sw s0, 8(sp)
	sw s1, 4(sp)

	mv s1, a0		# save current pointer 
	lw s0, 0(a0)	# load the value at the top of the binary tree
	
left:
	lw t0, 4(s1)
	#check if null if then skip
	beq t0, x0, right
	
	# recursive call on left child
	mv a0, t0
	jal binary_tree_max
	
	# check if left max <= current max
	ble a0, s0, right
	#otherwise update the max value
	mv s0, a0
	
right:
	
	lw t1, 8(s1)
	beq t1, x0, end
	
	mv a0, t1
	jal binary_tree_max
	ble a0, s0, end
	mv s0, a0
	
end:
	mv a0, s0
	
	lw s1, 4(sp)
	lw s0, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

	
	
	
	
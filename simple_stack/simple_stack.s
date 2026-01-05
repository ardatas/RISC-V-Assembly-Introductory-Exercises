.globl _start

.org 0x200
.text

_start:
	li sp, 0x00022864
    # Testing the stack: Push and Pop
    li a0, 0        ; Push operation
    li a1, 42       ; Value to push
    jal ra, stack_operation

//    li a0, 1        ; Pop operation
//    jal ra, stack_operation
//    
    li a0, 0
    li a1, 99
    jal ra, stack_operation
    
    li a0, 1
    jal ra, stack_operation
    
    li a0, 0
    li a1, 100
    jal ra, stack_operation
    ebreak
    
    

# Function for stack operations (Push or Pop)
# Input: a0 - Operation (0 for Push, 1 for Pop), a1 - Value for Push
# Output: a0 - Value on Pop
stack_operation:

	beq a0, t0, push
	j pop
	
push: 
	addi sp, sp, -4
	sw a1, 0(sp)
	ret
	
pop:
	lw a0, 0(sp)
	sw x0, 0(sp)			# non standard stack pop
	addi sp, sp, 4
	ret
	
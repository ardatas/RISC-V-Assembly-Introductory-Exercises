.globl _start

.org 0x400
.data

binary_array: .byte 12, 1, -1, 9, 4, 55, 8  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to array
    li a1, 7             ; Length of array
    jal ra, bubblesort ; a0 = 0x25 
    ebreak

# Function bubblesort
# Input: a0 - Pointer to the binary array
#        a1 - Length of the passed array
# Output:

bubblesort:

	addi sp, sp, -16
    sw s0, 12(sp)           # Save s0
    sw s1, 8(sp)            # Save s1
    sw s2, 4(sp)            # Save s2
    sw s3, 0(sp)            # Save s3
 
    # copy values
    add s0, x0, a0	# array pointer
        
    add s2, x0, a1	# first loop counter
    addi s2, s2, -1
    
    add s3, x0, a1	# second loop counter
    addi s3, s3, -1
    
first_loop: 
	
	beq s2, zero, end
	
	add s1, x0, s0
	mv t0, s2
	
second_loop: 

	beq t0, zero, end_second_loop 
	
	lb t2, 0(s1)				
	lb t3, 1(s1)
	
	blt t2, t3, no_swap
	
	sb t3, 0(s1)
	sb t2, 1(s1)

		
no_swap: 
	addi t0, t0, -1
	addi s1, s1, 1
	j second_loop

end_second_loop:
	addi s2, s2, -1
	j first_loop

end:
	
	lw s3, 0(sp)
    lw s2, 4(sp)
    lw s1, 8(sp)
    lw s0, 12(sp)
    addi sp, sp, 16
	ret
	
	
	
	

	
	
	
	
	
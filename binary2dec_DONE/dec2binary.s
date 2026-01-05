.globl _start

.org 0x400
.data

binary_result: .space 32 # Reserve space for up to 32 bits + sentinel

.org 0x200
.text

_start:
addi a0, zero, 13 # Input: decimal number to convert
la a1, binary_result # Output: pointer to result array
jal ra, decimal_to_binary
ebreak

# Function decimal_to_binary
# Input: a0 - Decimal number to convert
# a1 - Pointer to output array
# Output: Array filled with binary digits (MSB first) + sentinel (255)


decimal_to_binary:
    # TODO: Your code here!
    la t6, binary_result;
	   	
divide:
   	beq a0, zero, add_sentinel  	# if the division result is 0, stop
    
    andi t1, a0, 1
	sb t1, 0(a1)

    addi a1, a1, 1
 
	srli a0, a0, 1 		#  a0 / 2
   	j divide  
    
add_sentinel:
	addi t1, zero, 255
	sb t1, 0(a1)
	
	addi t0, t6, 0
	addi t1, a1, -1
	
	
revert: 
	bge t0, t1, end
	
	lb t2, 0(t0)
	lb t3, 0(t1)

	sb t2, 0(t1)	
	sb t3, 0(t0)
	
	addi t0, t0, 1
	addi t1, t1, -1
	j revert
	
	 	
end :
	ret 	




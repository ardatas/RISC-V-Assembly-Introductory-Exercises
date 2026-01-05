.globl _start

.org 0x400
.data

binary_array: .byte 1, 0, 0, 1, 0, 1, 2  ; Example binary array

.org 0x200
.text

_start:
    la a0, binary_array  ; Pointer to the start
    jal ra, binary_to_decimal ; a0 = 0x25 
    ebreak

# Function binary_to_decimal
# Input: a0 - Pointer to the binary array
# Output: a0 - The decimal representation of the binary number

binary_to_decimal:
	
	addi t0, zero, 0
	addi t1, zero, 2
	

to_string:
	lb t2, 0(a0)
	beq t2, t1, end
	
	
	slli t0, t0, 1
	or t0, t0, t2
	
	addi a0, a0, 1
	j to_string

end:
	add a0, zero, t0
	ret

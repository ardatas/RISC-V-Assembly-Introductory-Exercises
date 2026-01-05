.globl _start

.org 0x200
.text

_start:
    li a0, 0xff0f  ; Example: 32-bit number
    jal ra, count_bits
    ebreak

# Function count_bits
# Arguments:
#   a0: a 32-bit number
# Outputs:
#   a0: Number of 0-bits
#   a1: Number of 1-bits

count_bits:
    addi t0, zero, 32
    addi a1, zero, 0 # bit counter for ones
    addi a2, zero, 0 # Bit counter for zeros
        
loop: 
	beq t0, zero, end_count
	addi t0, t0, -1
	
	andi t1, a0, 1
	beq t1, zero, addToA2
	
	addi a1, a1, 1
	srli a0, a0, 1
	j loop
	
addToA2:
	addi a2, a2, 1
	srli a0, a0, 1
	j loop
	
end_count:
	mv a0, a2
	ret

.globl _start

.org 0x400
.data

arr1: .word 123, -11, 10, 1000, 200

.org 0x200
.text

_start:
    la a0, arr1             ; pointer to array 
    addi a1, zero, 5        ; array length

    lw t0, 0(a0)            ; initialize first arr element for comparison
    addi a0, a0, 4          ; move pointer to next element
    addi a1, a1, -1         ; remaining length 
    jal ra, get_max

ebreak

# arguments:
#   a0: pointer to array
#   a1: length of arr
# returns:
#   a0: maximum 

get_max:
    beq a1, zero, end_loop
    lw t1, 0(a0)            ;load first value of array
    
    bge t1, t0, update_max

    addi a0, a0, 4 		    ; move the pointer 
    addi a1, a1, -1         
    j get_max;

update_max:
    mv t0, t1
    addi a0, a0, 4          ; move the pointer 
    addi a1, a1, -1         
    j get_max;

end_loop:
    mv a0, t0
    ret
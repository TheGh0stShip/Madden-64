.set noreorder
.section .text
func_800BAA80:
    lw $s3, 0x44($sp)
    lw $s2, 0x40($sp)
    lw $s1, 0x3C($sp)
    lw $s0, 0x38($sp)
    addiu $sp, $sp, 0x58
    jr $ra
     nop

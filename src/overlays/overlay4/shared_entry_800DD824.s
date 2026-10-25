.set noreorder
.section .text
func_800DD824:
    lw $ra, 0x3C($sp)
    lw $s4, 0x38($sp)
    lw $s3, 0x34($sp)
    lw $s2, 0x30($sp)
    lw $s1, 0x2C($sp)
    lw $s0, 0x28($sp)
    addiu $sp, $sp, 0x40
    jr $ra
     nop

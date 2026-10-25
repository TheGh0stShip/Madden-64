.set noreorder
.section .text
func_800BA0C8:
    lw $s3, 0x1C($sp)
    lw $s2, 0x18($sp)
    lw $s1, 0x14($sp)
    lw $s0, 0x10($sp)
    addiu $sp, $sp, 0x30
    jr $ra
     nop

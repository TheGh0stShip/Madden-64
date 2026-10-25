.text
.align 2
.set noreorder
.globl func_800AD3A8
.ent func_800AD3A8
func_800AD3A8:
    bnez        $v0, . + 4 + (-0x4B << 2)
    nop
    lw          $ra, 0xB4($sp)
    lw          $fp, 0xB0($sp)
    lw          $s7, 0xAC($sp)
    lw          $s6, 0xA8($sp)
    lw          $s5, 0xA4($sp)
    lw          $s4, 0xA0($sp)
    lw          $s3, 0x9C($sp)
    lw          $s2, 0x98($sp)
    lw          $s1, 0x94($sp)
    lw          $s0, 0x90($sp)
    addiu       $sp, $sp, 0xB8
    jr          $ra
    nop
.end func_800AD3A8

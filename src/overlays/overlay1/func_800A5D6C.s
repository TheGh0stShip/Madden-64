.text
.align 2
.set noreorder
.globl func_800A5D6C
.ent func_800A5D6C
func_800A5D6C:
    lw          $a0, 0x30($sp)
    lw          $a1, 0x34($sp)
    lw          $a2, 0x38($sp)
    lw          $a3, 0x3C($sp)
    jal         func_8009F1DC
    nop
    addu        $v0, $zero, $zero
    lw          $ra, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800A5D6C

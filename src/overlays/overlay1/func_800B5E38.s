.text
.align 2
.set noreorder
.globl func_800B5E38
.ent func_800B5E38
func_800B5E38:
    jal         func_80016FE4
    nop
    jal         func_8000CDC0
    nop
    jal         func_800334B8
    nop
    lw          $ra, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800B5E38

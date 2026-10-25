.text
.align 2
.set noreorder
.globl func_80094030
.ent func_80094030
func_80094030:
    sh          $v0, -0x4842($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80094030

.text
.align 2
.set noreorder
.globl func_800AE8E4
.ent func_800AE8E4
func_800AE8E4:
    sh          $v0, -0x4DA8($at)
    addiu       $v0, $zero, -0x2
    and         $v1, $v1, $v0
    sw          $v1, 0x14($a0)
    lw          $ra, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800AE8E4

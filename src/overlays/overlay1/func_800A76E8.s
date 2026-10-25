.text
.align 2
.set noreorder
.globl func_800A76E8
.ent func_800A76E8
func_800A76E8:
    sw          $a0, 0x20($s0)
    sw          $a1, 0x24($s0)
    sh          $a2, 0x5C($s0)
    sh          $a3, 0x5E($s0)
    sh          $t0, 0x60($s0)
    sh          $v0, 0x84($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A76E8

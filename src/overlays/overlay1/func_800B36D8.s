.text
.align 2
.set noreorder
.globl func_800B36D8
.ent func_800B36D8
func_800B36D8:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x4($a0)
    lbu         $v1, 0x64($s0)
    addiu       $v0, $zero, 0x33
    bne         $v1, $v0, .L800B3708
    nop
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    addiu       $v0, $zero, 0x2
    sw          $v0, 0xA0($s0)
.L800B3708:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B36D8

.text
.align 2
.set noreorder
.globl func_800AC744
.ent func_800AC744
func_800AC744:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4858
    sw          $s1, 0x14($sp)
    addiu       $s1, $zero, 0x3
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x1
    sw          $ra, 0x1C($sp)
.L800AC768:
    jal         func_800A80E4
    nop
    jal         func_8000BE80
    nop
    jal         func_800334B8
    nop
    lhu         $v0, 0x0($s0)
    bnez        $v0, .L800AC768
    nop
    lh          $a0, 0x18($s0)
    sh          $s1, 0x0($s0)
    lui         $at, 0x8009
    sb          $s2, -0x7F68($at)
    jal         func_800B0F38
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x4858
    lhu         $v1, 0x0($a0)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800AC7C4
    addiu       $s0, $zero, 0x2
    j           func_800A80C8
    sh          $zero, 0x0($a0)
.L800AC7C4:
    jal         func_8000BE80
    nop
    jal         func_800334B8
    nop
    jal         func_800A7AB0
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    bne         $v0, $s0, .L800AC7C4
    nop
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AC744

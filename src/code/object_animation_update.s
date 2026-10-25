.text
.align 2
.set noreorder
.globl object_animation_update
.ent object_animation_update
object_animation_update:
    addiu       $sp, $sp, -0x170
    sw          $s2, 0x150($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x16C($sp)
    sw          $fp, 0x168($sp)
    sw          $s7, 0x164($sp)
    sw          $s6, 0x160($sp)
    sw          $s5, 0x15C($sp)
    sw          $s4, 0x158($sp)
    sw          $s3, 0x154($sp)
    sw          $s1, 0x14C($sp)
    sw          $s0, 0x148($sp)
    lw          $s5, 0x14($s2)
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
    bnez        $s3, .L80057B10
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    nop
    beqz        $v0, .L80057EBC
    addu        $v0, $zero, $zero
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
.L80057B10:
    lbu         $v0, 0x0($s4)
    addiu       $s3, $s3, -0x1
    addiu       $s4, $s4, 0x1
    bnez        $s3, .L80057B40
    sll         $fp, $v0, 8
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057EBC
    addu        $v0, $zero, $zero
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
.L80057B40:
    lbu         $v0, 0x0($s4)
    addiu       $s3, $s3, -0x1
    addu        $fp, $fp, $v0
    addiu       $fp, $fp, -0x2
    blez        $fp, .L80057EB0
    addiu       $s4, $s4, 0x1
    addiu       $t0, $sp, 0x10
    sw          $t0, 0x13C($sp)
    addiu       $t0, $sp, 0x28
    sw          $t0, 0x12C($sp)
    addiu       $t0, $sp, 0x128
    sw          $t0, 0x134($sp)
.L80057B70:
    bnez        $s3, .L80057B94
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057EBC
    addu        $v0, $zero, $zero
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
.L80057B94:
    lbu         $s7, 0x0($s4)
    addiu       $s3, $s3, -0x1
    addiu       $s4, $s4, 0x1
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x4F
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    addiu       $a1, $zero, 0x1
    addu        $s6, $zero, $zero
    sw          $s7, 0x18($v0)
    lw          $v0, 0x0($s2)
    addiu       $s0, $zero, 0x1
    lw          $t0, 0x13C($sp)
    lw          $v0, 0x4($v0)
    addu        $a0, $s2, $zero
    jalr        $v0
    addiu       $s1, $t0, 0x1
    sb          $zero, 0x10($sp)
.L80057BDC:
    bnez        $s3, .L80057C00
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057EBC
    addu        $v0, $zero, $zero
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
.L80057C00:
    lbu         $v0, 0x0($s4)
    addiu       $s3, $s3, -0x1
    addiu       $s4, $s4, 0x1
    sb          $v0, 0x0($s1)
    addu        $s6, $v0, $s6
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0x11
    bnez        $v0, .L80057BDC
    addiu       $s1, $s1, 0x1
    addiu       $fp, $fp, -0x11
    lw          $v1, 0x0($s2)
    lbu         $v0, 0x11($sp)
    sw          $v0, 0x18($v1)
    lbu         $v0, 0x12($sp)
    sw          $v0, 0x1C($v1)
    lbu         $v0, 0x13($sp)
    sw          $v0, 0x20($v1)
    lbu         $v0, 0x14($sp)
    sw          $v0, 0x24($v1)
    lbu         $v0, 0x15($sp)
    sw          $v0, 0x28($v1)
    lbu         $v0, 0x16($sp)
    sw          $v0, 0x2C($v1)
    lbu         $v0, 0x17($sp)
    sw          $v0, 0x30($v1)
    lbu         $v0, 0x18($sp)
    sw          $v0, 0x34($v1)
    lw          $v0, 0x0($s2)
    addiu       $s0, $zero, 0x55
    sw          $s0, 0x14($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x2
    jalr        $v0
    addu        $a0, $s2, $zero
    lw          $v1, 0x0($s2)
    lbu         $v0, 0x19($sp)
    sw          $v0, 0x18($v1)
    lbu         $v0, 0x1A($sp)
    sw          $v0, 0x1C($v1)
    lbu         $v0, 0x1B($sp)
    sw          $v0, 0x20($v1)
    lbu         $v0, 0x1C($sp)
    sw          $v0, 0x24($v1)
    lbu         $v0, 0x1D($sp)
    sw          $v0, 0x28($v1)
    lbu         $v0, 0x1E($sp)
    sw          $v0, 0x2C($v1)
    lbu         $v0, 0x1F($sp)
    sw          $v0, 0x30($v1)
    lbu         $v0, 0x20($sp)
    sw          $v0, 0x34($v1)
    lw          $v0, 0x0($s2)
    sw          $s0, 0x14($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x2
    jalr        $v0
    addu        $a0, $s2, $zero
    slti        $v0, $s6, 0x101
    xori        $v0, $v0, 0x1
    slt         $v1, $fp, $s6
    or          $v0, $v0, $v1
    beqz        $v0, .L80057D1C
    addiu       $v0, $zero, 0x1C
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80057D1C:
    blez        $s6, .L80057D6C
    addu        $s0, $zero, $zero
    lw          $s1, 0x12C($sp)
.L80057D28:
    bnez        $s3, .L80057D4C
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057EBC
    addu        $v0, $zero, $zero
    lw          $s4, 0x0($s5)
    lw          $s3, 0x4($s5)
.L80057D4C:
    lbu         $v0, 0x0($s4)
    addiu       $s3, $s3, -0x1
    addiu       $s4, $s4, 0x1
    sb          $v0, 0x0($s1)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $s6
    bnez        $v0, .L80057D28
    addiu       $s1, $s1, 0x1
.L80057D6C:
    andi        $v0, $s7, 0x10
    beqz        $v0, .L80057D88
    subu        $fp, $fp, $s6
    addiu       $s7, $s7, -0x10
    sll         $v0, $s7, 2
    j .L80057D90
    addiu       $v0, $v0, 0xC4
.L80057D88:
    sll         $v0, $s7, 2
    addiu       $v0, $v0, 0xB4
.L80057D90:
    addu        $s0, $s2, $v0
    sltiu       $v0, $s7, 0x4
    bnez        $v0, .L80057DC0
    addiu       $v0, $zero, 0x1D
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    sw          $s7, 0x18($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80057DC0:
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80057DDC
    nop
    jal         func_800633EC
    addu        $a0, $s2, $zero
    sw          $v0, 0x0($s0)
    lw          $v0, 0x0($s0)
.L80057DDC:
    lw          $v1, 0x10($sp)
    lw          $a0, 0x14($sp)
    lw          $a1, 0x18($sp)
    lw          $a2, 0x1C($sp)
    sw          $v1, 0x0($v0)
    sw          $a0, 0x4($v0)
    sw          $a1, 0x8($v0)
    sw          $a2, 0xC($v0)
    lb          $v1, 0x20($sp)
    sb          $v1, 0x10($v0)
    lw          $v0, 0x0($s0)
    addiu       $a2, $sp, 0x28
    addiu       $a3, $v0, 0x11
    or          $v0, $a2, $a3
    andi        $v0, $v0, 0x3
    beqz        $v0, .L80057E78
    nop
.L80057E20:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    lw          $t0, 0x134($sp)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80057E20
    addiu       $a3, $a3, 0x10
    j .L80057EA8
    nop
.L80057E78:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    lw          $t0, 0x134($sp)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80057E78
    addiu       $a3, $a3, 0x10
.L80057EA8:
    bgtz        $fp, .L80057B70
    nop
.L80057EB0:
    addiu       $v0, $zero, 0x1
    sw          $s4, 0x0($s5)
    sw          $s3, 0x4($s5)
.L80057EBC:
    lw          $ra, 0x16C($sp)
    lw          $fp, 0x168($sp)
    lw          $s7, 0x164($sp)
    lw          $s6, 0x160($sp)
    lw          $s5, 0x15C($sp)
    lw          $s4, 0x158($sp)
    lw          $s3, 0x154($sp)
    lw          $s2, 0x150($sp)
    lw          $s1, 0x14C($sp)
    lw          $s0, 0x148($sp)
    addiu       $sp, $sp, 0x170
    jr          $ra
    nop
.end object_animation_update

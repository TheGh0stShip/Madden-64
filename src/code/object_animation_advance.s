.text
.align 2
.set noreorder
.globl object_animation_advance
.ent object_animation_advance
object_animation_advance:
    addiu       $sp, $sp, -0x40
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $s4, 0x14($s1)
    lw          $s3, 0x0($s4)
    lw          $s2, 0x4($s4)
    bnez        $s2, .L8005739C
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    nop
    beqz        $v0, .L80057650
    addu        $v0, $zero, $zero
    lw          $s3, 0x0($s4)
    lw          $s2, 0x4($s4)
.L8005739C:
    lbu         $v0, 0x0($s3)
    addiu       $s2, $s2, -0x1
    addiu       $s3, $s3, 0x1
    bnez        $s2, .L800573CC
    sll         $s5, $v0, 8
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s1, $zero
    beqz        $v0, .L80057650
    addu        $v0, $zero, $zero
    lw          $s3, 0x0($s4)
    lw          $s2, 0x4($s4)
.L800573CC:
    lbu         $v0, 0x0($s3)
    addiu       $s2, $s2, -0x1
    addu        $s5, $s5, $v0
    addiu       $s5, $s5, -0x2
    slti        $v0, $s5, 0xE
    bnez        $v0, .L80057604
    addiu       $s3, $s3, 0x1
    addiu       $s0, $sp, 0x10
    addiu       $s6, $sp, 0x1E
.L800573F0:
    bnez        $s2, .L80057414
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s1, $zero
    beqz        $v0, .L80057650
    addu        $v0, $zero, $zero
    lw          $s3, 0x0($s4)
    lw          $s2, 0x4($s4)
.L80057414:
    lbu         $v0, 0x0($s3)
    addiu       $s2, $s2, -0x1
    sb          $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $s6
    bnez        $v0, .L800573F0
    addiu       $s3, $s3, 0x1
    lbu         $v1, 0x10($sp)
    addiu       $v0, $zero, 0x4A
    bne         $v1, $v0, .L800575E8
    addiu       $s5, $s5, -0xE
    lbu         $a0, 0x11($sp)
    addiu       $v0, $zero, 0x46
    bne         $a0, $v0, .L800575E8
    addiu       $v0, $zero, 0x49
    lbu         $v1, 0x12($sp)
    bne         $v1, $v0, .L800575E8
    nop
    lbu         $v0, 0x13($sp)
    bne         $v0, $a0, .L800575E8
    nop
    lbu         $v0, 0x14($sp)
    bnez        $v0, .L800575E8
    addiu       $v0, $zero, 0x1
    lbu         $v1, 0x15($sp)
    beq         $v1, $v0, .L800574B4
    addiu       $v0, $zero, 0x73
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x15($sp)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x16($sp)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addu        $a0, $s1, $zero
    j .L800574F8
    addiu       $a1, $zero, -0x1
.L800574B4:
    lbu         $v0, 0x16($sp)
    sltiu       $v0, $v0, 0x3
    bnez        $v0, .L80057504
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x58
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x15($sp)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x16($sp)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x1
.L800574F8:
    jalr        $v0
    nop
    addiu       $v0, $zero, 0x1
.L80057504:
    sw          $v0, 0x118($s1)
    lbu         $v0, 0x17($sp)
    sb          $v0, 0x11C($s1)
    lbu         $v0, 0x18($sp)
    lbu         $v1, 0x19($sp)
    sll         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sh          $v1, 0x11E($s1)
    lbu         $v0, 0x1A($sp)
    lbu         $v1, 0x1B($sp)
    sll         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sh          $v1, 0x120($s1)
    lw          $v1, 0x0($s1)
    lhu         $v0, 0x11E($s1)
    sw          $v0, 0x18($v1)
    lhu         $v0, 0x120($s1)
    sw          $v0, 0x1C($v1)
    lbu         $v0, 0x11C($s1)
    sw          $v0, 0x20($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x56
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s1, $zero
    lbu         $v0, 0x1C($sp)
    lbu         $v1, 0x1D($sp)
    or          $v0, $v0, $v1
    beqz        $v0, .L800575BC
    addiu       $v0, $zero, 0x59
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x1C($sp)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    lbu         $v0, 0x1D($sp)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addu        $a0, $s1, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
.L800575BC:
    lbu         $v1, 0x1C($sp)
    lbu         $v0, 0x1D($sp)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    beq         $s5, $v0, .L8005762C
    addiu       $v0, $zero, 0x57
    lw          $v1, 0x0($s1)
    j .L80057610
    sw          $v0, 0x14($v1)
.L800575E8:
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x4C
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $s5, 0xE
    j .L80057618
    sw          $v0, 0x18($v1)
.L80057604:
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x4C
    sw          $v0, 0x14($v1)
.L80057610:
    lw          $v0, 0x0($s1)
    sw          $s5, 0x18($v0)
.L80057618:
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addu        $a0, $s1, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
.L8005762C:
    sw          $s3, 0x0($s4)
    blez        $s5, .L8005764C
    sw          $s2, 0x4($s4)
    lw          $v0, 0x14($s1)
    lw          $v0, 0x10($v0)
    addu        $a0, $s1, $zero
    jalr        $v0
    addu        $a1, $s5, $zero
.L8005764C:
    addiu       $v0, $zero, 0x1
.L80057650:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end object_animation_advance

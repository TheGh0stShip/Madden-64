.text
.align 2
.set noreorder
.globl object_animation_configure
.ent object_animation_configure
object_animation_configure:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $v0, 0x1C($s1)
    ori         $a0, $zero, 0xFFDC
    slt         $v0, $a0, $v0
    bnez        $v0, .L80056244
    nop
    lw          $v0, 0x18($s1)
    slt         $v0, $a0, $v0
    beqz        $v0, .L80056268
    nop
.L80056244:
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x28
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $a0, 0x18($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80056268:
    lw          $v1, 0xD4($s1)
    addiu       $v0, $zero, 0x8
    beq         $v1, $v0, .L8005629C
    addiu       $v0, $zero, 0xD
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0xD4($s1)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L8005629C:
    lw          $v0, 0x20($s1)
    slti        $v0, $v0, 0xB
    bnez        $v0, .L800562DC
    addiu       $v0, $zero, 0x18
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x20($s1)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0xA
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L800562DC:
    lw          $a0, 0xD8($s1)
    lw          $v1, 0x20($s1)
    addu        $s2, $zero, $zero
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x130($s1)
    blez        $v1, .L80056384
    sw          $v0, 0x134($s1)
    addiu       $s3, $zero, 0x10
    addiu       $s0, $a0, 0xC
.L80056300:
    lw          $v0, -0x4($s0)
    addiu       $v0, $v0, -0x1
    sltiu       $v0, $v0, 0x4
    beqz        $v0, .L80056328
    nop
    lw          $v0, 0x0($s0)
    addiu       $v0, $v0, -0x1
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L80056340
    nop
.L80056328:
    lw          $v0, 0x0($s1)
    sw          $s3, 0x14($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80056340:
    lw          $v1, 0x130($s1)
    lw          $a0, -0x4($s0)
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80056354
    addu        $v1, $a0, $zero
.L80056354:
    lw          $a0, 0x134($s1)
    sw          $v1, 0x130($s1)
    lw          $v1, 0x0($s0)
    slt         $v0, $a0, $v1
    bnel        $v0, $zero, .L8005636C
    addu        $a0, $v1, $zero
.L8005636C:
    lw          $v0, 0x20($s1)
    addiu       $s2, $s2, 0x1
    addiu       $s0, $s0, 0x54
    slt         $v0, $s2, $v0
    bnez        $v0, .L80056300
    sw          $a0, 0x134($s1)
.L80056384:
    lw          $a0, 0xD8($s1)
    lw          $v1, 0x20($s1)
    addu        $s2, $zero, $zero
    addiu       $v0, $zero, 0x8
    blez        $v1, .L80056444
    sw          $v0, 0x138($s1)
    addiu       $s4, $zero, 0x8
    addiu       $s3, $zero, 0x1
    addiu       $s0, $a0, 0x4C
.L800563A8:
    sw          $s4, -0x28($s0)
    lw          $v0, 0x18($s1)
    lw          $a0, -0x44($s0)
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x130($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    sw          $v0, -0x30($s0)
    lw          $v0, 0x1C($s1)
    lw          $a0, -0x40($s0)
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x134($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    sw          $v0, -0x2C($s0)
    lw          $v0, 0x18($s1)
    lw          $a0, -0x44($s0)
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x130($s1)
    jal         func_800631D8
    addiu       $s2, $s2, 0x1
    sw          $v0, -0x24($s0)
    lw          $v0, 0x1C($s1)
    lw          $a0, -0x40($s0)
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x134($s1)
    jal         func_800631D8
    nop
    sw          $v0, -0x20($s0)
    sw          $s3, -0x1C($s0)
    sw          $zero, 0x0($s0)
    lw          $v0, 0x20($s1)
    slt         $v0, $s2, $v0
    bnez        $v0, .L800563A8
    addiu       $s0, $s0, 0x54
.L80056444:
    lw          $a1, 0x134($s1)
    lw          $a0, 0x1C($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    lw          $v1, 0x144($s1)
    lw          $a0, 0x20($s1)
    slt         $v1, $v1, $a0
    bnez        $v1, .L80056474
    sw          $v0, 0x13C($s1)
    lw          $v0, 0xDC($s1)
    beqz        $v0, .L80056484
    nop
.L80056474:
    lw          $v1, 0x1B0($s1)
    addiu       $v0, $zero, 0x1
    j .L8005648C
    sw          $v0, 0x10($v1)
.L80056484:
    lw          $v0, 0x1B0($s1)
    sw          $zero, 0x10($v0)
.L8005648C:
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end object_animation_configure

.text
.align 2
.set noreorder
.globl object_geometry_configure
.ent object_geometry_configure
object_geometry_configure:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s0, 0x18($sp)
    lw          $v0, 0x4($s1)
    addu        $s0, $a1, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x50
    addu        $s3, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4EF8
    sw          $s3, 0x1A4($s1)
    beqz        $s0, .L8005B4F8
    sw          $v0, 0x0($s3)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L8005B4F8:
    lw          $v0, 0x1C0($s1)
    lw          $v0, 0x8($v0)
    beqz        $v0, .L8005B544
    nop
    lw          $v0, 0x138($s1)
    slti        $v0, $v0, 0x2
    beqz        $v0, .L8005B530
    addiu       $v0, $zero, 0x2E
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L8005B530:
    jal         func_8005AB90
    addu        $a0, $s1, $zero
    lw          $v0, 0x138($s1)
    j .L8005B548
    addiu       $s4, $v0, 0x2
.L8005B544:
    lw          $s4, 0x138($s1)
.L8005B548:
    lw          $v0, 0x20($s1)
    lw          $a2, 0xD8($s1)
    blez        $v0, .L8005B5F0
    addu        $s2, $zero, $zero
    addiu       $s0, $a2, 0x1C
.L8005B55C:
    lw          $a3, -0x10($s0)
    lw          $v1, 0x8($s0)
    .word       0x00E30018  # mult        $a3, $v1
    .word       0x00003812  # mflo        $a3
    lw          $v0, 0x138($s1)
    nop
    .word       0x00E2001A  # div         $zero, $a3, $v0
    bnez        $v0, .L8005B584
    nop
    break       7
.L8005B584:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005B59C
    lui         $at, 0x8000
    bne         $a3, $at, .L8005B59C
    nop
    break       6
.L8005B59C:
    .word       0x00003812  # mflo        $a3
    lw          $a2, 0x0($s0)
    nop
    .word       0x00C30018  # mult        $a2, $v1
    .word       0x00003012  # mflo        $a2
    nop
    nop
    .word       0x00F40018  # mult        $a3, $s4
    .word       0x00003812  # mflo        $a3
    lw          $v0, 0x4($s1)
    addu        $a0, $s1, $zero
    lw          $v0, 0x8($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $s2, $s2, 0x1
    sw          $v0, 0x8($s3)
    lw          $v0, 0x20($s1)
    addiu       $s0, $s0, 0x54
    slt         $v0, $s2, $v0
    bnez        $v0, .L8005B55C
    addiu       $s3, $s3, 0x4
.L8005B5F0:
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_geometry_configure

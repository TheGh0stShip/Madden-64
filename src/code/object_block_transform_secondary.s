.text
.align 2
.set noreorder
.globl object_block_transform_secondary
.ent object_block_transform_secondary
object_block_transform_secondary:
    addiu       $sp, $sp, -0x98
    sw          $s5, 0x94($sp)
    lw          $s5, 0xA8($sp)
    sw          $s4, 0x90($sp)
    addu        $s4, $a3, $zero
    sw          $s2, 0x88($sp)
    addu        $s2, $a2, $zero
    sw          $s3, 0x8C($sp)
    sw          $s1, 0x84($sp)
    sw          $s0, 0x80($sp)
    lw          $s1, 0x50($a1)
    addu        $t9, $sp, $zero
    addiu       $s0, $zero, 0x8
    lw          $v0, 0x140($a0)
    addiu       $t7, $sp, 0x40
    addiu       $t6, $s2, 0x70
    addiu       $s3, $v0, 0x80
    addiu       $t5, $s1, 0x20
.L8005E630:
    addiu       $v0, $zero, 0x4
    beql        $s0, $v0, .L8005E8A4
    addiu       $t6, $t6, 0x2
    lhu         $t3, -0x60($t6)
    lhu         $a1, -0x50($t6)
    lhu         $a3, -0x40($t6)
    lhu         $t8, -0x20($t6)
    lhu         $a0, -0x10($t6)
    lhu         $t0, 0x0($t6)
    or          $v0, $t3, $a1
    or          $v0, $a3, $v0
    or          $v0, $t8, $v0
    or          $v0, $a0, $v0
    or          $v0, $t0, $v0
    bnez        $v0, .L8005E698
    nop
    lh          $v0, 0x0($s2)
    lw          $v1, 0x0($s1)
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    sll         $v0, $v0, 2
    sw          $v0, 0x0($t9)
    sw          $v0, -0x20($t7)
    sw          $v0, 0x0($t7)
    j .L8005E8A0
    sw          $v0, 0x20($t7)
.L8005E698:
    lh          $v1, 0x0($s2)
    lw          $v0, 0x0($s1)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00006012  # mflo        $t4
    lw          $v1, 0x20($t5)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00002812  # mflo        $a1
    lw          $v1, 0xA0($t5)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00005012  # mflo        $t2
    lw          $v1, 0xC0($t5)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00004812  # mflo        $t1
    lw          $a0, 0x80($t5)
    lw          $v1, 0x0($t5)
    sll         $v0, $t3, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00005812  # mflo        $t3
    sll         $v0, $t8, 16
    sra         $v0, $v0, 16
    sll         $t4, $t4, 14
    sll         $v1, $a1, 4
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 3
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 5
    addu        $v1, $v1, $a1
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00002812  # mflo        $a1
    sll         $v0, $t2, 1
    addu        $v0, $v0, $t2
    sll         $v0, $v0, 4
    addu        $v0, $v0, $t2
    sll         $v0, $v0, 6
    subu        $v0, $v0, $t2
    sll         $v0, $v0, 1
    subu        $t0, $v1, $v0
    addu        $t8, $t4, $t0
    subu        $a2, $t4, $t0
    lw          $v1, 0x40($t5)
    sll         $v0, $a3, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00005012  # mflo        $t2
    sll         $v1, $t1, 3
    subu        $v1, $v1, $t1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $t1
    sll         $v1, $v1, 5
    addu        $v1, $v1, $t1
    sll         $v1, $v1, 1
    sll         $v0, $a1, 5
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 5
    subu        $v0, $v0, $a1
    sll         $a0, $v0, 2
    subu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $a1
    subu        $a0, $a0, $v1
    sll         $v0, $t2, 5
    addu        $v0, $v0, $t2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t2
    sll         $v0, $v0, 3
    subu        $v0, $v0, $t2
    sll         $v1, $v0, 4
    addu        $v0, $v0, $v1
    subu        $a0, $a0, $v0
    sll         $v0, $t3, 4
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 6
    subu        $v0, $v0, $t3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    addu        $t4, $a0, $v0
    sll         $v0, $t1, 6
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 4
    sll         $v1, $a1, 2
    addu        $v1, $v1, $a1
    addiu       $a0, $zero, 0x1CCD
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 5
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 1
    negu        $v1, $v1
    .word       0x01440018  # mult        $t2, $a0
    .word       0x00002012  # mflo        $a0
    subu        $v1, $v1, $v0
    sll         $v0, $t3, 2
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 7
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t3
    addu        $v1, $v1, $a0
    addu        $t0, $v1, $v0
    addu        $v0, $t8, $t0
    addiu       $v0, $v0, 0x800
    sra         $v0, $v0, 12
    sw          $v0, 0x0($t9)
    subu        $v0, $t8, $t0
    addiu       $v0, $v0, 0x800
    sra         $v0, $v0, 12
    sw          $v0, 0x20($t7)
    addu        $v0, $a2, $t4
    addiu       $v0, $v0, 0x800
    sra         $v0, $v0, 12
    sw          $v0, -0x20($t7)
    subu        $v0, $a2, $t4
    addiu       $v0, $v0, 0x800
    sra         $v0, $v0, 12
    sw          $v0, 0x0($t7)
.L8005E8A0:
    addiu       $t6, $t6, 0x2
.L8005E8A4:
    addiu       $s2, $s2, 0x2
    addiu       $t5, $t5, 0x4
    addiu       $s1, $s1, 0x4
    addiu       $t7, $t7, 0x4
    addiu       $s0, $s0, -0x1
    bgtz        $s0, .L8005E630
    addiu       $t9, $t9, 0x4
    addu        $t9, $sp, $zero
    addu        $s0, $zero, $zero
    lui         $t7, 0x4
    addu        $a3, $s4, $zero
    addiu       $t5, $sp, 0x1C
.L8005E8D4:
    lw          $v0, 0x0($a3)
    lw          $t3, -0x18($t5)
    lw          $a1, -0x14($t5)
    lw          $a0, -0x10($t5)
    lw          $t2, -0x8($t5)
    lw          $a2, -0x4($t5)
    lw          $t1, 0x0($t5)
    addu        $t6, $v0, $s5
    or          $v0, $t3, $a1
    or          $v0, $v0, $a0
    or          $v0, $v0, $t2
    or          $v0, $v0, $a2
    or          $v0, $v0, $t1
    bnez        $v0, .L8005E944
    sll         $v1, $a1, 4
    lw          $v0, 0x0($t9)
    addiu       $v0, $v0, 0x10
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t5, $t5, 0x20
    addiu       $t9, $t9, 0x20
    sb          $v0, 0x0($t6)
    sb          $v0, 0x1($t6)
    sb          $v0, 0x2($t6)
    j .L8005EB04
    sb          $v0, 0x3($t6)
.L8005E944:
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 3
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 5
    addu        $v1, $v1, $a1
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 4
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 6
    subu        $v0, $v0, $a2
    sll         $v0, $v0, 1
    subu        $t0, $v1, $v0
    addu        $a1, $t2, $zero
    lw          $v0, 0x0($t9)
    addu        $t2, $a0, $zero
    sll         $v1, $a1, 2
    addu        $v1, $v1, $a1
    addiu       $a0, $zero, 0x1CCD
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 5
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 1
    negu        $v1, $v1
    .word       0x01440018  # mult        $t2, $a0
    .word       0x00002012  # mflo        $a0
    sll         $t4, $v0, 14
    addu        $t8, $t4, $t0
    subu        $a2, $t4, $t0
    sll         $v0, $t1, 6
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 4
    subu        $v1, $v1, $v0
    sll         $v0, $t3, 2
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 7
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t3
    addu        $v1, $v1, $a0
    addu        $t0, $v1, $v0
    addu        $v0, $t8, $t0
    addu        $v0, $v0, $t7
    sra         $v0, $v0, 19
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    sll         $v1, $t1, 3
    subu        $v1, $v1, $t1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $t1
    sll         $v1, $v1, 5
    addu        $v1, $v1, $t1
    sll         $v1, $v1, 1
    sb          $v0, 0x0($t6)
    sll         $v0, $a1, 5
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 5
    subu        $v0, $v0, $a1
    sll         $a0, $v0, 2
    subu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $a1
    subu        $a0, $a0, $v1
    sll         $v0, $t2, 5
    addu        $v0, $v0, $t2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t2
    sll         $v0, $v0, 3
    subu        $v0, $v0, $t2
    sll         $v1, $v0, 4
    addu        $v0, $v0, $v1
    subu        $a0, $a0, $v0
    sll         $v1, $t3, 4
    addu        $v1, $v1, $t3
    sll         $v1, $v1, 6
    subu        $v1, $v1, $t3
    sll         $v1, $v1, 3
    subu        $v0, $t8, $t0
    addu        $v0, $v0, $t7
    sra         $v0, $v0, 19
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $t3
    addu        $t4, $a0, $v1
    sb          $v0, 0x3($t6)
    addu        $v0, $a2, $t4
    addu        $v0, $v0, $t7
    sra         $v0, $v0, 19
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x1($t6)
    subu        $v0, $a2, $t4
    addu        $v0, $v0, $t7
    sra         $v0, $v0, 19
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t5, $t5, 0x20
    addiu       $t9, $t9, 0x20
    sb          $v0, 0x2($t6)
.L8005EB04:
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0x4
    bnez        $v0, .L8005E8D4
    addiu       $a3, $a3, 0x4
    lw          $s5, 0x94($sp)
    lw          $s4, 0x90($sp)
    lw          $s3, 0x8C($sp)
    lw          $s2, 0x88($sp)
    lw          $s1, 0x84($sp)
    lw          $s0, 0x80($sp)
    addiu       $sp, $sp, 0x98
    jr          $ra
    nop
.end object_block_transform_secondary

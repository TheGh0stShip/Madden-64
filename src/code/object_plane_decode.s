.text
.align 2
.set noreorder
.globl object_plane_decode
.ent object_plane_decode
object_plane_decode:
    addiu       $sp, $sp, -0x140
    sw          $s2, 0x120($sp)
    addu        $s2, $a2, $zero
    sw          $fp, 0x138($sp)
    sw          $s7, 0x134($sp)
    sw          $s6, 0x130($sp)
    sw          $s5, 0x12C($sp)
    sw          $s4, 0x128($sp)
    sw          $s3, 0x124($sp)
    sw          $s1, 0x11C($sp)
    sw          $s0, 0x118($sp)
    sw          $a3, 0x104($sp)
    lw          $t9, 0x50($a1)
    addu        $a3, $sp, $zero
    addiu       $s6, $zero, 0x8
    sw          $s6, 0x10C($sp)
    lw          $v0, 0x140($a0)
    addiu       $t5, $sp, 0x80
    addiu       $t8, $s2, 0x70
    addiu       $s3, $v0, 0x80
    addiu       $t7, $t9, 0x20
.L8005DEAC:
    lhu         $s6, -0x40($t8)
    lhu         $s5, -0x60($t8)
    lhu         $a1, -0x50($t8)
    sh          $s6, 0x116($sp)
    lhu         $t2, -0x30($t8)
    or          $v0, $s5, $a1
    or          $v0, $s6, $v0
    lhu         $s0, -0x20($t8)
    lhu         $a0, -0x10($t8)
    lhu         $t3, 0x0($t8)
    or          $v0, $t2, $v0
    or          $v0, $s0, $v0
    or          $v0, $a0, $v0
    or          $v0, $t3, $v0
    bnez        $v0, .L8005DF34
    sll         $v0, $a1, 16
    lh          $v1, 0x0($s2)
    lw          $v0, 0x0($t9)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addiu       $t8, $t8, 0x2
    addiu       $s2, $s2, 0x2
    addiu       $t7, $t7, 0x4
    addiu       $t9, $t9, 0x4
    sll         $v1, $v1, 2
    sw          $v1, 0x0($a3)
    sw          $v1, -0x60($t5)
    sw          $v1, -0x40($t5)
    sw          $v1, -0x20($t5)
    sw          $v1, 0x0($t5)
    sw          $v1, 0x20($t5)
    sw          $v1, 0x40($t5)
    j .L8005E224
    sw          $v1, 0x60($t5)
.L8005DF34:
    lw          $v1, 0x20($t7)
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00004812  # mflo        $t1
    lw          $v1, 0xA0($t7)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00004012  # mflo        $t0
    lh          $v1, 0x0($s2)
    lw          $v0, 0x0($t9)
    sll         $a1, $t1, 1
    addu        $a1, $a1, $t1
    sll         $a1, $a1, 4
    addu        $a1, $a1, $t1
    sll         $a1, $a1, 6
    subu        $a1, $a1, $t1
    addu        $a2, $t1, $t0
    sll         $a0, $t0, 4
    subu        $a0, $a0, $t0
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00004812  # mflo        $t1
    sll         $a0, $a0, 2
    subu        $a0, $a0, $t0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $t0
    sll         $a0, $a0, 5
    addu        $a0, $a0, $t0
    lw          $v1, 0x60($t7)
    sll         $v0, $t2, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00004012  # mflo        $t0
    sll         $a1, $a1, 1
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 4
    subu        $v0, $v0, $a2
    sll         $v1, $v0, 5
    subu        $t6, $v1, $v0
    addu        $a2, $t6, $a1
    lw          $v1, 0xC0($t7)
    addu        $v0, $t1, $t0
    sll         $t4, $v0, 13
    addu        $s1, $t4, $a2
    subu        $fp, $t4, $a2
    sll         $v0, $t3, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00006012  # mflo        $t4
    subu        $t2, $t6, $a0
    subu        $v0, $t1, $t0
    sll         $a1, $v0, 13
    addu        $s4, $a1, $t2
    subu        $s7, $a1, $t2
    lw          $v1, 0x80($t7)
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00002812  # mflo        $a1
    lw          $v1, 0x0($t7)
    sll         $v0, $s5, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00003012  # mflo        $a2
    lhu         $s6, 0x116($sp)
    lw          $v1, 0x40($t7)
    sll         $v0, $s6, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00005012  # mflo        $t2
    addiu       $t8, $t8, 0x2
    addiu       $s2, $s2, 0x2
    addiu       $t9, $t9, 0x4
    addiu       $t7, $t7, 0x4
    addu        $t6, $t4, $a2
    addu        $t3, $a1, $a2
    addu        $t1, $a1, $t2
    addu        $t0, $t4, $t2
    addu        $a0, $t0, $t3
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 5
    addu        $a0, $v0, $a0
    sll         $v0, $t4, 3
    addu        $v0, $v0, $t4
    sll         $v1, $v0, 4
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    subu        $v0, $v0, $t4
    sll         $t4, $v0, 1
    sll         $v0, $a1, 5
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $a1, $v0, $a1
    sll         $v0, $t2, 1
    addu        $v0, $v0, $t2
    sll         $v1, $v0, 4
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t2
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $t2, $v1, 2
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sll         $v1, $v0, 10
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $a2, $v0, $a2
    sll         $v0, $t1, 2
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 7
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 2
    subu        $t1, $t1, $v0
    sll         $v0, $t0, 6
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 4
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    addu        $t0, $t0, $v0
    subu        $t0, $a0, $t0
    addiu       $v0, $zero, -0x1CCD
    .word       0x01C20018  # mult        $t6, $v0
    .word       0x00007012  # mflo        $t6
    sll         $v0, $t3, 1
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 5
    subu        $v0, $v0, $t3
    sll         $v0, $v0, 2
    subu        $t3, $a0, $v0
    addu        $v0, $t1, $t3
    addu        $a1, $a1, $v0
    addu        $v0, $t1, $t0
    addu        $t2, $t2, $v0
    addu        $v0, $t6, $t0
    addu        $t4, $t4, $v0
    addu        $v0, $t6, $t3
    addu        $a2, $a2, $v0
    addu        $v0, $s1, $a2
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, 0x0($a3)
    subu        $v0, $s1, $a2
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, 0x60($t5)
    addu        $v0, $s4, $t2
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, -0x60($t5)
    subu        $v0, $s4, $t2
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, 0x40($t5)
    addu        $v0, $s7, $a1
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, -0x40($t5)
    subu        $v0, $s7, $a1
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, 0x20($t5)
    addu        $v0, $fp, $t4
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, -0x20($t5)
    subu        $v0, $fp, $t4
    addiu       $v0, $v0, 0x400
    sra         $v0, $v0, 11
    sw          $v0, 0x0($t5)
.L8005E224:
    addiu       $t5, $t5, 0x4
    addiu       $a3, $a3, 0x4
    lw          $s6, 0x10C($sp)
    addiu       $s6, $s6, -0x1
    bgtz        $s6, .L8005DEAC
    sw          $s6, 0x10C($sp)
    addu        $a3, $sp, $zero
    lw          $s5, 0x104($sp)
    lui         $s2, 0x2
    addiu       $t7, $sp, 0x1C
    sw          $zero, 0x10C($sp)
.L8005E250:
    lw          $v0, 0x0($s5)
    lw          $s6, 0x150($sp)
    lw          $s0, -0x18($t7)
    lw          $a1, -0x14($t7)
    lw          $t9, -0x10($t7)
    lw          $a0, -0xC($t7)
    lw          $t8, -0x8($t7)
    lw          $v1, -0x4($t7)
    lw          $t3, 0x0($t7)
    addu        $t5, $v0, $s6
    or          $v0, $s0, $a1
    or          $v0, $v0, $t9
    or          $v0, $v0, $a0
    or          $v0, $v0, $t8
    or          $v0, $v0, $v1
    or          $v0, $v0, $t3
    bnez        $v0, .L8005E2DC
    addu        $t1, $a1, $zero
    lw          $v0, 0x0($a3)
    addiu       $v0, $v0, 0x10
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t7, $t7, 0x20
    addiu       $a3, $a3, 0x20
    sb          $v0, 0x0($t5)
    sb          $v0, 0x1($t5)
    sb          $v0, 0x2($t5)
    sb          $v0, 0x3($t5)
    sb          $v0, 0x4($t5)
    sb          $v0, 0x5($t5)
    sb          $v0, 0x6($t5)
    j .L8005E5A0
    sb          $v0, 0x7($t5)
.L8005E2DC:
    addu        $t0, $v1, $zero
    addu        $v1, $t1, $t0
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    subu        $v0, $v0, $v1
    sll         $v1, $v0, 5
    subu        $t6, $v1, $v0
    sll         $v0, $t0, 4
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 5
    addu        $v0, $v0, $t0
    subu        $t2, $t6, $v0
    sll         $v0, $t1, 1
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 4
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 6
    subu        $v0, $v0, $t1
    lw          $v1, 0x0($a3)
    sll         $v0, $v0, 1
    addu        $a2, $t6, $v0
    addu        $v0, $v1, $a0
    sll         $t4, $v0, 13
    subu        $v1, $v1, $a0
    sll         $a1, $v1, 13
    addu        $s1, $t4, $a2
    subu        $fp, $t4, $a2
    addu        $s4, $a1, $t2
    subu        $s7, $a1, $t2
    addu        $t4, $t3, $zero
    addu        $a1, $t8, $zero
    addu        $t2, $t9, $zero
    addu        $a2, $s0, $zero
    addu        $t6, $t4, $a2
    addu        $t1, $a1, $t2
    addu        $t0, $t4, $t2
    addu        $t3, $a1, $a2
    addu        $a0, $t0, $t3
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 5
    addu        $a0, $v0, $a0
    sll         $v0, $t2, 1
    addu        $v0, $v0, $t2
    sll         $v1, $v0, 4
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t2
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    sll         $t2, $v1, 2
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sll         $v1, $v0, 10
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $a2, $v0, $a2
    addiu       $v0, $zero, -0x1CCD
    .word       0x01C20018  # mult        $t6, $v0
    .word       0x00007012  # mflo        $t6
    sll         $v0, $t1, 2
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 7
    addu        $v0, $v0, $t1
    sll         $v0, $v0, 2
    subu        $t1, $t1, $v0
    sll         $v0, $t3, 1
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    sll         $v0, $v0, 5
    subu        $v0, $v0, $t3
    sll         $v0, $v0, 2
    subu        $t3, $a0, $v0
    sll         $v1, $t0, 6
    subu        $v1, $v1, $t0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $t0
    sll         $v1, $v1, 4
    addu        $v1, $v1, $t0
    sll         $v1, $v1, 2
    addu        $v0, $t6, $t3
    addu        $a2, $a2, $v0
    addu        $v0, $s1, $a2
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addu        $t0, $t0, $v1
    subu        $t0, $a0, $t0
    sb          $v0, 0x0($t5)
    subu        $v0, $s1, $a2
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v1, 0x0($v0)
    addu        $v0, $t1, $t0
    addu        $t2, $t2, $v0
    addu        $v0, $s4, $t2
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    sb          $v1, 0x7($t5)
    sll         $v1, $a1, 5
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 3
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lbu         $v0, 0x0($v0)
    sll         $v1, $v1, 2
    subu        $a1, $v1, $a1
    sb          $v0, 0x1($t5)
    subu        $v0, $s4, $t2
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v1, 0x0($v0)
    addu        $v0, $t1, $t3
    addu        $a1, $a1, $v0
    sb          $v1, 0x6($t5)
    sll         $v1, $t4, 3
    addu        $v1, $v1, $t4
    sll         $v0, $v1, 4
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v0, $s7, $a1
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    subu        $v1, $v1, $t4
    sll         $t4, $v1, 1
    sb          $v0, 0x2($t5)
    subu        $v0, $s7, $a1
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v1, 0x0($v0)
    addu        $v0, $t6, $t0
    addu        $t4, $t4, $v0
    addu        $v0, $fp, $t4
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    sb          $v1, 0x5($t5)
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x3($t5)
    subu        $v0, $fp, $t4
    addu        $v0, $v0, $s2
    sra         $v0, $v0, 18
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t7, $t7, 0x20
    addiu       $a3, $a3, 0x20
    sb          $v0, 0x4($t5)
.L8005E5A0:
    lw          $s6, 0x10C($sp)
    addiu       $s5, $s5, 0x4
    addiu       $s6, $s6, 0x1
    slti        $v0, $s6, 0x8
    bnez        $v0, .L8005E250
    sw          $s6, 0x10C($sp)
    lw          $fp, 0x138($sp)
    lw          $s7, 0x134($sp)
    lw          $s6, 0x130($sp)
    lw          $s5, 0x12C($sp)
    lw          $s4, 0x128($sp)
    lw          $s3, 0x124($sp)
    lw          $s2, 0x120($sp)
    lw          $s1, 0x11C($sp)
    lw          $s0, 0x118($sp)
    addiu       $sp, $sp, 0x140
    jr          $ra
    nop
.end object_plane_decode

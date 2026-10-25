.text
.align 2
.set noreorder
.globl object_block_transform
.ent object_block_transform
object_block_transform:
    addiu       $sp, $sp, -0x140
    sw          $s7, 0x134($sp)
    addu        $s7, $a2, $zero
    sw          $fp, 0x138($sp)
    sw          $s6, 0x130($sp)
    sw          $s5, 0x12C($sp)
    sw          $s4, 0x128($sp)
    sw          $s3, 0x124($sp)
    sw          $s2, 0x120($sp)
    sw          $s1, 0x11C($sp)
    sw          $s0, 0x118($sp)
    sw          $a3, 0x104($sp)
    lw          $s6, 0x50($a1)
    addu        $s5, $sp, $zero
    addiu       $t7, $zero, 0x8
    sw          $t7, 0x10C($sp)
    lw          $v0, 0x140($a0)
    addiu       $t3, $sp, 0x60
    addiu       $a2, $s7, 0x70
    addiu       $fp, $v0, 0x80
    addiu       $s1, $s6, 0xE0
.L8005D454:
    lhu         $t1, -0x60($a2)
    lhu         $a0, -0x50($a2)
    lhu         $t2, -0x40($a2)
    lhu         $t0, -0x30($a2)
    lhu         $t5, -0x20($a2)
    lhu         $a1, -0x10($a2)
    lhu         $t6, 0x0($a2)
    or          $v0, $t1, $a0
    or          $v0, $t2, $v0
    or          $v0, $t0, $v0
    or          $v0, $t5, $v0
    or          $v0, $a1, $v0
    or          $v0, $t6, $v0
    bnez        $v0, .L8005D4D0
    addiu       $a2, $a2, 0x2
    lh          $v1, 0x0($s7)
    lw          $v0, 0x0($s6)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addiu       $s7, $s7, 0x2
    addiu       $s1, $s1, 0x4
    addiu       $s6, $s6, 0x4
    sw          $v1, 0x0($s5)
    sw          $v1, -0x40($t3)
    sw          $v1, -0x20($t3)
    sw          $v1, 0x0($t3)
    sw          $v1, 0x20($t3)
    sw          $v1, 0x40($t3)
    sw          $v1, 0x60($t3)
    j .L8005D6A4
    sw          $v1, 0x80($t3)
.L8005D4D0:
    lh          $v1, 0x0($s7)
    lw          $v0, 0x0($s6)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x0000C012  # mflo        $t8
    lw          $v1, -0xA0($s1)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00009012  # mflo        $s2
    lw          $v1, -0x60($s1)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00009812  # mflo        $s3
    lw          $v1, -0x20($s1)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00008012  # mflo        $s0
    lw          $v1, -0xC0($s1)
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00006012  # mflo        $t4
    lw          $v1, -0x80($s1)
    sll         $v0, $t2, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00005012  # mflo        $t2
    lw          $v1, -0x40($s1)
    sll         $v0, $t5, 16
    sra         $v0, $v0, 16
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00004812  # mflo        $t1
    addiu       $s7, $s7, 0x2
    addiu       $s6, $s6, 0x4
    lw          $v1, 0x0($s1)
    addiu       $s1, $s1, 0x4
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    addu        $t5, $t8, $s3
    subu        $t0, $t8, $s3
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00007012  # mflo        $t6
    addu        $t9, $s2, $s0
    subu        $a0, $s2, $s0
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    sra         $v0, $v0, 8
    subu        $a1, $v0, $t9
    addu        $t8, $t5, $t9
    subu        $s0, $t5, $t9
    addu        $s2, $t0, $a1
    subu        $s3, $t0, $a1
    addu        $a3, $t1, $t2
    subu        $t1, $t1, $t2
    addu        $t7, $t4, $t6
    subu        $t4, $t4, $t6
    addu        $t6, $t7, $a3
    sw          $t7, 0x114($sp)
    subu        $a0, $t7, $a3
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    sra         $t0, $v0, 8
    addu        $v1, $t1, $t4
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sra         $s4, $v0, 8
    sll         $v0, $t4, 4
    addu        $v0, $v0, $t4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t4
    sra         $v0, $v0, 8
    subu        $t5, $v0, $s4
    sll         $v0, $t1, 3
    subu        $v0, $v0, $t1
    sll         $v0, $v0, 5
    subu        $v0, $v0, $t1
    sll         $v1, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    addu        $a1, $v0, $s4
    subu        $t1, $a1, $t6
    subu        $t2, $t0, $t1
    addu        $t4, $t5, $t2
    addu        $v0, $t8, $t6
    sw          $v0, 0x0($s5)
    subu        $v0, $t8, $t6
    sw          $v0, 0x80($t3)
    addu        $v0, $s2, $t1
    sw          $v0, -0x40($t3)
    subu        $v0, $s2, $t1
    sw          $v0, 0x60($t3)
    addu        $v0, $s3, $t2
    sw          $v0, -0x20($t3)
    subu        $v0, $s3, $t2
    sw          $v0, 0x40($t3)
    addu        $v0, $s0, $t4
    sw          $v0, 0x20($t3)
    subu        $v0, $s0, $t4
    sw          $v0, 0x0($t3)
.L8005D6A4:
    addiu       $t3, $t3, 0x4
    addiu       $s5, $s5, 0x4
    lw          $t7, 0x10C($sp)
    addiu       $t7, $t7, -0x1
    bgtz        $t7, .L8005D454
    sw          $t7, 0x10C($sp)
    lw          $s6, 0x104($sp)
    addu        $s5, $sp, $zero
    addiu       $s1, $sp, 0x1C
    sw          $zero, 0x10C($sp)
.L8005D6CC:
    lw          $v0, 0x0($s6)
    lw          $t7, 0x150($sp)
    lw          $t3, -0x18($s1)
    lw          $a0, -0x14($s1)
    lw          $t1, -0x10($s1)
    lw          $s0, -0xC($s1)
    lw          $t0, -0x8($s1)
    lw          $v1, -0x4($s1)
    lw          $t2, 0x0($s1)
    addu        $a2, $v0, $t7
    or          $v0, $t3, $a0
    or          $v0, $v0, $t1
    or          $v0, $v0, $s0
    or          $v0, $v0, $t0
    or          $v0, $v0, $v1
    or          $v0, $v0, $t2
    bnez        $v0, .L8005D754
    addu        $t9, $a0, $v1
    lw          $v0, 0x0($s5)
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    addiu       $s1, $s1, 0x20
    addiu       $s5, $s5, 0x20
    sb          $v0, 0x0($a2)
    sb          $v0, 0x1($a2)
    sb          $v0, 0x2($a2)
    sb          $v0, 0x3($a2)
    sb          $v0, 0x4($a2)
    sb          $v0, 0x5($a2)
    sb          $v0, 0x6($a2)
    j .L8005D908
    sb          $v0, 0x7($a2)
.L8005D754:
    subu        $a0, $a0, $v1
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    sra         $v0, $v0, 8
    subu        $a1, $v0, $t9
    addu        $a3, $t0, $t1
    subu        $t1, $t0, $t1
    addu        $t7, $t3, $t2
    subu        $t4, $t3, $t2
    addu        $t6, $t7, $a3
    sw          $t7, 0x114($sp)
    lw          $a0, 0x0($s5)
    addu        $v1, $t1, $t4
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sra         $s4, $v0, 8
    sll         $v1, $t1, 3
    subu        $v1, $v1, $t1
    sll         $v1, $v1, 5
    subu        $v1, $v1, $t1
    addu        $t5, $a0, $s0
    subu        $t0, $a0, $s0
    addu        $t8, $t5, $t9
    addu        $v0, $t8, $t6
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    addu        $s2, $t0, $a1
    subu        $s3, $t0, $a1
    sb          $v0, 0x0($a2)
    sll         $v0, $v1, 2
    subu        $v1, $v1, $v0
    sra         $v1, $v1, 8
    subu        $v0, $t8, $t6
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    addu        $a1, $v1, $s4
    subu        $t1, $a1, $t6
    sb          $v0, 0x7($a2)
    addu        $v0, $s2, $t1
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    subu        $s0, $t5, $t9
    sb          $v0, 0x1($a2)
    subu        $a0, $t7, $a3
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v1, $v0, 4
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 1
    subu        $v0, $s2, $t1
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    sra         $t0, $v1, 8
    subu        $t2, $t0, $t1
    sll         $v1, $t4, 4
    addu        $v1, $v1, $t4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t4
    sll         $v1, $v1, 2
    sb          $v0, 0x6($a2)
    addu        $v0, $s3, $t2
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $t4
    sra         $v1, $v1, 8
    sb          $v0, 0x2($a2)
    subu        $v0, $s3, $t2
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    subu        $t5, $v1, $s4
    addu        $t4, $t5, $t2
    sb          $v0, 0x5($a2)
    addu        $v0, $s0, $t4
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x4($a2)
    subu        $v0, $s0, $t4
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $fp, $v0
    lbu         $v0, 0x0($v0)
    addiu       $s1, $s1, 0x20
    addiu       $s5, $s5, 0x20
    sb          $v0, 0x3($a2)
.L8005D908:
    lw          $t7, 0x10C($sp)
    addiu       $s6, $s6, 0x4
    addiu       $t7, $t7, 0x1
    slti        $v0, $t7, 0x8
    bnez        $v0, .L8005D6CC
    sw          $t7, 0x10C($sp)
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
.end object_block_transform

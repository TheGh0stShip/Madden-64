.text
.align 2
.set noreorder
.globl object_plane_transform
.ent object_plane_transform
object_plane_transform:
    addiu       $sp, $sp, -0x50
    sw          $s3, 0x4C($sp)
    lw          $s3, 0x60($sp)
    addu        $t7, $a2, $zero
    sw          $s2, 0x48($sp)
    sw          $s1, 0x44($sp)
    sw          $s0, 0x40($sp)
    lw          $t6, 0x50($a1)
    addu        $t2, $sp, $zero
    addiu       $t3, $zero, 0x8
    addiu       $s2, $zero, 0x2
    addiu       $s1, $zero, -0x28BA
    lw          $v0, 0x140($a0)
    addiu       $t8, $sp, 0x20
    addiu       $t1, $t7, 0x70
    addiu       $s0, $v0, 0x80
    addiu       $t0, $t6, 0x20
.L8005EB7C:
    xori        $v1, $t3, 0x6
    sltiu       $v1, $v1, 0x1
    xori        $v0, $t3, 0x4
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    bnel        $v1, $zero, .L8005ECE4
    addiu       $t1, $t1, 0x2
    beql        $t3, $s2, .L8005ECE4
    addiu       $t1, $t1, 0x2
    lhu         $t9, -0x60($t1)
    lhu         $t4, -0x40($t1)
    lhu         $a2, -0x20($t1)
    lhu         $a0, 0x0($t1)
    or          $v0, $t9, $t4
    or          $v0, $a2, $v0
    or          $v0, $a0, $v0
    bnez        $v0, .L8005EBE0
    nop
    lh          $v0, 0x0($t7)
    lw          $v1, 0x0($t6)
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    sll         $v0, $v0, 2
    j .L8005ECDC
    sw          $v0, 0x0($t2)
.L8005EBE0:
    lh          $v1, 0x0($t7)
    lw          $v0, 0x0($t6)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00002812  # mflo        $a1
    lw          $v1, 0xC0($t0)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    sll         $t5, $a1, 15
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00002812  # mflo        $a1
    lw          $v1, 0x80($t0)
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    sll         $a0, $a1, 1
    addu        $a0, $a0, $a1
    sll         $a0, $a0, 3
    subu        $a0, $a0, $a1
    sll         $a0, $a0, 4
    addu        $a0, $a0, $a1
    sll         $a0, $a0, 3
    addu        $a0, $a0, $a1
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00002812  # mflo        $a1
    sll         $v1, $a1, 3
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v0, $v1, 7
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    lw          $a1, 0x40($t0)
    sll         $v0, $t4, 16
    sra         $v0, $v0, 16
    .word       0x00450018  # mult        $v0, $a1
    .word       0x00002812  # mflo        $a1
    nop
    nop
    .word       0x00B10018  # mult        $a1, $s1
    .word       0x00003012  # mflo        $a2
    lw          $a1, 0x0($t0)
    sll         $v0, $t9, 16
    sra         $v0, $v0, 16
    .word       0x00450018  # mult        $v0, $a1
    .word       0x00002812  # mflo        $a1
    sll         $a0, $a0, 1
    subu        $v1, $v1, $a0
    addu        $v1, $v1, $a2
    sll         $v0, $a1, 3
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 8
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    addu        $v0, $t5, $v1
    addiu       $v0, $v0, 0x1000
    sra         $v0, $v0, 13
    sw          $v0, 0x0($t2)
    subu        $v0, $t5, $v1
    addiu       $v0, $v0, 0x1000
    sra         $v0, $v0, 13
.L8005ECDC:
    sw          $v0, 0x0($t8)
    addiu       $t1, $t1, 0x2
.L8005ECE4:
    addiu       $t7, $t7, 0x2
    addiu       $t0, $t0, 0x4
    addiu       $t6, $t6, 0x4
    addiu       $t8, $t8, 0x4
    addiu       $t3, $t3, -0x1
    bgtz        $t3, .L8005EB7C
    addiu       $t2, $t2, 0x4
    addu        $t2, $sp, $zero
    addu        $t3, $zero, $zero
    addiu       $t7, $zero, -0x28BA
    lui         $t6, 0x8
    addiu       $t1, $sp, 0x1C
.L8005ED14:
    lw          $v0, 0x0($a3)
    lw          $t0, -0x18($t1)
    lw          $a1, -0x10($t1)
    lw          $a2, -0x8($t1)
    lw          $v1, 0x0($t1)
    addu        $t4, $v0, $s3
    or          $v0, $t0, $a1
    or          $v0, $v0, $a2
    or          $v0, $v0, $v1
    bnez        $v0, .L8005ED64
    addiu       $t1, $t1, 0x20
    lw          $v0, 0x0($t2)
    addiu       $v0, $v0, 0x10
    sra         $v0, $v0, 5
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t2, $t2, 0x20
    j .L8005EE18
    sb          $v0, 0x0($t4)
.L8005ED64:
    lw          $v0, 0x0($t2)
    .word       0x00AF0018  # mult        $a1, $t7
    .word       0x00002812  # mflo        $a1
    sll         $t5, $v0, 15
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    sll         $v1, $a2, 3
    subu        $v1, $v1, $a2
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a2
    sll         $a0, $v1, 7
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a2
    subu        $v1, $v1, $v0
    sll         $v0, $t0, 3
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 8
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $a1
    addu        $v1, $v1, $v0
    addu        $v0, $t5, $v1
    addu        $v0, $v0, $t6
    sra         $v0, $v0, 20
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x0($t4)
    subu        $v0, $t5, $v1
    addu        $v0, $v0, $t6
    sra         $v0, $v0, 20
    andi        $v0, $v0, 0x3FF
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t2, $t2, 0x20
.L8005EE18:
    sb          $v0, 0x1($t4)
    addiu       $t3, $t3, 0x1
    slti        $v0, $t3, 0x2
    bnez        $v0, .L8005ED14
    addiu       $a3, $a3, 0x4
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end object_plane_transform

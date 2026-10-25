.text
.align 2
.set noreorder
.globl object_lookup_table_build
.ent object_lookup_table_build
object_lookup_table_build:
    addiu       $sp, $sp, -0xF0
    sw          $ra, 0xEC($sp)
    sw          $fp, 0xE8($sp)
    sw          $s7, 0xE4($sp)
    sw          $s6, 0xE0($sp)
    sw          $s5, 0xDC($sp)
    sw          $s4, 0xD8($sp)
    sw          $s3, 0xD4($sp)
    sw          $s2, 0xD0($sp)
    sw          $s1, 0xCC($sp)
    sw          $s0, 0xC8($sp)
    sw          $a0, 0x14($sp)
    sw          $a3, 0x1C($sp)
    lw          $t5, 0x1C8($a0)
    sw          $zero, 0x2C($sp)
    lw          $t6, 0x18($t5)
    sw          $t6, 0x24($sp)
    lw          $t8, 0x70($a0)
    sw          $t8, 0x34($sp)
    lw          $t6, 0x140($a0)
    lw          $v0, 0x88($a0)
    sw          $t6, 0x3C($sp)
    lw          $t8, 0x28($t5)
    sw          $t8, 0x44($sp)
    lw          $t6, 0x0($v0)
    sw          $t6, 0x4C($sp)
    lw          $t8, 0x4($v0)
    sw          $t8, 0x54($sp)
    lw          $v0, 0x8($v0)
    blez        $a3, .L800624C4
    sw          $v0, 0x5C($sp)
    lw          $t6, 0x34($sp)
    addiu       $t6, $t6, -0x1
    lw          $t8, 0x34($sp)
    sll         $v0, $t6, 1
    addu        $v0, $v0, $t6
    sw          $t6, 0x64($sp)
    sw          $v0, 0x6C($sp)
    sw          $a2, 0x84($sp)
    sw          $a1, 0x8C($sp)
    addiu       $v1, $t8, 0x1
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    sw          $v0, 0x74($sp)
.L80062224:
    lw          $t6, 0x8C($sp)
    lw          $t8, 0x84($sp)
    lw          $v0, 0x24($t5)
    lw          $s5, 0x0($t6)
    lw          $t0, 0x0($t8)
    beqz        $v0, .L80062268
    addiu       $t7, $zero, -0x1
    lw          $t6, 0x6C($sp)
    lw          $t8, 0x64($sp)
    lw          $v0, 0x20($t5)
    addu        $s5, $s5, $t6
    sw          $zero, 0x24($t5)
    lw          $t6, 0x74($sp)
    addiu       $t1, $zero, -0x3
    addu        $t0, $t0, $t8
    j .L80062278
    addu        $s4, $v0, $t6
.L80062268:
    lw          $s4, 0x20($t5)
    addiu       $t7, $zero, 0x1
    addiu       $t1, $zero, 0x3
    sw          $t7, 0x24($t5)
.L80062278:
    addu        $s2, $zero, $zero
    addu        $s1, $zero, $zero
    addu        $s0, $zero, $zero
    addu        $t9, $zero, $zero
    addu        $t4, $zero, $zero
    lw          $fp, 0x34($sp)
    addu        $t3, $zero, $zero
    addu        $t2, $zero, $zero
    sw          $zero, 0xC4($sp)
    beqz        $fp, .L80062484
    sw          $zero, 0xBC($sp)
    addiu       $s7, $s5, 0x2
.L800622A8:
    sll         $v0, $t1, 1
    addu        $s6, $v0, $s4
    lh          $v0, 0x0($s6)
    lh          $v1, 0x2($s6)
    lw          $t8, 0x44($sp)
    lbu         $a0, 0x0($s7)
    lw          $t6, 0x3C($sp)
    addu        $v0, $s0, $v0
    addiu       $v0, $v0, 0x8
    sra         $s0, $v0, 4
    addu        $v1, $s1, $v1
    lh          $v0, 0x4($s6)
    addiu       $v1, $v1, 0x8
    sra         $s1, $v1, 4
    addu        $v0, $s2, $v0
    addiu       $v0, $v0, 0x8
    sra         $s2, $v0, 4
    sll         $v0, $s0, 2
    addu        $v0, $v0, $t8
    lw          $s0, 0x0($v0)
    sll         $v0, $s1, 2
    addu        $v0, $v0, $t8
    lw          $s1, 0x0($v0)
    sll         $v0, $s2, 2
    addu        $v0, $v0, $t8
    lw          $s2, 0x0($v0)
    lbu         $v0, 0x0($s5)
    lbu         $v1, -0x1($s7)
    lw          $t8, 0x24($sp)
    addu        $s0, $s0, $v0
    addu        $s1, $s1, $v1
    addu        $s2, $s2, $a0
    addu        $v0, $t6, $s0
    lbu         $s0, 0x0($v0)
    addu        $v0, $t6, $s1
    lbu         $s1, 0x0($v0)
    addu        $v0, $t6, $s2
    lbu         $s2, 0x0($v0)
    sra         $a1, $s0, 3
    sll         $v0, $a1, 2
    addu        $v0, $v0, $t8
    lw          $v1, 0x0($v0)
    sra         $a2, $s1, 2
    sll         $v0, $a2, 6
    sra         $a3, $s2, 3
    addu        $v1, $v1, $v0
    sll         $v0, $a3, 1
    addu        $s3, $v1, $v0
    lhu         $v0, 0x0($s3)
    bnel        $v0, $zero, .L800623C0
    addu        $s7, $s7, $t1
    lw          $a0, 0x14($sp)
    sw          $t0, 0x90($sp)
    sw          $t1, 0x94($sp)
    sw          $t2, 0x98($sp)
    sw          $t3, 0x9C($sp)
    sw          $t4, 0xA0($sp)
    sw          $t5, 0xA4($sp)
    sw          $t7, 0xAC($sp)
    jal         func_80061F10
    sw          $t9, 0xB4($sp)
    lw          $t9, 0xB4($sp)
    lw          $t7, 0xAC($sp)
    lw          $t5, 0xA4($sp)
    lw          $t4, 0xA0($sp)
    lw          $t3, 0x9C($sp)
    lw          $t2, 0x98($sp)
    lw          $t1, 0x94($sp)
    lw          $t0, 0x90($sp)
    addu        $s7, $s7, $t1
.L800623C0:
    lhu         $v1, 0x0($s3)
    addu        $s5, $s5, $t1
    addiu       $fp, $fp, -0x1
    addiu       $v1, $v1, -0x1
    sb          $v1, 0x0($t0)
    lw          $t6, 0x4C($sp)
    addu        $t0, $t0, $t7
    lw          $t8, 0x54($sp)
    addu        $v0, $t6, $v1
    lbu         $a1, 0x0($v0)
    addu        $v0, $t8, $v1
    lw          $t6, 0x5C($sp)
    lbu         $a0, 0x0($v0)
    lw          $t8, 0xBC($sp)
    addu        $v1, $t6, $v1
    lbu         $v0, 0x0($v1)
    subu        $s0, $s0, $a1
    subu        $s1, $s1, $a0
    addu        $a2, $s0, $zero
    lw          $t6, 0xC4($sp)
    subu        $s2, $s2, $v0
    sll         $v0, $s0, 1
    addu        $s0, $s0, $v0
    addu        $a1, $t2, $s0
    addu        $s0, $s0, $v0
    addu        $t2, $t8, $s0
    addu        $s0, $s0, $v0
    sw          $a2, 0xBC($sp)
    addu        $a2, $s1, $zero
    sll         $v0, $s1, 1
    addu        $s1, $s1, $v0
    addu        $a0, $t3, $s1
    addu        $s1, $s1, $v0
    addu        $t3, $t6, $s1
    addu        $s1, $s1, $v0
    sw          $a2, 0xC4($sp)
    addu        $a2, $s2, $zero
    sll         $v0, $s2, 1
    addu        $s2, $s2, $v0
    addu        $v1, $t4, $s2
    addu        $s2, $s2, $v0
    addu        $t4, $t9, $s2
    addu        $t9, $a2, $zero
    addu        $s2, $s2, $v0
    sh          $a1, 0x0($s4)
    sh          $a0, 0x2($s4)
    sh          $v1, 0x4($s4)
    bnez        $fp, .L800622A8
    addu        $s4, $s6, $zero
.L80062484:
    lw          $t8, 0x84($sp)
    lw          $t6, 0x8C($sp)
    addiu       $t8, $t8, 0x4
    sw          $t8, 0x84($sp)
    lw          $t8, 0x2C($sp)
    addiu       $t6, $t6, 0x4
    sw          $t6, 0x8C($sp)
    addiu       $t8, $t8, 0x1
    sw          $t8, 0x2C($sp)
    sh          $t2, 0x0($s4)
    sh          $t3, 0x2($s4)
    sh          $t4, 0x4($s4)
    lw          $t6, 0x1C($sp)
    slt         $v0, $t8, $t6
    bnez        $v0, .L80062224
    nop
.L800624C4:
    lw          $ra, 0xEC($sp)
    lw          $fp, 0xE8($sp)
    lw          $s7, 0xE4($sp)
    lw          $s6, 0xE0($sp)
    lw          $s5, 0xDC($sp)
    lw          $s4, 0xD8($sp)
    lw          $s3, 0xD4($sp)
    lw          $s2, 0xD0($sp)
    lw          $s1, 0xCC($sp)
    lw          $s0, 0xC8($sp)
    addiu       $sp, $sp, 0xF0
    jr          $ra
    nop
.end object_lookup_table_build

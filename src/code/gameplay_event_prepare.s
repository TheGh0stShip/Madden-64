.text
.align 2
.set noreorder
.globl gameplay_event_prepare
.ent gameplay_event_prepare
gameplay_event_prepare:
    addiu       $sp, $sp, -0x48
    sw          $s5, 0x34($sp)
    addu        $s5, $zero, $zero
    lui         $t2, 0x8008
    addiu       $t2, $t2, 0x1860
    sw          $fp, 0x40($sp)
    addiu       $fp, $t2, 0x16
    sw          $ra, 0x44($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    sll         $a1, $s5, 16
.L80025B50:
    sra         $v1, $a1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $a0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lh          $v0, 0x2CA8($at)
    blez        $v0, .L80025E84
    addu        $s3, $zero, $zero
    addu        $s6, $a0, $zero
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $t2, 0x8008
    addiu       $t2, $t2, 0x5040
    addu        $s7, $v0, $t2
    sll         $a0, $s3, 16
.L80025BB4:
    sra         $a0, $a0, 14
    sra         $v1, $a1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $s2, $v0, 2
    addu        $s1, $a0, $s2
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a1, 0x2CAB($at)
    addiu       $v0, $zero, 0xFF
    beq         $a1, $v0, .L80025E34
    addiu       $a0, $s3, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $v0, 0x2CAA($at)
    lui         $t2, 0x8008
    addiu       $t2, $t2, 0x1860
    addu        $v1, $s2, $t2
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $s4, 0x0($v0)
    andi        $a0, $s5, 0xFFFF
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lh          $a3, 0x2CAC($at)
    andi        $s0, $s4, 0xFFFF
    jal         func_80025F44
    addu        $a2, $s0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a0, 0x2CAB($at)
    sltiu       $v0, $a0, 0x28
    beqz        $v0, .L80025C90
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 4
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 1
    addu        $v1, $s2, $fp
    addu        $v0, $v0, $v1
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v0
    lhu         $v0, 0x0($a0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lhu         $v1, 0x2CAC($at)
    addu        $v0, $v0, $v1
    j .L80025CD0
    sh          $v0, 0x0($a0)
.L80025C90:
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 4
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 1
    addu        $v1, $s2, $fp
    addu        $v0, $v0, $v1
    sll         $v1, $a0, 1
    addu        $a1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lh          $v1, 0x2CAC($at)
    lh          $v0, 0x0($a1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L80025CD0
    addu        $a0, $v1, $zero
    sh          $a0, 0x0($a1)
.L80025CD0:
    sll         $v0, $s3, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x2CAB($at)
    addiu       $v1, $v0, -0x5
    sltiu       $v0, $v1, 0x24
    beqz        $v0, .L80025E34
    addiu       $a0, $s3, 0x1
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1068($at)
    jr          $v0
    nop
    sll         $v1, $s3, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2CAA($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    j .L80025E10
    addiu       $a0, $zero, 0x5
    sll         $v1, $s3, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2CAA($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    j .L80025E10
    addiu       $a0, $zero, 0x3
    sll         $v1, $s3, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2CAA($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    j .L80025E10
    addiu       $a0, $zero, 0x4
    sll         $v1, $s3, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2CAA($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    j .L80025E10
    addiu       $a0, $zero, 0x1
    sll         $v0, $s3, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $a1, 0x2CAC($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x5A18($v0)
    j .L80025E20
    addu        $a0, $zero, $zero
    sll         $v1, $s3, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2CAA($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    addiu       $a0, $zero, 0x2
.L80025E10:
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a1, 0x2CAC($at)
    lbu         $v0, 0x21($v0)
.L80025E20:
    andi        $a2, $s5, 0xFFFF
    addu        $a3, $s4, $zero
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $s3, 0x1
.L80025E34:
    addu        $s3, $a0, $zero
    sll         $a1, $s5, 16
    sra         $v1, $a1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v0, 0x2CA8($at)
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    slt         $a0, $a0, $v0
    bnez        $a0, .L80025BB4
    sll         $a0, $s3, 16
.L80025E84:
    addiu       $v0, $s5, 0x1
    addu        $s5, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80025B50
    sll         $a1, $s5, 16
    addu        $s3, $zero, $zero
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x2D22
    addiu       $t1, $a2, 0x2E
    addiu       $t0, $a2, 0x214C
    addiu       $a3, $a2, 0x217A
.L80025EB8:
    sll         $a0, $s3, 16
    sra         $a0, $a0, 15
    addu        $a1, $a0, $a2
    addu        $v1, $a0, $t1
    lhu         $v0, 0x0($a1)
    lhu         $v1, 0x0($v1)
    addu        $v0, $v0, $v1
    sh          $v0, 0x0($a1)
    addu        $a1, $a0, $t0
    addu        $a0, $a0, $a3
    lhu         $v1, 0x0($a1)
    lhu         $a0, 0x0($a0)
    addiu       $v0, $s3, 0x1
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x17
    addu        $v1, $v1, $a0
    bnez        $v0, .L80025EB8
    sh          $v1, 0x0($a1)
    jal         func_80025AB8
    nop
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end gameplay_event_prepare

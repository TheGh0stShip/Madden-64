.text
.align 2
.set noreorder
.globl runtime_callback_configure
.ent runtime_callback_configure
runtime_callback_configure:
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x30($sp)
    addu        $s4, $a0, $zero
    sw          $s3, 0x2C($sp)
    addu        $s3, $zero, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $zero, $zero
    sw          $ra, 0x34($sp)
    sw          $s1, 0x24($sp)
    beqz        $s4, .L80030D74
    sw          $s0, 0x20($sp)
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    slt         $v0, $s3, $v0
    beqz        $v0, .L80030D50
    addu        $s1, $zero, $zero
.L80030CB4:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lb          $v0, 0x6DE4($at)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lbu         $v0, -0x7F18($at)
    sll         $v1, $v1, 1
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $s0, -0x4C50($at)
    beqz        $v0, .L80030D34
    sll         $a0, $s1, 16
    sra         $a0, $a0, 16
    addiu       $a1, $sp, 0x10
    jal         func_80030EF4
    addiu       $a2, $sp, 0x11
    lbu         $v1, 0x10($sp)
    sltiu       $v0, $v1, 0xA
    bnel        $v0, $zero, .L80030D0C
    ori         $s0, $s0, 0x200
.L80030D0C:
    sltiu       $v0, $v1, 0x16
    beql        $v0, $zero, .L80030D18
    ori         $s0, $s0, 0x100
.L80030D18:
    lbu         $v1, 0x11($sp)
    sltiu       $v0, $v1, 0xA
    bnel        $v0, $zero, .L80030D28
    ori         $s0, $s0, 0x800
.L80030D28:
    sltiu       $v0, $v1, 0x16
    beql        $v0, $zero, .L80030D34
    ori         $s0, $s0, 0x400
.L80030D34:
    andi        $v1, $s0, 0xFF3F
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L80030CB4
    or          $s2, $s2, $v1
.L80030D50:
    andi        $v0, $s2, 0x800
    beqz        $v0, .L80030D60
    addiu       $v0, $zero, -0x401
    and         $s2, $s2, $v0
.L80030D60:
    andi        $v0, $s2, 0x200
    beqz        $v0, .L80030D70
    addiu       $v0, $zero, -0x101
    and         $s2, $s2, $v0
.L80030D70:
    sw          $s2, 0x0($s4)
.L80030D74:
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L80030DA8
    addu        $s1, $zero, $zero
.L80030D84:
    sll         $a0, $s1, 16
    jal         func_80030B54
    sra         $a0, $a0, 16
    lui         $v1, 0x8008
    lh          $v1, 0x6DA8($v1)
    addiu       $s1, $s1, 0x1
    slt         $v1, $s1, $v1
    bnez        $v1, .L80030D84
    or          $s3, $s3, $v0
.L80030DA8:
    andi        $v0, $s3, 0x800
    beqz        $v0, .L80030DB8
    addiu       $v0, $zero, -0x401
    and         $s3, $s3, $v0
.L80030DB8:
    andi        $v0, $s3, 0x200
    beqz        $v0, .L80030DC8
    addiu       $v0, $zero, -0x101
    and         $s3, $s3, $v0
.L80030DC8:
    addu        $v0, $s3, $zero
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end runtime_callback_configure

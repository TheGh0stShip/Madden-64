.text
.align 2
.set noreorder
.globl func_80030910
.ent func_80030910
func_80030910:
    lui         $v1, 0x8009
    lw          $v1, -0x79E0($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x6180($v0)
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    beq         $v1, $v0, .L80030A0C
    sw          $s0, 0x20($sp)
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L800309FC
    addu        $s1, $zero, $zero
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x7100
.L80030950:
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
    beqz        $v0, .L800309D0
    sll         $a0, $s1, 16
    sra         $a0, $a0, 16
    addiu       $a1, $sp, 0x10
    jal         func_80030EF4
    addiu       $a2, $sp, 0x11
    lbu         $v1, 0x10($sp)
    sltiu       $v0, $v1, 0xA
    bnel        $v0, $zero, .L800309A8
    ori         $s0, $s0, 0x200
.L800309A8:
    sltiu       $v0, $v1, 0x16
    beql        $v0, $zero, .L800309B4
    ori         $s0, $s0, 0x100
.L800309B4:
    lbu         $v1, 0x11($sp)
    sltiu       $v0, $v1, 0xA
    bnel        $v0, $zero, .L800309C4
    ori         $s0, $s0, 0x800
.L800309C4:
    sltiu       $v0, $v1, 0x16
    beql        $v0, $zero, .L800309D0
    ori         $s0, $s0, 0x400
.L800309D0:
    andi        $a0, $s0, 0xFF3F
    sll         $a1, $s1, 24
    jal         func_80031C20
    sra         $a1, $a1, 24
    sw          $v0, 0x0($s2)
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L80030950
    addiu       $s2, $s2, 0x4
.L800309FC:
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $at, 0x8008
    sw          $v0, 0x6180($at)
.L80030A0C:
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80030910

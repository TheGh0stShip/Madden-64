.text
.align 2
.set noreorder
.globl func_800A5FD8
.ent func_800A5FD8
func_800A5FD8:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x20($sp)
    jal         func_800209AC
    sw          $s1, 0x1C($sp)
    lui         $at, 0x8008
    sw          $s0, -0x5F84($at)
    jal         func_80093F0C
    addu        $s1, $v0, $zero
    beqz        $v0, .L800A6014
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
.L800A6014:
    lhu         $v1, 0x0($s1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $a0, -0x6122($at)
    addiu       $a3, $zero, -0x1
    lui         $t1, 0x7FFF
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, 0x719C($at)
    addiu       $v0, $zero, 0x34
    bne         $v1, $v0, .L800A606C
    ori         $t1, $t1, 0xFFFF
    j           func_800A19FC
    addu        $a3, $a0, $zero
.L800A606C:
    addu        $a2, $zero, $zero
    lui         $t0, 0x8008
    lw          $t0, 0x6178($t0)
    addiu       $t3, $zero, 0x34
    addu        $a1, $zero, $zero
    lw          $t2, 0x1C($t0)
.L800A6084:
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v1, 0x715C($at)
    lw          $v0, 0x1C($v1)
    subu        $v0, $v0, $t2
    sra         $a0, $v0, 4
    bltzl       $a0, .L800A60A4
    negu        $a0, $a0
.L800A60A4:
    lw          $v0, 0x20($v1)
    lw          $v1, 0x20($t0)
    subu        $v0, $v0, $v1
    sra         $v1, $v0, 4
    bltzl       $v1, .L800A60BC
    negu        $v1, $v1
.L800A60BC:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800A60D8
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_800A19C4
    addu        $v1, $v1, $v0
.L800A60D8:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lbu         $v0, 0x719C($at)
    bnel        $v0, $t3, .L800A6114
    addiu       $a2, $a2, 0x1
    slt         $v0, $v1, $t1
    beql        $v0, $zero, .L800A6114
    addiu       $a2, $a2, 0x1
    addu        $t1, $v1, $zero
    addu        $a3, $a2, $zero
    addiu       $a2, $a2, 0x1
.L800A6114:
    slti        $v0, $a2, 0x4
    bnez        $v0, .L800A6084
    addiu       $a1, $a1, 0xB0
    addiu       $v0, $zero, 0x39
    sb          $v0, 0x10($sp)
    addiu       $v0, $zero, -0x1
    beq         $a3, $v0, .L800A6170
    sll         $s0, $a3, 1
    addu        $s0, $s0, $a3
    sll         $s0, $s0, 2
    subu        $s0, $s0, $a3
    sll         $s0, $s0, 4
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    addu        $s0, $s0, $v0
    addu        $a0, $s0, $zero
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x44
    addu        $a0, $s0, $zero
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    j           func_800A1A6C
    nop
.L800A6170:
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x71E8
    addu        $a0, $s0, $zero
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x44
    addu        $a0, $s0, $zero
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A5FD8

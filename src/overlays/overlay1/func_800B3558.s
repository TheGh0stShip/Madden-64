.text
.align 2
.set noreorder
.globl func_800B3558
.ent func_800B3558
func_800B3558:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x18($sp)
    sw          $ra, 0x1C($sp)
    jal         func_800AD404
    addu        $s0, $a0, $zero
    jal         func_800AD4F8
    nop
    jal         func_800AD460
    nop
    jal         func_800AD49C
    nop
    lui         $a2, 0x8008
    lh          $a2, 0x76DC($a2)
    addiu       $v0, $zero, 0x6
    beq         $a2, $v0, .L800B35B8
    addiu       $a0, $zero, 0x2
    lw          $v0, 0x4($s0)
    addiu       $a1, $zero, 0x13
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    jal         func_800B7DD8
    addiu       $s0, $v0, 0x2
    j           func_800AEE98
    nop
.L800B35B8:
    addiu       $s0, $zero, 0x8
    lui         $a0, 0x8008
    lhu         $a0, 0x76DC($a0)
    addiu       $v0, $a0, -0x4
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800B3630
    nop
    lui         $v1, 0x8008
    lhu         $v1, 0x2D94($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0x4EE0($v0)
    bnel        $v1, $v0, .L800B35EC
    addiu       $s0, $zero, 0x8
.L800B35EC:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x5
    bne         $v0, $v1, .L800B3630
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    bne         $v1, $v0, .L800B3630
    nop
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xF10
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v0, 0x4($v0)
    slti        $v0, $v0, 0x11
    bnel        $v0, $zero, .L800B3630
    addiu       $s0, $zero, 0x8
.L800B3630:
    jal         func_8009C448
    nop
    andi        $a0, $s0, 0xFFFF
    jal         func_800ABCA0
    addu        $a1, $zero, $zero
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B3558

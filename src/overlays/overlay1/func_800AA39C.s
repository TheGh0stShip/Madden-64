.text
.align 2
.set noreorder
.globl func_800AA39C
.ent func_800AA39C
func_800AA39C:
    addu        $t1, $a0, $zero
    lh          $v0, 0x0($t1)
    andi        $a2, $a2, 0xFFF
    lw          $v1, 0x10($sp)
    subu        $t0, $a2, $v0
    slti        $v0, $t0, 0x800
    bnez        $v0, .L800AA3C4
    slti        $v0, $t0, -0x7FF
    j           func_800A5CA8
    addiu       $t0, $t0, -0x1000
.L800AA3C4:
    bnel        $v0, $zero, .L800AA3CC
    addiu       $t0, $t0, 0x1000
.L800AA3CC:
    bgezl       $t0, .L800AA410
    srav        $v1, $t0, $v1
    lhu         $v0, 0x0($a1)
    negu        $a0, $t0
    srav        $v1, $a0, $v1
    srav        $a0, $a0, $a3
    addiu       $v0, $v0, -0x1
    subu        $v0, $v0, $v1
    sh          $v0, 0x0($a1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    negu        $v0, $v0
    slt         $v0, $v0, $a0
    bnez        $v0, .L800AA43C
    nor         $v0, $zero, $a0
    j           func_800A5D18
    sh          $v0, 0x0($a1)
.L800AA410:
    lhu         $v0, 0x0($a1)
    srav        $a0, $t0, $a3
    addiu       $v0, $v0, 0x1
    addu        $v0, $v0, $v1
    sh          $v0, 0x0($a1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a0
    bnez        $v0, .L800AA43C
    addiu       $v0, $a0, 0x1
    sh          $v0, 0x0($a1)
.L800AA43C:
    lhu         $v0, 0x0($t1)
    lhu         $v1, 0x0($a1)
    addu        $v0, $v0, $v1
    andi        $v0, $v0, 0xFFF
    subu        $v1, $a2, $v0
    sh          $v0, 0x0($t1)
    slti        $v0, $v1, 0x800
    bnez        $v0, .L800AA468
    slti        $v0, $v1, -0x7FF
    j           func_800A5D4C
    addiu       $v1, $v1, -0x1000
.L800AA468:
    bnel        $v0, $zero, .L800AA470
    addiu       $v1, $v1, 0x1000
.L800AA470:
    xor         $v0, $t0, $v1
    bgtz        $v0, .L800AA488
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x1
    sh          $a2, 0x0($t1)
    sh          $zero, 0x0($a1)
.L800AA488:
    jr          $ra
    nop
.end func_800AA39C

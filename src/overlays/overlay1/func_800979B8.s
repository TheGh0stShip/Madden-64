.text
.align 2
.set noreorder
.globl func_800979B8
.ent func_800979B8
func_800979B8:
    addiu       $sp, $sp, -0x18
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    sll         $v0, $a1, 5
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $v1, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v0, 0x2D94($at)
    slt         $v0, $v0, $v1
    beqz        $v0, .L80097AB4
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    bne         $v1, $v0, .L80097A7C
    addiu       $v0, $zero, 0x5
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x57C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v1, 0x4($v0)
    addiu       $v0, $zero, 0x14
    bne         $v1, $v0, .L80097A74
    addiu       $v0, $zero, 0x5
    j           func_80093394
    addiu       $v0, $zero, 0x6
.L80097A74:
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
.L80097A7C:
    bne         $v1, $v0, .L80097AB8
    addu        $v0, $zero, $zero
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x57C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lhu         $v1, 0x2($v0)
    addiu       $v0, $zero, 0x608
    beq         $v1, $v0, .L80097AAC
    addiu       $v0, $zero, 0xE10
    bne         $v1, $v0, .L80097AB8
    addu        $v0, $zero, $zero
.L80097AAC:
    j           func_80093394
    addiu       $v0, $zero, 0x5
.L80097AB4:
    addu        $v0, $zero, $zero
.L80097AB8:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800979B8

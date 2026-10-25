.text
.align 2
.set noreorder
.globl func_800A33C8
.ent func_800A33C8
func_800A33C8:
    lui         $v0, 0x8009
    lw          $v0, -0x5FAC($v0)
    addiu       $sp, $sp, -0x18
    bnez        $v0, .L800A3480
    sw          $ra, 0x10($sp)
    jal         func_800E0E24
    nop
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800A34C4
    addiu       $v0, $zero, 0x1
    addu        $a2, $zero, $zero
    addiu       $t1, $zero, 0x35
    addiu       $t0, $zero, 0x34
    addiu       $a3, $zero, 0x36
    addu        $a0, $zero, $zero
.L800A3404:
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $a1, $v0, 4
    sll         $v0, $a0, 16
.L800A3424:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $a1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, 0x719C($at)
    beq         $v1, $t1, .L800A3480
    slti        $v0, $v1, 0x36
    beqz        $v0, .L800A3460
    nop
    beql        $v1, $zero, .L800A3488
    addiu       $a0, $zero, 0xA
    beql        $v1, $t0, .L800A3488
    addiu       $a0, $zero, 0xA
    j           func_8009ED68
    addiu       $v0, $a0, 0x1
.L800A3460:
    bne         $v1, $a3, .L800A348C
    addiu       $v0, $a0, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v0, 0x71C4($at)
    slti        $v0, $v0, 0x2
    beqz        $v0, .L800A348C
    addiu       $v0, $a0, 0x1
.L800A3480:
    j           func_8009EDA0
    addiu       $v0, $zero, 0x1
.L800A3488:
    addiu       $v0, $a0, 0x1
.L800A348C:
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xA
    bnez        $v0, .L800A3424
    sll         $v0, $a0, 16
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnel        $v0, $zero, .L800A3404
    addu        $a0, $zero, $zero
    addu        $v0, $zero, $zero
.L800A34C4:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A33C8

.text
.align 2
.set noreorder
.globl func_8009E0CC
.ent func_8009E0CC
func_8009E0CC:
    nop
    nop
    .word       0x0046001A  # div         $zero, $v0, $a2
    bnez        $a2, .L8009E0E4
    nop
    break       7
.L8009E0E4:
    addiu       $at, $zero, -0x1
    bne         $a2, $at, .L8009E0FC
    lui         $at, 0x8000
    bne         $v0, $at, .L8009E0FC
    nop
    break       6
.L8009E0FC:
    .word       0x00001012  # mflo        $v0
    subu        $a1, $a1, $v1
    subu        $a0, $a0, $v0
    slti        $v0, $a1, -0x7FFF
    bnel        $v0, $zero, .L8009E128
    addiu       $v1, $zero, -0x7FFF
    addiu       $v0, $zero, 0x7FFF
    slt         $v0, $v0, $a1
    bnez        $v0, .L8009E128
    addiu       $v1, $zero, 0x7FFF
    addu        $v1, $a1, $zero
.L8009E128:
    slti        $v0, $a0, -0x7FFF
    bnez        $v0, .L8009E14C
    sw          $v1, 0x0($t1)
    addiu       $v0, $zero, 0x7FFF
    slt         $v0, $v0, $a0
    bnez        $v0, .L8009E150
    addiu       $v1, $zero, 0x7FFF
    j           func_80099A2C
    addu        $v1, $a0, $zero
.L8009E14C:
    addiu       $v1, $zero, -0x7FFF
.L8009E150:
    sw          $v1, 0x4($t1)
    sw          $zero, 0x8($t1)
    lw          $v1, 0x0($t2)
    lw          $v0, 0x0($t1)
    subu        $v1, $v1, $a3
    slt         $v0, $v0, $v1
    beqz        $v0, .L8009E178
    nop
    addiu       $t3, $zero, -0x1
    sw          $v1, 0x0($t1)
.L8009E178:
    lw          $v1, 0x0($t2)
    lw          $v0, 0x0($t1)
    addu        $v1, $v1, $a3
    slt         $v0, $v1, $v0
    beqz        $v0, .L8009E198
    nop
    addiu       $t3, $zero, -0x1
    sw          $v1, 0x0($t1)
.L8009E198:
    lw          $v1, 0x4($t2)
    lw          $v0, 0x4($t1)
    subu        $v1, $v1, $a3
    slt         $v0, $v0, $v1
    beqz        $v0, .L8009E1B8
    nop
    addiu       $t3, $zero, -0x1
    sw          $v1, 0x4($t1)
.L8009E1B8:
    lw          $v1, 0x4($t2)
    lw          $v0, 0x4($t1)
    addu        $v1, $v1, $a3
    slt         $v0, $v1, $v0
    beqz        $v0, .L8009E1D8
    nop
    addiu       $t3, $zero, -0x1
    sw          $v1, 0x4($t1)
.L8009E1D8:
    jr          $ra
    addu        $v0, $t3, $zero
.end func_8009E0CC

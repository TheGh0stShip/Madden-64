.text
.align 2
.set noreorder
.globl func_800B545C
.ent func_800B545C
func_800B545C:
    bne         $v1, $v0, .L800B5480
    sw          $s0, 0x18($sp)
    jal         func_80030DF0
    nop
    andi        $v0, $v0, 0xFF3F
    beqz        $v0, .L800B5480
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
.L800B5480:
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x2
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800B5634
    addiu       $v0, $zero, 0x7
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    beq         $v1, $v0, .L800B5634
    addiu       $s3, $zero, -0x1
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800B5554
    addu        $s1, $zero, $zero
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x6A68
    addiu       $s4, $zero, -0x1
.L800B54D4:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $a0
    lw          $v1, 0x0($v0)
    sll         $v0, $v1, 16
    sra         $s0, $v0, 16
    addu        $a0, $s0, $zero
    jal         func_80030B54
    addu        $s2, $v1, $zero
    andi        $v0, $v0, 0x1000
    bnez        $v0, .L800B5518
    sll         $v0, $s0, 1
    jal         func_80030740
    addu        $a0, $s0, $zero
    bnez        $v0, .L800B5530
    addiu       $v0, $s1, 0x1
    sll         $v0, $s0, 1
.L800B5518:
    addu        $v0, $v0, $s5
    lhu         $v0, 0x0($v0)
    addu        $s3, $s2, $zero
    lui         $at, 0x8008
    sb          $v0, 0x4FA8($at)
    addiu       $v0, $s1, 0x1
.L800B5530:
    sll         $v1, $v0, 16
    sra         $v1, $v1, 14
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v1, -0x6B70($at)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    bne         $v1, $s4, .L800B54D4
    addu        $s1, $v0, $zero
.L800B5554:
    lui         $v1, 0x8009
    lw          $v1, -0x6B70($v1)
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    nor         $v0, $zero, $v0
    sltiu       $v0, $v0, 0x1
    nor         $v1, $zero, $v1
    sltiu       $v1, $v1, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L800B55D8
    sll         $v0, $s3, 16
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L800B55D4
    addu        $s1, $zero, $zero
    sll         $a0, $s1, 16
.L800B5594:
    jal         func_80030B54
    sra         $a0, $a0, 16
    andi        $v0, $v0, 0x1000
    beqz        $v0, .L800B55B4
    addiu       $v0, $s1, 0x1
    addu        $s3, $s1, $zero
    lui         $at, 0x8008
    sb          $zero, 0x4FA8($at)
.L800B55B4:
    addu        $s1, $v0, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x6DA8($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $v1
    bnez        $v0, .L800B5594
    sll         $a0, $s1, 16
.L800B55D4:
    sll         $v0, $s3, 16
.L800B55D8:
    sra         $a0, $v0, 16
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B5634
    lui         $v1, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800B5634
    addiu       $v0, $zero, 0x2
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4858
    lhu         $v1, 0x0($a1)
    bne         $v1, $v0, .L800B5624
    addiu       $v0, $zero, 0x1
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8007
    sh          $s3, -0x4840($at)
    j           func_800B0F10
    sh          $v0, 0x0($a1)
.L800B5624:
    lui         $at, 0x8009
    sb          $v0, -0x7F68($at)
    jal         func_800B0F38
    nop
.L800B5634:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B545C

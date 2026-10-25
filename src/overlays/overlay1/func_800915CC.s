.text
.align 2
.set noreorder
.globl func_800915CC
.ent func_800915CC
func_800915CC:
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $fp, 0x30($sp)
    addiu       $fp, $zero, -0x1
    sw          $s7, 0x2C($sp)
    lui         $s7, 0x8009
    addiu       $s7, $s7, -0x6A68
    sw          $s4, 0x20($sp)
    andi        $s4, $s3, 0xFFFF
    sw          $s6, 0x28($sp)
    addiu       $s6, $zero, 0x30
    sw          $s5, 0x24($sp)
    addiu       $s5, $zero, 0x2010
    sw          $ra, 0x34($sp)
    sw          $s0, 0x10($sp)
    sll         $v0, $s1, 16
.L8009161C:
    sra         $v0, $v0, 14
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x6B70
    addu        $s0, $v0, $a3
    lw          $a0, 0x0($s0)
    beq         $a0, $fp, .L80091698
    sll         $v0, $a0, 1
    addu        $v0, $v0, $s7
    lh          $v0, 0x0($v0)
    bne         $v0, $s4, .L80091680
    addiu       $v0, $s1, 0x1
    sll         $a0, $a0, 16
    jal         func_80030B54
    sra         $a0, $a0, 16
    andi        $v0, $v0, 0x30
    beql        $v0, $s6, .L80091698
    addiu       $s2, $zero, 0x1
    lh          $a0, 0x2($s0)
    jal         func_80030B54
    nop
    andi        $v0, $v0, 0x2010
    bne         $v0, $s5, .L80091680
    addiu       $v0, $s1, 0x1
    j           func_8008CF74
    addiu       $s2, $zero, 0x1
.L80091680:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L8009161C
    sll         $v0, $s1, 16
.L80091698:
    addu        $v1, $s2, $zero
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80091758
    andi        $a0, $s3, 0xFFFF
    lui         $a1, 0x8008
    lhu         $a1, 0x57B2($a1)
    addiu       $a2, $zero, -0xC1
    and         $v0, $a1, $a2
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    bne         $a0, $v0, .L800916F4
    nop
    lui         $v1, 0x8008
    lhu         $v1, 0x5280($v1)
    and         $v0, $v1, $a2
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    bne         $a0, $v0, .L800916F4
    nop
    bnez        $a1, .L800916F4
    nop
    beqz        $v1, .L80091758
    nop
.L800916F4:
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x2
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80091758
    addiu       $v0, $zero, 0x7
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    beq         $v1, $v0, .L80091758
    sll         $v0, $s3, 16
    sra         $s0, $v0, 16
    jal         func_8009EC0C
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L80091758
    lui         $v1, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L80091758
    nop
    jal         func_8009EB14
    addu        $a0, $s0, $zero
.L80091758:
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800915CC

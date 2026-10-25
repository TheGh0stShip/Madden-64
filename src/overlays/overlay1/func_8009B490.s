.text
.align 2
.set noreorder
.globl func_8009B490
.ent func_8009B490
func_8009B490:
    addiu       $sp, $sp, -0x30
    sw          $s6, 0x28($sp)
    addu        $s6, $a1, $zero
    sw          $s4, 0x20($sp)
    andi        $s4, $s6, 0x3
    subu        $s6, $s6, $s4
    sw          $ra, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s5, 0x0($s6)
    andi        $v0, $s4, 0x2
    beqz        $v0, .L8009B4D4
    addiu       $s6, $s6, 0x4
    sll         $s5, $s5, 16
.L8009B4D4:
    andi        $v0, $s4, 0x1
    bnel        $v0, $zero, .L8009B4E0
    sll         $s5, $s5, 8
.L8009B4E0:
    addiu       $v0, $zero, 0x4
    subu        $s4, $v0, $s4
    addiu       $s1, $zero, 0x4
    addu        $s0, $zero, $zero
    addu        $s3, $a0, $zero
.L8009B4F4:
    srl         $s2, $s5, 24
.L8009B4F8:
    addiu       $s4, $s4, -0x1
    bnez        $s4, .L8009B510
    sll         $s5, $s5, 8
    lw          $s5, 0x0($s6)
    addiu       $s6, $s6, 0x4
    addiu       $s4, $zero, 0x4
.L8009B510:
    andi        $v0, $s2, 0x80
    bnel        $v0, $zero, .L8009B540
    andi        $v0, $s2, 0x40
    sll         $s0, $s0, 8
    addiu       $s1, $s1, -0x1
    bnez        $s1, .L8009B4F4
    or          $s0, $s0, $s2
    sw          $s0, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s1, $zero, 0x4
    j           func_80096DD0
    addu        $s0, $zero, $zero
.L8009B540:
    bnel        $v0, $zero, .L8009B5C4
    andi        $v0, $s2, 0x20
    andi        $a0, $s2, 0x3F
    beqz        $a0, .L8009B6AC
    addiu       $v0, $zero, 0x4
    j           func_80096E44
    sltu        $v0, $zero, $a0
.L8009B55C:
    addiu       $a0, $a0, -0x1
    sll         $s0, $s0, 8
    sltu        $v0, $zero, $a0
    sltu        $v1, $zero, $s1
    and         $v0, $v0, $v1
    bnel        $v0, $zero, .L8009B55C
    addiu       $s1, $s1, -0x1
    bnez        $s1, .L8009B5A0
    sltiu       $v0, $a0, 0x4
    sw          $s0, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s1, $zero, 0x4
    j           func_80096E7C
    addu        $s0, $zero, $zero
.L8009B594:
    sw          $zero, 0x0($s3)
    addiu       $s3, $s3, 0x4
    sltiu       $v0, $a0, 0x4
.L8009B5A0:
    beql        $v0, $zero, .L8009B594
    addiu       $a0, $a0, -0x4
    beqz        $a0, .L8009B4F8
    srl         $s2, $s5, 24
.L8009B5B0:
    addiu       $a0, $a0, -0x1
    bnez        $a0, .L8009B5B0
    addiu       $s1, $s1, -0x1
    j           func_80096DD4
    srl         $s2, $s5, 24
.L8009B5C4:
    bnez        $v0, .L8009B5E4
    andi        $v0, $s2, 0x10
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x760
    jal         func_8002CA88
    srl         $s2, $s5, 24
    j           func_80096DD8
    addiu       $s4, $s4, -0x1
.L8009B5E4:
    bnez        $v0, .L8009B644
    andi        $a0, $s2, 0xF
    srl         $s2, $s5, 24
    addiu       $s4, $s4, -0x1
    bnez        $s4, .L8009B608
    sll         $s5, $s5, 8
    lw          $s5, 0x0($s6)
    addiu       $s6, $s6, 0x4
    addiu       $s4, $zero, 0x4
.L8009B608:
    beql        $a0, $zero, .L8009B4F8
    srl         $s2, $s5, 24
    sll         $s0, $s0, 8
.L8009B614:
    addiu       $s1, $s1, -0x1
    addiu       $a0, $a0, -0x1
    bnez        $s1, .L8009B634
    or          $s0, $s0, $s2
    sw          $s0, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s1, $zero, 0x4
    addu        $s0, $zero, $zero
.L8009B634:
    bnel        $a0, $zero, .L8009B614
    sll         $s0, $s0, 8
    j           func_80096DD4
    srl         $s2, $s5, 24
.L8009B644:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x77C
    jal         func_8002CA88
    nop
    andi        $a0, $s2, 0xF
    beqz        $a0, .L8009B4F8
    srl         $s2, $s5, 24
.L8009B660:
    addiu       $s4, $s4, -0x1
    bnez        $s4, .L8009B678
    sll         $s5, $s5, 8
    lw          $s5, 0x0($s6)
    addiu       $s6, $s6, 0x4
    addiu       $s4, $zero, 0x4
.L8009B678:
    sll         $s0, $s0, 8
    addiu       $s1, $s1, -0x1
    addiu       $a0, $a0, -0x1
    bnez        $s1, .L8009B69C
    or          $s0, $s0, $s2
    sw          $s0, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s1, $zero, 0x4
    addu        $s0, $zero, $zero
.L8009B69C:
    bnez        $a0, .L8009B660
    srl         $s2, $s5, 24
    j           func_80096DD8
    addiu       $s4, $s4, -0x1
.L8009B6AC:
    beq         $s1, $v0, .L8009B6CC
    nop
    beqz        $s1, .L8009B6CC
    nop
.L8009B6BC:
    addiu       $s1, $s1, -0x1
    bnez        $s1, .L8009B6BC
    sll         $s0, $s0, 8
    sw          $s0, 0x0($s3)
.L8009B6CC:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009B490

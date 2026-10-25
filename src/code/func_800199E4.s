.text
.align 2
.set noreorder
.globl func_800199E4
.ent func_800199E4
func_800199E4:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $s4, 0x28($sp)
    addu        $s4, $a1, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $a2, $zero
    sw          $s5, 0x2C($sp)
    addu        $s5, $a3, $zero
    andi        $v1, $s4, 0xFFFF
    addiu       $v0, $zero, 0x4
    sw          $ra, 0x30($sp)
    sw          $s3, 0x24($sp)
    beq         $v1, $v0, .L80019A34
    sw          $s0, 0x18($sp)
    addiu       $v0, $zero, 0xB
    beql        $v1, $v0, .L80019A38
    addiu       $s4, $zero, 0x40
    j .L80019A3C
    addu        $a0, $s2, $zero
.L80019A34:
    addiu       $s4, $zero, 0x100
.L80019A38:
    addu        $a0, $s2, $zero
.L80019A3C:
    addiu       $a1, $sp, 0x10
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    lhu         $v0, 0x10($sp)
    beqz        $v0, .L80019AE8
    addu        $s3, $zero, $zero
    addu        $a0, $s2, $zero
.L80019A5C:
    addiu       $a1, $sp, 0x12
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x13
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lbu         $v0, 0x12($sp)
    lw          $a0, 0x0($s1)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $v1, $a0, $v1
    sw          $v1, 0x0($s1)
    lbu         $v0, 0x13($sp)
    beql        $v0, $zero, .L80019AA4
    addu        $v0, $s4, $zero
.L80019AA4:
    addu        $a0, $s2, $zero
    addu        $a1, $s5, $v1
    andi        $v0, $v0, 0xFFFF
    sll         $s0, $v0, 1
    addu        $s0, $s0, $v0
    andi        $a2, $s0, 0xFFFF
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lw          $v0, 0x0($s1)
    addu        $v0, $v0, $s0
    sw          $v0, 0x0($s1)
    lhu         $v1, 0x10($sp)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80019A5C
    addu        $a0, $s2, $zero
.L80019AE8:
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
.end func_800199E4

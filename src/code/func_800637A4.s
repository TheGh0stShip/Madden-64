.text
.align 2
.set noreorder
.globl func_800637A4
.ent func_800637A4
func_800637A4:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    addu        $s2, $a2, $zero
    lui         $v0, 0x3B9A
    ori         $v0, $v0, 0xC9F0
    sw          $ra, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    lw          $s3, 0x4($s0)
    sltu        $v0, $v0, $s2
    beqz        $v0, .L800637E8
    addu        $s4, $a1, $zero
    jal         func_800635A0
    addiu       $a1, $zero, 0x3
.L800637E8:
    andi        $v1, $s2, 0x7
    beqz        $v1, .L800637F8
    addiu       $v0, $s2, 0x8
    subu        $s2, $v0, $v1
.L800637F8:
    sltiu       $v0, $s4, 0x2
    bnez        $v0, .L8006382C
    addu        $a0, $s0, $zero
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
.L8006382C:
    jal         func_80064970
    addiu       $a1, $s2, 0x10
    addu        $s1, $v0, $zero
    bnez        $s1, .L80063848
    addu        $a0, $s0, $zero
    jal         func_800635A0
    addiu       $a1, $zero, 0x4
.L80063848:
    lw          $v0, 0x48($s3)
    sll         $v1, $s4, 2
    addu        $v1, $v1, $s3
    addiu       $v0, $v0, 0x10
    addu        $v0, $v0, $s2
    sw          $v0, 0x48($s3)
    lw          $a0, 0x38($v1)
    addiu       $v0, $s1, 0x10
    sw          $s2, 0x4($s1)
    sw          $zero, 0x8($s1)
    sw          $a0, 0x0($s1)
    sw          $s1, 0x38($v1)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800637A4

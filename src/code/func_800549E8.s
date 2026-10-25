.text
.align 2
.set noreorder
.globl func_800549E8
.ent func_800549E8
func_800549E8:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x24($sp)
    sw          $s2, 0x20($sp)
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xCD
    beq         $v1, $v0, .L80054A3C
    addu        $s2, $a2, $zero
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x12
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L80054A3C:
    lw          $v1, 0x8C($s0)
    lw          $v0, 0x74($s0)
    sltu        $v0, $v1, $v0
    bnez        $v0, .L80054A74
    addiu       $v0, $zero, 0x77
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
    j .L80054AD0
    addu        $v0, $zero, $zero
.L80054A74:
    lw          $v0, 0x8($s0)
    beqz        $v0, .L80054AA0
    nop
    sw          $v1, 0x4($v0)
    lw          $v1, 0x8($s0)
    lw          $v0, 0x74($s0)
    sw          $v0, 0x8($v1)
    lw          $v0, 0x8($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80054AA0:
    lw          $v0, 0x1A4($s0)
    addu        $a0, $s0, $zero
    addu        $a1, $s1, $zero
    sw          $zero, 0x10($sp)
    lw          $v0, 0x4($v0)
    addiu       $a2, $sp, 0x10
    jalr        $v0
    addu        $a3, $s2, $zero
    lw          $v0, 0x10($sp)
    lw          $v1, 0x8C($s0)
    addu        $v1, $v1, $v0
    sw          $v1, 0x8C($s0)
.L80054AD0:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800549E8

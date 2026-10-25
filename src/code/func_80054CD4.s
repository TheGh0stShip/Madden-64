.text
.align 2
.set noreorder
.globl func_80054CD4
.ent func_80054CD4
func_80054CD4:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $v0, 0x10($s0)
    addiu       $v0, $v0, -0xCD
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80054D20
    nop
    lw          $v0, 0x40($s0)
    beqz        $v0, .L80054D20
    nop
    lw          $v0, 0x1A0($s0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    nop
    addiu       $v0, $zero, 0xD0
    j .L80054D70
    sw          $v0, 0x10($s0)
.L80054D20:
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xD0
    beq         $v1, $v0, .L80054D70
    addiu       $v0, $zero, 0x12
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L80054D70
    nop
.L80054D5C:
    lw          $v0, 0x0($v1)
    jalr        $v0
    addu        $a0, $s0, $zero
    beqz        $v0, .L80054D9C
    addu        $v0, $zero, $zero
.L80054D70:
    lw          $v1, 0x90($s0)
    lw          $v0, 0x98($s0)
    slt         $v0, $v0, $v1
    bnez        $v0, .L80054D94
    addiu       $v0, $zero, 0xCF
    lw          $v1, 0x1B0($s0)
    lw          $v0, 0x14($v1)
    beqz        $v0, .L80054D5C
    addiu       $v0, $zero, 0xCF
.L80054D94:
    sw          $v0, 0x10($s0)
    addiu       $v0, $zero, 0x1
.L80054D9C:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80054CD4

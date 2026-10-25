.text
.align 2
.set noreorder
.globl func_800548B8
.ent func_800548B8
func_800548B8:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x10($s1)
    addiu       $s0, $zero, 0xCC
    beq         $v0, $s0, .L800548F4
    nop
    lw          $v0, 0x1A0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
    sw          $zero, 0x8C($s1)
    sw          $s0, 0x10($s1)
.L800548F4:
    lw          $v0, 0x1A0($s1)
    lw          $v0, 0x8($v0)
    beqz        $v0, .L800549B8
    nop
.L80054904:
    lw          $v0, 0x8C($s1)
    lw          $v1, 0x74($s1)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L80054984
    nop
.L80054918:
    lw          $v1, 0x8($s1)
    beqz        $v1, .L80054948
    nop
    lw          $v0, 0x8C($s1)
    sw          $v0, 0x4($v1)
    lw          $v1, 0x8($s1)
    lw          $v0, 0x74($s1)
    sw          $v0, 0x8($v1)
    lw          $v0, 0x8($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80054948:
    lw          $v0, 0x1A4($s1)
    addu        $a0, $s1, $zero
    lw          $s0, 0x8C($s1)
    addu        $a1, $zero, $zero
    lw          $v0, 0x4($v0)
    addiu       $a2, $s1, 0x8C
    jalr        $v0
    addu        $a3, $zero, $zero
    lw          $v1, 0x8C($s1)
    beq         $v1, $s0, .L800549D0
    addu        $v0, $zero, $zero
    lw          $v0, 0x74($s1)
    sltu        $v0, $v1, $v0
    bnez        $v0, .L80054918
    nop
.L80054984:
    lw          $v0, 0x1A0($s1)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    lw          $v0, 0x1A0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    lw          $v0, 0x1A0($s1)
    sw          $zero, 0x8C($s1)
    lw          $v0, 0x8($v0)
    bnez        $v0, .L80054904
    nop
.L800549B8:
    lw          $v0, 0x44($s1)
    beqz        $v0, .L800549C8
    addiu       $v1, $zero, 0xCD
    addiu       $v1, $zero, 0xCE
.L800549C8:
    sw          $v1, 0x10($s1)
    addiu       $v0, $zero, 0x1
.L800549D0:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800548B8

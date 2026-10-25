.text
.align 2
.set noreorder
.globl func_800B59C0
.ent func_800B59C0
func_800B59C0:
    jal         func_800A245C
    nop
    jal         func_800AAC94
    nop
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $at, 0x8008
    sb          $zero, 0x7AF2($at)
    andi        $v0, $v1, 0x10
    beqz        $v0, .L800B5A00
    addiu       $v0, $zero, -0x11
    and         $v0, $v1, $v0
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800BC5C8
    nop
.L800B5A00:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    andi        $v0, $v1, 0x2000
    beqz        $v0, .L800B5A28
    addiu       $v0, $zero, -0x2001
    and         $v0, $v1, $v0
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800BE1B0
    nop
.L800B5A28:
    lui         $v0, 0x8009
    lh          $v0, -0x5088($v0)
    blez        $v0, .L800B5A68
    addu        $a0, $zero, $zero
    addu        $a2, $v0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5C18
.L800B5A44:
    lw          $v1, 0x0($a1)
    beqz        $v1, .L800B5A5C
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800B5A5C:
    slt         $v0, $a0, $a2
    bnez        $v0, .L800B5A44
    addiu       $a1, $a1, 0x4
.L800B5A68:
    jal         func_800417C0
    nop
    lui         $v1, 0x8009
    lbu         $v1, -0x4D7E($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B5A94
    nop
    lui         $a0, 0x8008
    lb          $a0, 0x4FA8($a0)
    jal         func_8009EB14
    nop
.L800B5A94:
    jal         func_800311D0
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800B59C0

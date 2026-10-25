.text
.align 2
.set noreorder
.globl func_800C69B4
.ent func_800C69B4
func_800C69B4:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x1C($sp)
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800C69DC
    nop
    jal         func_800C11EC
    addiu       $a1, $zero, 0x28
.L800C69DC:
    lbu         $v1, 0x64($s0)
    addiu       $v0, $v1, -0x5
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C6A18
    andi        $v1, $v1, 0xFF
    addiu       $v0, $zero, 0x1A
    beq         $v1, $v0, .L800C6A18
    nop
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x1A
    sb          $v0, 0x10($sp)
    addu        $a0, $s0, $zero
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
.L800C6A18:
    jal         func_8003EE10
    addu        $a0, $s0, $zero
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C69B4

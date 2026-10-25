.text
.align 2
.set noreorder
.globl func_80096758
.ent func_80096758
func_80096758:
    jal         func_800E1DB8
    sw          $v0, 0x10($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L80096784
    nop
    lbu         $v0, 0x19($sp)
    andi        $v0, $v0, 0x7F
    lui         $at, 0x8009
    sb          $v0, -0x6AE6($at)
.L80096784:
    jal         func_800BDB28
    addu        $a0, $s1, $zero
    jal         func_800BCF98
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    bne         $s1, $v0, .L800967C0
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4854($v0)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L800967C0
    nop
    jal         func_800D6118
    nop
.L800967C0:
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
.end func_80096758

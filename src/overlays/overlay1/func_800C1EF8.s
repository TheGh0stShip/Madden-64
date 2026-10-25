.text
.align 2
.set noreorder
.globl func_800C1EF8
.ent func_800C1EF8
func_800C1EF8:
    beq         $v1, $v0, .L800C1F30
    nop
    lui         $v0, 0x8009
    lbu         $v0, -0x6AE6($v0)
    beqz        $v0, .L800C1F30
    addiu       $v1, $zero, 0x3
    lui         $v0, 0x8009
    lh          $v0, -0x6CC0($v0)
    beq         $v0, $v1, .L800C1F30
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4E($v0)
    bne         $v0, $v1, .L800C1F64
    nop
.L800C1F30:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800C1F64
    sll         $a0, $s0, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x7F10($at)
    lbu         $a1, 0x1E($v0)
    jal         func_800BD854
    addu        $a2, $zero, $zero
.L800C1F64:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C1EF8

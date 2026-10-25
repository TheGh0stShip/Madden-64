.text
.align 2
.set noreorder
.globl func_800A64A0
.ent func_800A64A0
func_800A64A0:
    addiu       $a0, $zero, 0x40
    addiu       $a1, $zero, 0x3C
    addu        $a2, $zero, $zero
    jal         func_8003CEB8
    addiu       $a3, $zero, 0x10
    jal         func_8003D8C0
    addiu       $a0, $zero, 0x40
    sll         $v0, $v0, 16
    bnez        $v0, .L800A64DC
    addu        $a0, $s2, $zero
    jal         func_8003CBB8
    nop
    sll         $v0, $v0, 16
    bnez        $v0, . + 4 + (0x14B << 2)
    addu        $a0, $s2, $zero
.L800A64DC:
    addiu       $a1, $zero, 0xC00
    jal         func_800C0018
    addu        $a2, $zero, $zero
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    j           func_800A22E0
    nop
.end func_800A64A0

.text
.align 2
.set noreorder
.globl func_80094580
.ent func_80094580
func_80094580:
    addiu       $a0, $a0, 0x57C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x5958
    addu        $a0, $s1, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x40C0
    jal         func_8002E65C
    addu        $s0, $v0, $zero
    lbu         $a0, 0x3($s0)
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5953
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    addiu       $a0, $a0, 0x1
    sll         $a0, $a0, 16
    jal         func_800167FC
    sra         $a0, $a0, 16
    j           func_8008FEC8
    nop
.end func_80094580

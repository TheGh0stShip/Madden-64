.text
.align 2
.set noreorder
.globl func_80094530
.ent func_80094530
func_80094530:
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5958
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x40C0
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    lbu         $a0, 0x4($s1)
    j           func_8008FE88
    nop
.end func_80094530

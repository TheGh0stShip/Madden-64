.text
.align 2
.set noreorder
.globl func_800970F0
.ent func_800970F0
func_800970F0:
    andi        $v0, $s4, 0x4
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    j           func_800929F4
    addiu       $a1, $zero, 0x1
.end func_800970F0

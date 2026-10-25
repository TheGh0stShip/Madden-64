.text
.align 2
.set noreorder
.globl func_800AF1FC
.ent func_800AF1FC
func_800AF1FC:
    blezl       $a1, .L800AF204
    addiu       $a0, $zero, 0x1
.L800AF204:
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $a1, $a2, 3
    addu        $a1, $a1, $a2
    jal         func_800167FC
    addu        $a1, $a1, $s3
    j           func_800AABF0
    addiu       $a0, $zero, 0xF
.end func_800AF1FC

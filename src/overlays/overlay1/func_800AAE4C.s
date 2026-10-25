.text
.align 2
.set noreorder
.globl func_800AAE4C
.ent func_800AAE4C
func_800AAE4C:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0xD
    jal         func_800A3004
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0xD
    sh          $v0, 0x4($s0)
    jal         func_8004519C
    sh          $zero, 0x8($s0)
    j           func_800A6798
    nop
.end func_800AAE4C

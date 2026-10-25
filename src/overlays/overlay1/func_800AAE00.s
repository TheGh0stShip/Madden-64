.text
.align 2
.set noreorder
.globl func_800AAE00
.ent func_800AAE00
func_800AAE00:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0xA
    jal         func_800A3004
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0xA
    sh          $v0, 0x4($s0)
    j           func_800A6798
    sh          $zero, 0x8($s0)
.end func_800AAE00

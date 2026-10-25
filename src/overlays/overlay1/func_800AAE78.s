.text
.align 2
.set noreorder
.globl func_800AAE78
.ent func_800AAE78
func_800AAE78:
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1
    addiu       $a2, $zero, 0xE
    jal         func_800A3004
    addu        $a3, $zero, $zero
    j           func_800A6798
    sh          $zero, 0x8($s0)
.end func_800AAE78

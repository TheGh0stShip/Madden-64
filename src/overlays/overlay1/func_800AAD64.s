.text
.align 2
.set noreorder
.globl func_800AAD64
.ent func_800AAD64
func_800AAD64:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_800A3004
    addu        $a3, $zero, $zero
    sh          $zero, 0x4($s0)
    j           func_800A6798
    sh          $zero, 0x8($s0)
.end func_800AAD64

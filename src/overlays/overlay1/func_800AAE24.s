.text
.align 2
.set noreorder
.globl func_800AAE24
.ent func_800AAE24
func_800AAE24:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x2
    jal         func_800A3004
    addiu       $a3, $zero, 0xDFF
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x4($s0)
    addiu       $v0, $zero, 0xDFF
    j           func_800A6798
    sh          $v0, 0x8($s0)
.end func_800AAE24

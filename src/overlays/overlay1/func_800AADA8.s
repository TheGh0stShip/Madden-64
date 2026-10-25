.text
.align 2
.set noreorder
.globl func_800AADA8
.ent func_800AADA8
func_800AADA8:
    addiu       $a2, $zero, 0x1
    jal         func_800A3004
    addiu       $a3, $zero, 0xBFF
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x4($s0)
    addiu       $v0, $zero, 0xBFF
    j           func_800A6798
    sh          $v0, 0x8($s0)
.end func_800AADA8

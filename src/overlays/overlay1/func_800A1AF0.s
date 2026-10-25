.text
.align 2
.set noreorder
.globl func_800A1AF0
.ent func_800A1AF0
func_800A1AF0:
    lbu         $s6, 0x1($s0)
    lhu         $s0, 0x4($s0)
    addiu       $s4, $zero, 0x6
    j           func_8009D79C
    sh          $s0, 0x36($sp)
.end func_800A1AF0

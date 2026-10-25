.text
.align 2
.set noreorder
.globl func_800A1AE0
.ent func_800A1AE0
func_800A1AE0:
    lw          $v0, 0xC($s0)
    lbu         $s6, 0x1E($v0)
    j           func_8009D79C
    addiu       $s4, $zero, 0x4
.end func_800A1AE0

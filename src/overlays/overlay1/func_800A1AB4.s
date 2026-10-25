.text
.align 2
.set noreorder
.globl func_800A1AB4
.ent func_800A1AB4
func_800A1AB4:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    addiu       $t0, $zero, -0x1
    bne         $v0, $t0, . + 4 + (0xFF << 2)
    addiu       $s4, $zero, 0x5
    lw          $v0, 0xC($s0)
    lbu         $s6, 0x1E($v0)
    j           func_8009D7A0
    addiu       $s1, $s1, 0x1
.end func_800A1AB4

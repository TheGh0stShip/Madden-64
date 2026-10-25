.text
.align 2
.set noreorder
.globl func_800A1C48
.ent func_800A1C48
func_800A1C48:
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x76F6($v0)
    bnez        $v0, . + 4 + (0x9B << 2)
    addiu       $s1, $s1, 0x1
    lw          $v0, 0xC($s0)
    beqz        $v0, . + 4 + (0x99 << 2)
    andi        $v0, $s1, 0xFFFF
    j           func_8009D558
    nop
.end func_800A1C48

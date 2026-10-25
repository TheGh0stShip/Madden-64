.text
.align 2
.set noreorder
.globl func_800AD460
.ent func_800AD460
func_800AD460:
    addiu       $s0, $s0, -0x1
    bgtz        $s0, . + 4 + (-0x9 << 2)
    sw          $v0, 0x20($v1)
    j           func_800A8E70
    nop
.end func_800AD460

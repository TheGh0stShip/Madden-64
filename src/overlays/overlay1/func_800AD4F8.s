.text
.align 2
.set noreorder
.globl func_800AD4F8
.ent func_800AD4F8
func_800AD4F8:
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5F04($v1)
    addiu       $s0, $s0, -0x1
    bgtz        $s0, . + 4 + (-0x9 << 2)
    sw          $v0, 0x20($v1)
    j           func_800A8E70
    nop
.end func_800AD4F8

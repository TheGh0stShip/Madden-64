.text
.align 2
.set noreorder
.globl func_800B3224
.ent func_800B3224
func_800B3224:
    jal         func_8000BF08
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x7914($v0)
    beq         $v0, $s0, . + 4 + (-0x9 << 2)
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B3224

.text
.align 2
.set noreorder
.globl func_800A27CC
.ent func_800A27CC
func_800A27CC:
    lui         $at, 0x8008
    sw          $v0, 0x54A4($at)
    j           func_8009E0BC
    nop
.end func_800A27CC

.text
.align 2
.set noreorder
.globl func_800B2940
.ent func_800B2940
func_800B2940:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4014
    j           func_800AE2FC
    nop
.end func_800B2940

.text
.align 2
.set noreorder
.globl func_800B28FC
.ent func_800B28FC
func_800B28FC:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2BE0
    jal         func_8002E65C
    nop
    j           func_800AE408
    nop
.end func_800B28FC

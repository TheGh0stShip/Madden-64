.text
.align 2
.set noreorder
.globl func_800B19AC
.ent func_800B19AC
func_800B19AC:
    nop
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6DB0
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2038
    jal         func_8002E65C
    nop
    j           func_800AD344
    nop
.end func_800B19AC

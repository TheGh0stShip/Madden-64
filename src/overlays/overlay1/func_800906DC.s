.text
.align 2
.set noreorder
.globl func_800906DC
.ent func_800906DC
func_800906DC:
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x100
    addiu       $v0, $v0, 0x200
    lui         $at, 0x8006
    sh          $v0, 0x4A4E($at)
    j           func_8008BFE0
    nop
.end func_800906DC

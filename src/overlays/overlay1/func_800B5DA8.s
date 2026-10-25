.text
.align 2
.set noreorder
.globl func_800B5DA8
.ent func_800B5DA8
func_800B5DA8:
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6D18($at)
    jal         func_80016FE4
    nop
    lui         $v0, 0x8009
.end func_800B5DA8

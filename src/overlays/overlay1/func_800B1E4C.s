.text
.align 2
.set noreorder
.globl func_800B1E4C
.ent func_800B1E4C
func_800B1E4C:
    nop
    lui         $at, 0x8008
    sh          $s1, 0x57E2($at)
    j           func_800AD75C
    nop
.end func_800B1E4C

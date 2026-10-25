.text
.align 2
.set noreorder
.globl func_80097590
.ent func_80097590
func_80097590:
    addu        $a0, $a0, $v0
    sll         $v0, $a1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
.end func_80097590

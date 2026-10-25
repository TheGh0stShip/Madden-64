.text
.align 2
.set noreorder
.globl func_80097578
.ent func_80097578
func_80097578:
    lui         $a0, 0x8008
    lw          $a0, 0x7894($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a1, 0x2DC0($at)
    sll         $v0, $v0, 2
.end func_80097578

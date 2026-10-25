.text
.align 2
.set noreorder
.globl func_800BCEEC
.ent func_800BCEEC
func_800BCEEC:
    sll         $v0, $s1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x2620($at)
    jr          $v0
    nop
.end func_800BCEEC

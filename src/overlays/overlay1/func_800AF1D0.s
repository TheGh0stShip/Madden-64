.text
.align 2
.set noreorder
.globl func_800AF1D0
.ent func_800AF1D0
func_800AF1D0:
    sw          $a1, 0x0($a3)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $s4, 0x5818($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x5819($at)
    j           func_800AABF0
    addiu       $a0, $zero, 0xF
.end func_800AF1D0

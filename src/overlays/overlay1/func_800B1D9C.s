.text
.align 2
.set noreorder
.globl func_800B1D9C
.ent func_800B1D9C
func_800B1D9C:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x57E0
    lh          $v1, 0x0($a0)
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    bne         $v1, $v0, .L800B1DC8
    addiu       $v0, $zero, 0x7FFE
    lui         $at, 0x8008
    sh          $s1, 0x6BF2($at)
    j           func_800AD754
    nop
.L800B1DC8:
    lui         $at, 0x8008
    sh          $v0, 0x6BF2($at)
    j           func_800AD744
    sh          $s0, 0x0($a0)
.end func_800B1D9C

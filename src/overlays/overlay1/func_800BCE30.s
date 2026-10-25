.text
.align 2
.set noreorder
.globl func_800BCE30
.ent func_800BCE30
func_800BCE30:
    bnez        $s0, .L800BCE3C
    addiu       $v0, $a3, 0xD1
    addiu       $v0, $a3, 0xCF
.L800BCE3C:
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BDC
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x4
.end func_800BCE30

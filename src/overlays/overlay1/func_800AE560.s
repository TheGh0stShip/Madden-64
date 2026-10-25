.text
.align 2
.set noreorder
.globl func_800AE560
.ent func_800AE560
func_800AE560:
    lui         $at, 0x8008
    sh          $v1, -0x5EAC($at)
    lui         $at, 0x8008
    sh          $v1, -0x5EAA($at)
    lui         $at, 0x8007
    sb          $v0, -0x483C($at)
    j           func_800A9EC4
    addiu       $s6, $zero, 0x1
.end func_800AE560

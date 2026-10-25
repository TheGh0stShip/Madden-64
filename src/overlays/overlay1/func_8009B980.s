.text
.align 2
.set noreorder
.globl func_8009B980
.ent func_8009B980
func_8009B980:
    lui         $at, 0x8000
    lwc1        $f5, 0x7A0($at)
    lwc1        $f4, 0x7A4($at)
    lwc1        $f2, 0x1C($v1)
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    lwc1        $f0, 0x20($v1)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    j           func_800972C4
    nop
.end func_8009B980

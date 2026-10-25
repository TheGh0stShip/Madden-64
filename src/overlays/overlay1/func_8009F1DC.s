.text
.align 2
.set noreorder
.globl func_8009F1DC
.ent func_8009F1DC
func_8009F1DC:
    lwc1        $f0, 0x20($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x4620018D  # trunc.w.d   $f6, $f0
    .word       0x44023000  # mfc1        $v0, $f6
    sh          $v0, 0x1A($sp)
    lw          $v0, 0x4($s1)
    lwc1        $f0, 0x1C($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x46240001  # sub.d       $f0, $f0, $f4
    .word       0x4620010D  # trunc.w.d   $f4, $f0
    .word       0x44022000  # mfc1        $v0, $f4
    sh          $v0, 0x20($sp)
    lw          $v0, 0x4($s1)
    lwc1        $f0, 0x20($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    j           func_8009ABB4
    .word       0x46000021  # cvt.d.s     $f0, $f0
.end func_8009F1DC

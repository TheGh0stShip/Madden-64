.text
.align 2
.set noreorder
.globl func_8009A440
.ent func_8009A440
func_8009A440:
    addiu       $a0, $zero, 0x4
    lui         $a0, 0x44
    ori         $a0, $a0, 0x3078
    lui         $a1, 0x44
    jal         func_8000A63C
    ori         $a1, $a1, 0x3078
    lwc1        $f2, 0x5C($sp)
    lui         $at, 0x8000
    lwc1        $f0, 0x71C($at)
    .word       0x4602003E  # c.le.s      $f0, $f2
    nop
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46001001  # sub.s       $f0, $f2, $f0
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44040000  # mfc1        $a0, $f0
    j           func_80095D74
    andi        $a0, $a0, 0xFFFF
.L8009A484:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44041000  # mfc1        $a0, $f2
    lui         $v0, 0x8000
    or          $a0, $a0, $v0
    andi        $a0, $a0, 0xFFFF
    jal         func_8000A5D4
    addu        $a1, $zero, $zero
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFC
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xF279
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
.end func_8009A440

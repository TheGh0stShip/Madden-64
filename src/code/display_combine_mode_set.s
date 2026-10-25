.text
.align 2
.set noreorder
.globl display_combine_mode_set
.ent display_combine_mode_set
display_combine_mode_set:
    lui         $v0, 0x8009
    lw          $v0, -0x782C($v0)
    lw          $t2, 0x10($sp)
    bne         $v0, $a0, .L8000A6F4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7828($v0)
    bne         $v0, $a1, .L8000A6F4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7824($v0)
    bne         $v0, $a2, .L8000A6F4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7820($v0)
    bne         $v0, $a3, .L8000A6F4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x781C($v0)
    beq         $v0, $t2, .L8000A828
    nop
.L8000A6F4:
    lui         $t1, 0x8008
    lw          $t1, 0x4F5C($t1)
    .word       0x44851000  # mtc1        $a1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    addiu       $v0, $t1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    bgez        $a1, .L8000A728
    nop
    lui         $at, 0x8000
    lwc1        $f1, 0x668($at)
    lwc1        $f0, 0x66C($at)
    .word       0x46201080  # add.d       $f2, $f2, $f0
.L8000A728:
    lui         $at, 0x8000
    lwc1        $f6, 0x670($at)
    .word       0x46201020  # cvt.s.d     $f0, $f2
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x44862000  # mtc1        $a2, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    andi        $v0, $v0, 0xFFF
    bgez        $a2, .L8000A764
    sll         $t0, $v0, 12
    lui         $at, 0x8000
    lwc1        $f1, 0x674($at)
    lwc1        $f0, 0x678($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L8000A764:
    .word       0x46202020  # cvt.s.d     $f0, $f4
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x44872000  # mtc1        $a3, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    andi        $v0, $v0, 0xFFF
    lui         $v1, 0xED00
    or          $v0, $v0, $v1
    or          $v0, $t0, $v0
    sw          $v0, 0x0($t1)
    andi        $v0, $a0, 0x3
    bgez        $a3, .L8000A7AC
    sll         $t0, $v0, 24
    lui         $at, 0x8000
    lwc1        $f1, 0x67C($at)
    lwc1        $f0, 0x680($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L8000A7AC:
    .word       0x46202020  # cvt.s.d     $f0, $f4
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x448A2000  # mtc1        $t2, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    andi        $v0, $v0, 0xFFF
    sll         $v0, $v0, 12
    bgez        $t2, .L8000A7E4
    or          $t0, $t0, $v0
    lui         $at, 0x8000
    lwc1        $f1, 0x684($at)
    lwc1        $f0, 0x688($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L8000A7E4:
    .word       0x46202020  # cvt.s.d     $f0, $f4
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    andi        $v0, $v0, 0xFFF
    or          $v0, $t0, $v0
    sw          $v0, 0x4($t1)
    lui         $at, 0x8009
    sw          $a0, -0x782C($at)
    lui         $at, 0x8009
    sw          $a1, -0x7828($at)
    lui         $at, 0x8009
    sw          $a2, -0x7824($at)
    lui         $at, 0x8009
    sw          $a3, -0x7820($at)
    lui         $at, 0x8009
    sw          $t2, -0x781C($at)
.L8000A828:
    jr          $ra
    nop
.end display_combine_mode_set

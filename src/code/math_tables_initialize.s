.text
.align 2
.set noreorder
.globl math_tables_initialize
.ent math_tables_initialize
math_tables_initialize:
    lui         $v0, 0x8009
    lw          $v0, -0x7B30($v0)
    lui         $at, 0x8007
    sw          $a0, 0x232C($at)
    lui         $at, 0x8007
    sw          $a1, 0x2334($at)
    lui         $at, 0x8007
    sw          $a2, 0x2328($at)
    lui         $at, 0x8007
    sw          $a3, 0x2330($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    bgez        $v0, .L80032608
    nop
    lui         $at, 0x8000
    lwc1        $f1, 0x2468($at)
    lwc1        $f0, 0x246C($at)
    .word       0x46201080  # add.d       $f2, $f2, $f0
.L80032608:
    lui         $t0, 0x8009
    lw          $t0, -0x7B34($t0)
    .word       0x46201320  # cvt.s.d     $f12, $f2
    addu        $v0, $t0, $zero
    srl         $t0, $t0, 16
    andi        $v1, $v0, 0xFFFF
    subu        $v0, $v1, $t0
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    bgez        $v0, .L80032644
    nop
    lui         $at, 0x8000
    lwc1        $f1, 0x2470($at)
    lwc1        $f0, 0x2474($at)
    .word       0x46201080  # add.d       $f2, $f2, $f0
.L80032644:
    lui         $v0, 0x8009
    lw          $v0, -0x7B48($v0)
    .word       0x462011A0  # cvt.s.d     $f6, $f2
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46066002  # mul.s       $f0, $f12, $f6
    bgezl       $v0, .L80032678
    nop
    lui         $at, 0x8000
    lwc1        $f1, 0x2478($at)
    lwc1        $f0, 0x247C($at)
    .word       0x46201080  # add.d       $f2, $f2, $f0
    .word       0x46066002  # mul.s       $f0, $f12, $f6
.L80032678:
    lui         $v0, 0x8009
    lw          $v0, -0x7B24($v0)
    .word       0x46201220  # cvt.s.d     $f8, $f2
    .word       0x44822000  # mtc1        $v0, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    bgez        $v0, .L800326A4
    .word       0x46080303  # div.s       $f12, $f0, $f8
    lui         $at, 0x8000
    lwc1        $f1, 0x2480($at)
    lwc1        $f0, 0x2484($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L800326A4:
    lui         $t1, 0x8009
    lw          $t1, -0x7B20($t1)
    addu        $v0, $t1, $zero
    srl         $t1, $t1, 16
    andi        $t2, $v0, 0xFFFF
    subu        $v0, $t2, $t1
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    bgez        $v0, .L800326DC
    .word       0x462023A0  # cvt.s.d     $f14, $f4
    lui         $at, 0x8000
    lwc1        $f1, 0x2488($at)
    lwc1        $f0, 0x248C($at)
    .word       0x46201080  # add.d       $f2, $f2, $f0
.L800326DC:
    .word       0x462012A0  # cvt.s.d     $f10, $f2
    .word       0x460A7002  # mul.s       $f0, $f14, $f10
    lui         $at, 0x8000
    lwc1        $f16, 0x2490($at)
    .word       0x44882000  # mtc1        $t0, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    bgez        $t0, .L8003270C
    .word       0x46100383  # div.s       $f14, $f0, $f16
    lui         $at, 0x8000
    lwc1        $f1, 0x2494($at)
    lwc1        $f0, 0x2498($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L8003270C:
    .word       0x44860000  # mtc1        $a2, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x46084080  # add.s       $f2, $f8, $f8
    .word       0x46020003  # div.s       $f0, $f0, $f2
    .word       0x462020A0  # cvt.s.d     $f2, $f4
    .word       0x46001081  # sub.s       $f2, $f2, $f0
    lui         $at, 0x8000
    lwc1        $f0, 0x249C($at)
    .word       0x4602003E  # c.le.s      $f0, $f2
    nop
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46001001  # sub.s       $f0, $f2, $f0
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44080000  # mfc1        $t0, $f0
    j .L80032760
    nop
.L80032750:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44081000  # mfc1        $t0, $f2
    lui         $v0, 0x8000
    or          $t0, $t0, $v0
.L80032760:
    .word       0x44860000  # mtc1        $a2, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x46080003  # div.s       $f0, $f0, $f8
    .word       0x460C4082  # mul.s       $f2, $f8, $f12
    .word       0x46003180  # add.s       $f6, $f6, $f0
    .word       0x46061083  # div.s       $f2, $f2, $f6
    lui         $at, 0x8000
    lwc1        $f0, 0x24A0($at)
    .word       0x4602003E  # c.le.s      $f0, $f2
    addu        $t0, $t0, $a0
    lui         $a0, 0x8009
    lw          $a0, -0x4C84($a0)
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46001001  # sub.s       $f0, $f2, $f0
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44030000  # mfc1        $v1, $f0
    j .L800327C0
    sltiu       $v0, $t0, 0x60
.L800327AC:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    lui         $v0, 0x8000
    or          $v1, $v1, $v0
    sltiu       $v0, $t0, 0x60
.L800327C0:
    beqz        $v0, .L800327CC
    sw          $v1, 0x20($a0)
    addiu       $t0, $zero, 0x60
.L800327CC:
    lui         $at, 0x8000
    lwc1        $f0, 0x24A4($at)
    .word       0x4606003E  # c.le.s      $f0, $f6
    nop
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46003001  # sub.s       $f0, $f6, $f0
    .word       0x4600300D  # trunc.w.s   $f0, $f6
    .word       0x44030000  # mfc1        $v1, $f0
    j .L80032808
    addu        $v1, $t0, $v1
.L800327F4:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    lui         $v0, 0x8000
    or          $v1, $v1, $v0
    addu        $v1, $t0, $v1
.L80032808:
    andi        $v1, $v1, 0xFFFF
    sltiu       $v0, $v1, 0x301
    bnez        $v0, .L8003281C
    sll         $t0, $t0, 16
    addiu       $v1, $zero, 0x300
.L8003281C:
    lui         $v0, 0x8009
    lw          $v0, -0x4C84($v0)
    or          $t0, $t0, $v1
    .word       0x44892000  # mtc1        $t1, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    bgez        $t1, .L80032848
    sw          $t0, 0x1C($v0)
    lui         $at, 0x8000
    lwc1        $f1, 0x24A8($at)
    lwc1        $f0, 0x24AC($at)
    .word       0x46202100  # add.d       $f4, $f4, $f0
.L80032848:
    .word       0x44870000  # mtc1        $a3, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x460A0002  # mul.s       $f0, $f0, $f10
    .word       0x46108080  # add.s       $f2, $f16, $f16
    .word       0x46020003  # div.s       $f0, $f0, $f2
    .word       0x462020A0  # cvt.s.d     $f2, $f4
    .word       0x46001081  # sub.s       $f2, $f2, $f0
    lui         $at, 0x8000
    lwc1        $f0, 0x24B0($at)
    .word       0x4602003E  # c.le.s      $f0, $f2
    nop
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46001001  # sub.s       $f0, $f2, $f0
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44090000  # mfc1        $t1, $f0
    j .L8003289C
    nop
.L8003288C:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44091000  # mfc1        $t1, $f2
    lui         $v0, 0x8000
    or          $t1, $t1, $v0
.L8003289C:
    .word       0x44870000  # mtc1        $a3, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x460A0002  # mul.s       $f0, $f0, $f10
    .word       0x46100003  # div.s       $f0, $f0, $f16
    .word       0x460E8082  # mul.s       $f2, $f16, $f14
    .word       0x46005280  # add.s       $f10, $f10, $f0
    .word       0x460A1083  # div.s       $f2, $f2, $f10
    lui         $at, 0x8000
    lwc1        $f0, 0x24B4($at)
    lui         $a0, 0x8009
    lw          $a0, -0x4C84($a0)
    .word       0x4602003E  # c.le.s      $f0, $f2
    addu        $t1, $t1, $a1
    .word       0x45010005  # bc1t        . + 4 + (0x5 << 2)
    addu        $a1, $a0, $zero
    .word       0x4600100D  # trunc.w.s   $f0, $f2
    .word       0x44030000  # mfc1        $v1, $f0
    j .L80032900
    sltiu       $v0, $t1, 0x8
.L800328E8:
    .word       0x46001001  # sub.s       $f0, $f2, $f0
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    lui         $v0, 0x8000
    or          $v1, $v1, $v0
    sltiu       $v0, $t1, 0x8
.L80032900:
    sw          $v1, 0x40($a1)
    beqz        $v0, .L80032910
    sw          $v1, 0x2C($a0)
    addiu       $t1, $zero, 0x8
.L80032910:
    sltu        $v0, $t2, $t1
    bnel        $v0, $zero, .L8003291C
    addiu       $t1, $zero, 0x8
.L8003291C:
    lui         $at, 0x8000
    lwc1        $f0, 0x24B8($at)
    .word       0x460A003E  # c.le.s      $f0, $f10
    nop
    .word       0x45030005  # bc1tl       . + 4 + (0x5 << 2)
    .word       0x46005001  # sub.s       $f0, $f10, $f0
    .word       0x4600500D  # trunc.w.s   $f0, $f10
    .word       0x44030000  # mfc1        $v1, $f0
    j .L80032958
    addu        $t2, $t1, $v1
.L80032944:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    lui         $v0, 0x8000
    or          $v1, $v1, $v0
    addu        $t2, $t1, $v1
.L80032958:
    andi        $t2, $t2, 0xFFFF
    sltiu       $v0, $t2, 0x205
    bnez        $v0, .L8003296C
    sll         $t1, $t1, 16
    addiu       $t2, $zero, 0x204
.L8003296C:
    lui         $v0, 0x8009
    lw          $v0, -0x4C84($v0)
    or          $t1, $t1, $t2
    sw          $t1, 0x44($v0)
    jr          $ra
    sw          $t1, 0x30($v0)
.end math_tables_initialize

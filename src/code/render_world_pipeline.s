.text
.align 2
.set noreorder
.globl render_world_pipeline
.ent render_world_pipeline
render_world_pipeline:
    addiu       $sp, $sp, -0x90
    swc1        $f27, 0x88($sp)
    swc1        $f26, 0x8C($sp)
    lui         $at, 0x8000
    lwc1        $f27, 0x924($at)
    lwc1        $f26, 0x928($at)
    swc1        $f21, 0x70($sp)
    swc1        $f20, 0x74($sp)
    lui         $at, 0x8000
    lwc1        $f21, 0x92C($at)
    lwc1        $f20, 0x930($at)
    swc1        $f25, 0x80($sp)
    swc1        $f24, 0x84($sp)
    lui         $at, 0x8000
    lwc1        $f25, 0x934($at)
    lwc1        $f24, 0x938($at)
    lui         $at, 0x8000
    lwc1        $f0, 0x93C($at)
    lui         $at, 0x8000
    lwc1        $f4, 0x940($at)
    .word       0x44801000  # mtc1        $zero, $f2
    sw          $s2, 0x68($sp)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x63E0
    sw          $ra, 0x6C($sp)
    sw          $s1, 0x64($sp)
    sw          $s0, 0x60($sp)
    swc1        $f23, 0x78($sp)
    swc1        $f22, 0x7C($sp)
    lui         $at, 0x8008
    sw          $zero, 0x5A34($at)
    swc1        $f2, 0x3C($sp)
    swc1        $f2, 0x40($sp)
    swc1        $f2, 0x44($sp)
    swc1        $f2, 0x4C($sp)
    swc1        $f2, 0x50($sp)
    swc1        $f2, 0x54($sp)
    lui         $at, 0x8008
    swc1        $f2, 0x789C($at)
    lui         $at, 0x8008
    swc1        $f2, 0x78A0($at)
    .word       0x46000586  # mov.s       $f22, $f0
    swc1        $f22, 0x38($sp)
    swc1        $f22, 0x48($sp)
    swc1        $f22, 0x58($sp)
    lui         $at, 0x8008
    swc1        $f4, 0x7898($at)
.L80013E40:
    lui         $at, 0x8006
    lwc1        $f0, 0x5570($at)
    lui         $at, 0x8000
    lwc1        $f5, 0x944($at)
    lwc1        $f4, 0x948($at)
    lui         $a0, 0x8008
    lw          $a0, 0x5A34($a0)
    .word       0x44801000  # mtc1        $zero, $f2
    swc1        $f22, 0x38($sp)
    swc1        $f22, 0x48($sp)
    swc1        $f22, 0x58($sp)
    swc1        $f2, 0x3C($sp)
    swc1        $f2, 0x40($sp)
    swc1        $f2, 0x44($sp)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240000  # add.d       $f0, $f0, $f4
    swc1        $f2, 0x4C($sp)
    swc1        $f2, 0x50($sp)
    swc1        $f2, 0x54($sp)
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $at, 0x8006
    swc1        $f0, 0x5570($at)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x4620D03C  # c.lt.d      $f26, $f0
    sll         $v0, $a0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $s1, -0x6A98($at)
    .word       0x45000005  # bc1f        . + 4 + (0x5 << 2)
    nop
    .word       0x463A0001  # sub.d       $f0, $f0, $f26
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $at, 0x8006
    swc1        $f0, 0x5570($at)
.L80013EC8:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $v0, 0x8006
    lw          $v0, 0x556C($v0)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x8006
    lhu         $v0, 0x5574($v0)
    addu        $v1, $v0, $v1
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x1000
    lui         $at, 0x8006
    sh          $v1, 0x5574($at)
    bnez        $v0, .L80013F10
    addiu       $v0, $v1, -0x1000
    lui         $at, 0x8006
    sh          $v0, 0x5574($at)
.L80013F10:
    lui         $at, 0x8000
    lwc1        $f3, 0x94C($at)
    lwc1        $f2, 0x950($at)
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f3, 0x954($at)
    lwc1        $f2, 0x958($at)
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x46000221  # cvt.d.s     $f8, $f0
    .word       0x463A4202  # mul.d       $f8, $f8, $f26
    lui         $at, 0x8000
    lwc1        $f1, 0x95C($at)
    lwc1        $f0, 0x960($at)
    .word       0x46204220  # cvt.s.d     $f8, $f8
    .word       0x46004121  # cvt.d.s     $f4, $f8
    .word       0x46202102  # mul.d       $f4, $f4, $f0
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4E($v0)
    lui         $at, 0x8000
    lwc1        $f3, 0x964($at)
    lwc1        $f2, 0x968($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f7, 0x96C($at)
    lwc1        $f6, 0x970($at)
    .word       0x4620208D  # trunc.w.d   $f2, $f4
    .word       0x44021000  # mfc1        $v0, $f2
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46261082  # mul.d       $f2, $f2, $f6
    lui         $v0, 0x8006
    lhu         $v0, 0x5574($v0)
    lui         $at, 0x8009
    swc1        $f8, -0x79D8($at)
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $at, 0x8009
    swc1        $f0, -0x6AA0($at)
    .word       0x4620100D  # trunc.w.d   $f0, $f2
    .word       0x44030000  # mfc1        $v1, $f0
    subu        $v0, $v1, $v0
    sll         $a0, $v0, 16
    lui         $at, 0x8009
    sh          $v1, -0x4C36($at)
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    jal         func_8002E828
    sra         $a0, $a0, 16
    lui         $a0, 0x8009
    lh          $a0, -0x4C36($a0)
    jal         func_8002E848
    addu        $s0, $v0, $zero
    lui         $at, 0x8009
    lwc1        $f4, -0x79D8($at)
    lui         $at, 0x8000
    lwc1        $f1, 0x974($at)
    lwc1        $f0, 0x978($at)
    .word       0x46002121  # cvt.d.s     $f4, $f4
    .word       0x46202102  # mul.d       $f4, $f4, $f0
    lui         $at, 0x8006
    lwc1        $f6, 0x5560($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46060002  # mul.s       $f0, $f0, $f6
    .word       0x44901000  # mtc1        $s0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46061082  # mul.s       $f2, $f2, $f6
    lui         $at, 0x8000
    lwc1        $f7, 0x97C($at)
    lwc1        $f6, 0x980($at)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    lui         $at, 0x8009
    lwc1        $f8, -0x6AA0($at)
    .word       0x46004221  # cvt.d.s     $f8, $f8
    .word       0x46244102  # mul.d       $f4, $f8, $f4
    nop
    .word       0x46204202  # mul.d       $f8, $f8, $f0
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46222102  # mul.d       $f4, $f4, $f2
    .word       0x46282100  # add.d       $f4, $f4, $f8
    lui         $at, 0x8000
    lwc1        $f0, 0x984($at)
    .word       0x46202120  # cvt.s.d     $f4, $f4
    .word       0x46002002  # mul.s       $f0, $f4, $f0
    lui         $at, 0x8008
    swc1        $f4, 0xC88($at)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44041000  # mfc1        $a0, $f2
    jal         func_8002E890
    addiu       $a1, $zero, 0x64
    lui         $a0, 0x8006
    lhu         $a0, 0x4A4E($a0)
    addiu       $v1, $zero, 0x300
    lui         $at, 0x8000
    lwc1        $f3, 0x988($at)
    lwc1        $f2, 0x98C($at)
    subu        $v1, $v1, $a0
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    addiu       $v0, $v0, -0x400
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
    bnez        $a0, .L800140EC
    addiu       $v0, $zero, -0x332
    lui         $at, 0x8009
    sh          $v0, -0x4C36($at)
.L800140EC:
    lui         $v1, 0x8009
    lhu         $v1, -0x4C36($v1)
    addiu       $v0, $sp, 0x3C
    sw          $v0, 0x10($sp)
    addiu       $v0, $sp, 0x40
    sw          $v0, 0x14($sp)
    addiu       $v0, $sp, 0x44
    sw          $v0, 0x18($sp)
    addiu       $v0, $sp, 0x48
    sw          $v0, 0x1C($sp)
    addiu       $v0, $sp, 0x4C
    sw          $v0, 0x20($sp)
    addiu       $v0, $sp, 0x50
    sw          $v0, 0x24($sp)
    addiu       $v0, $sp, 0x54
    sw          $v0, 0x28($sp)
    addiu       $v0, $sp, 0x58
    sw          $v0, 0x2C($sp)
    sw          $v1, 0x30($sp)
    lwc1        $f12, 0x50($sp)
    lwc1        $f14, 0x54($sp)
    lw          $a2, 0x58($sp)
    jal         func_80013B8C
    addiu       $a3, $sp, 0x38
    lui         $v1, 0x8008
    lw          $v1, 0x5A34($v1)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $v1, $v1, 2
    addu        $a0, $v1, $s2
    lw          $a3, 0x0($a0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4DE8
    sll         $v0, $v0, 5
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    lw          $t0, 0x0($v1)
.L80014188:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $a0, $a0, 4
    addu        $v1, $a0, $s1
    lh          $v0, 0x0($v1)
    lwc1        $f6, 0x38($sp)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003002  # mul.s       $f0, $f6, $f0
    lh          $v0, 0x2($v1)
    lwc1        $f12, 0x3C($sp)
    .word       0x44822000  # mtc1        $v0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x46046102  # mul.s       $f4, $f12, $f4
    lh          $v0, 0x4($v1)
    lwc1        $f10, 0x40($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46025082  # mul.s       $f2, $f10, $f2
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46020000  # add.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340000  # add.d       $f0, $f0, $f20
    addu        $a0, $a0, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x0($a0)
    lh          $v0, 0x0($v1)
    lwc1        $f0, 0x44($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lh          $v0, 0x2($v1)
    lwc1        $f8, 0x48($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46024202  # mul.s       $f8, $f8, $f2
    lh          $v0, 0x4($v1)
    lwc1        $f4, 0x4C($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46080000  # add.s       $f0, $f0, $f8
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340000  # add.d       $f0, $f0, $f20
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x2($a0)
    lh          $v0, 0x0($v1)
    lwc1        $f0, 0x50($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lh          $v0, 0x2($v1)
    lwc1        $f8, 0x54($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46024202  # mul.s       $f8, $f8, $f2
    lh          $v0, 0x4($v1)
    lwc1        $f4, 0x58($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46080000  # add.s       $f0, $f0, $f8
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340000  # add.d       $f0, $f0, $f20
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x4($a0)
    lb          $v0, 0xC($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003182  # mul.s       $f6, $f6, $f0
    lb          $v0, 0xD($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46006302  # mul.s       $f12, $f12, $f0
    lb          $v0, 0xE($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46005282  # mul.s       $f10, $f10, $f0
    .word       0x460C3180  # add.s       $f6, $f6, $f12
    .word       0x460A3180  # add.s       $f6, $f6, $f10
    .word       0x460031A1  # cvt.d.s     $f6, $f6
    .word       0x46343180  # add.d       $f6, $f6, $f20
    .word       0x4620300D  # trunc.w.d   $f0, $f6
    .word       0x44020000  # mfc1        $v0, $f0
    sb          $v0, 0xC($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v1, $v1, 4
    addu        $a0, $v1, $s1
    lb          $v0, 0xC($a0)
    lwc1        $f0, 0x44($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lb          $v0, 0xD($a0)
    lwc1        $f6, 0x48($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46023182  # mul.s       $f6, $f6, $f2
    lb          $v0, 0xE($a0)
    lwc1        $f4, 0x4C($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46060000  # add.s       $f0, $f0, $f6
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340000  # add.d       $f0, $f0, $f20
    addu        $v1, $v1, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0xD($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v1, $v1, 4
    addu        $a0, $v1, $s1
    lb          $v0, 0xC($a0)
    lwc1        $f0, 0x50($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lb          $v0, 0xD($a0)
    lwc1        $f6, 0x54($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46023182  # mul.s       $f6, $f6, $f2
    lb          $v0, 0xE($a0)
    lwc1        $f4, 0x58($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46060000  # add.s       $f0, $f0, $f6
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340000  # add.d       $f0, $f0, $f20
    addu        $v1, $v1, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0xE($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    addiu       $v1, $zero, 0xFF
    sll         $v0, $v0, 4
    addu        $v0, $v0, $t0
    sb          $v1, 0xF($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x5A1C($a1)
    sll         $a0, $a1, 4
    addu        $a2, $a0, $s1
    lhu         $v0, 0x8($a2)
    addu        $v1, $a0, $t0
    sh          $v0, 0x8($v1)
    lhu         $v0, 0xA($a2)
    sh          $v0, 0xA($v1)
    lhu         $v0, 0x8($a2)
    addu        $a0, $a0, $a3
    sh          $v0, 0x8($a0)
    lhu         $v0, 0xA($a2)
    addiu       $a1, $a1, 0x1
    lui         $at, 0x8008
    sw          $a1, 0x5A1C($at)
    slti        $a1, $a1, 0x14
    bnez        $a1, .L80014188
    sh          $v0, 0xA($a0)
    lui         $at, 0x8008
    lwc1        $f12, 0x7898($at)
    lui         $at, 0x8008
    lwc1        $f10, 0x789C($at)
    lui         $at, 0x8008
    lwc1        $f8, 0x78A0($at)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
.L8001444C:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $v1, $a0, 4
    addu        $v1, $v1, $t0
    lh          $v0, 0x0($v1)
    .word       0x44822000  # mtc1        $v0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    lh          $v0, 0x2($v1)
    addiu       $a0, $a0, 0x1
    .word       0x460C2100  # add.s       $f4, $f4, $f12
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    lh          $v0, 0x4($v1)
    .word       0x460A1080  # add.s       $f2, $f2, $f10
    slti        $a0, $a0, 0x14
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x4600218D  # trunc.w.s   $f6, $f4
    .word       0x44023000  # mfc1        $v0, $f6
    .word       0x46080000  # add.s       $f0, $f0, $f8
    sh          $v0, 0x0($v1)
    .word       0x4600110D  # trunc.w.s   $f4, $f2
    .word       0x44052000  # mfc1        $a1, $f4
    sh          $a1, 0x2($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44061000  # mfc1        $a2, $f2
    bnez        $a0, .L8001444C
    sh          $a2, 0x4($v1)
    lwc1        $f0, 0x38($sp)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46380002  # mul.d       $f0, $f0, $f24
    lwc1        $f4, 0x3C($sp)
    .word       0x46002107  # neg.s       $f4, $f4
    .word       0x46002121  # cvt.d.s     $f4, $f4
    .word       0x46382102  # mul.d       $f4, $f4, $f24
    lui         $at, 0x8008
    lwc1        $f8, 0x7898($at)
    lwc1        $f6, 0x40($sp)
    lui         $at, 0x8008
    lwc1        $f2, 0x789C($at)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    .word       0x46003187  # neg.s       $f6, $f6
    .word       0x46004221  # cvt.d.s     $f8, $f8
    .word       0x460031A1  # cvt.d.s     $f6, $f6
    .word       0x46383182  # mul.d       $f6, $f6, $f24
    .word       0x46204200  # add.d       $f8, $f8, $f0
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    lui         $at, 0x8008
    lwc1        $f0, 0x78A0($at)
    addiu       $v0, $v0, 0x1
    .word       0x46241080  # add.d       $f2, $f2, $f4
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46260000  # add.d       $f0, $f0, $f6
    .word       0x46204220  # cvt.s.d     $f8, $f8
    lui         $at, 0x8008
    swc1        $f8, 0x7898($at)
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    lui         $at, 0x8008
    swc1        $f2, 0x789C($at)
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $at, 0x8008
    swc1        $f0, 0x78A0($at)
    bnez        $v0, .L80013E40
    addiu       $a1, $zero, 0xFF
    lui         $a3, 0x8009
    lw          $a3, -0x63E0($a3)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $v0, $v0, 5
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $t0, -0x4DE8($at)
.L8001458C:
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v1, $v1, 4
    addu        $a0, $v1, $t0
    lhu         $v0, 0x0($a0)
    addu        $v1, $v1, $a3
    sh          $v0, 0x0($v1)
    lhu         $v0, 0x2($a0)
    sh          $v0, 0x2($v1)
    lhu         $v0, 0x4($a0)
    sh          $v0, 0x4($v1)
    lbu         $v0, 0xC($a0)
    sb          $v0, 0xC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v1, $v0, $t0
    lbu         $v1, 0xD($v1)
    addu        $v0, $v0, $a3
    sb          $v1, 0xD($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v1, $v0, $t0
    lbu         $v1, 0xE($v1)
    addu        $v0, $v0, $a3
    sb          $v1, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $a3
    sb          $a1, 0xF($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    slti        $v0, $v0, 0x14
    bnez        $v0, .L8001458C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $t1, 0x8009
    addiu       $t1, $t1, -0x63E0
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4DE8
    lui         $at, 0x8008
    sw          $zero, 0x5A34($at)
    sll         $v0, $v0, 5
    addu        $a2, $v0, $v1
.L80014654:
    lui         $v1, 0x8008
    lw          $v1, 0x5A34($v1)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t1
    lw          $a3, 0x0($v0)
    addu        $v1, $v1, $a2
    lw          $t0, 0x0($v1)
.L80014678:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $v1, $a0, 4
    addu        $a1, $v1, $t0
    lhu         $v0, 0x0($a1)
    addu        $v1, $v1, $a3
    sh          $v0, 0x0($v1)
    lhu         $v0, 0x2($a1)
    sh          $v0, 0x2($v1)
    lhu         $v0, 0x4($a1)
    addiu       $a0, $a0, 0x1
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    slti        $a0, $a0, 0x14
    bnez        $a0, .L80014678
    sh          $v0, 0x4($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L80014654
    addiu       $v1, $zero, 0x1
    lui         $t2, 0x8009
    addiu       $t2, $t2, -0x63E0
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    addiu       $t1, $zero, 0xA
    lui         $at, 0x8008
    sw          $v1, 0x5A34($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4DE8
    sll         $v0, $v0, 5
    addu        $a2, $v0, $v1
.L80014704:
    lui         $v1, 0x8008
    lw          $v1, 0x5A34($v1)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t2
    lw          $a3, 0x0($v0)
    addu        $v1, $v1, $a2
    lw          $t0, -0x4($v1)
.L80014728:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $v1, $a0, 4
    addu        $a1, $v1, $t0
    lhu         $v0, 0x50($a1)
    addu        $v1, $v1, $a3
    sh          $v0, 0x0($v1)
    lhu         $v0, 0x52($a1)
    sh          $v0, 0x2($v1)
    lhu         $v0, 0x54($a1)
    addiu       $a0, $a0, 0x1
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    slti        $a0, $a0, 0x5
    bnez        $a0, .L80014728
    sh          $v0, 0x4($v1)
    lui         $at, 0x8008
    sw          $t1, 0x5A1C($at)
.L80014770:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $v1, $a0, 4
    addu        $a1, $v1, $t0
    lhu         $v0, 0x50($a1)
    addu        $v1, $v1, $a3
    sh          $v0, 0x0($v1)
    lhu         $v0, 0x52($a1)
    sh          $v0, 0x2($v1)
    lhu         $v0, 0x54($a1)
    addiu       $a0, $a0, 0x1
    lui         $at, 0x8008
    sw          $a0, 0x5A1C($at)
    slti        $a0, $a0, 0xF
    bnez        $a0, .L80014770
    sh          $v0, 0x4($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L80014704
    nop
    lui         $v0, 0x8006
    lhu         $v0, 0x555A($v0)
    lui         $v1, 0x8006
    lhu         $v1, 0x555C($v1)
    lui         $a0, 0x8006
    lhu         $a0, 0x4A4E($a0)
    addu        $v0, $v0, $v1
    lui         $at, 0x8006
    sh          $v0, 0x555A($at)
    bnez        $a0, .L80014804
    nop
    lui         $at, 0x8006
    sh          $zero, 0x555A($at)
.L80014804:
    lui         $v0, 0x8006
    lh          $v0, 0x555A($v0)
    slti        $v0, $v0, 0x33
    bnez        $v0, .L8001482C
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    negu        $v0, $v0
    lui         $at, 0x8006
    sh          $v0, 0x555C($at)
.L8001482C:
    lui         $v0, 0x8006
    lh          $v0, 0x555A($v0)
    slti        $v0, $v0, -0x32
    beqz        $v0, .L80014850
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lui         $at, 0x8006
    sh          $v0, 0x555C($at)
.L80014850:
    lui         $at, 0x8000
    lwc1        $f14, 0x990($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4C($v1)
    addiu       $v0, $sp, 0x3C
    sw          $v0, 0x10($sp)
    addiu       $v0, $sp, 0x40
    sw          $v0, 0x14($sp)
    addiu       $v0, $sp, 0x44
    sw          $v0, 0x18($sp)
    addiu       $v0, $sp, 0x48
    sw          $v0, 0x1C($sp)
    addiu       $v0, $sp, 0x4C
    sw          $v0, 0x20($sp)
    addiu       $v0, $sp, 0x50
    sw          $v0, 0x24($sp)
    addiu       $v0, $sp, 0x54
    sw          $v0, 0x28($sp)
    addiu       $v0, $sp, 0x58
    sw          $v0, 0x2C($sp)
    lui         $v0, 0x8006
    lhu         $v0, 0x555A($v0)
    .word       0x44806000  # mtc1        $zero, $f12
    addiu       $a3, $sp, 0x38
    .word       0x44066000  # mfc1        $a2, $f12
    addiu       $v1, $v1, 0x7FF
    andi        $v1, $v1, 0xFFF
    addu        $v0, $v0, $v1
    andi        $v0, $v0, 0xFFFF
    jal         func_80013B8C
    sw          $v0, 0x30($sp)
    lui         $at, 0x8000
    lwc1        $f15, 0x994($at)
    lwc1        $f14, 0x998($at)
    lui         $t1, 0x8009
    addiu       $t1, $t1, -0x63E0
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x4DE8
    lui         $at, 0x8008
    sw          $zero, 0x5A34($at)
.L800148F0:
    lui         $a0, 0x8008
    lw          $a0, 0x5A34($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $t1
    lw          $a3, 0x0($v0)
    sll         $v1, $v1, 5
    addu        $v1, $v1, $a2
    addu        $a0, $a0, $v1
    lw          $t0, 0x0($a0)
.L80014924:
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    sll         $a0, $a0, 4
    addu        $v1, $a0, $a3
    lh          $v0, 0x0($v1)
    lwc1        $f6, 0x38($sp)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003002  # mul.s       $f0, $f6, $f0
    lh          $v0, 0x2($v1)
    lwc1        $f12, 0x3C($sp)
    .word       0x44822000  # mtc1        $v0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x46046102  # mul.s       $f4, $f12, $f4
    lh          $v0, 0x4($v1)
    lwc1        $f10, 0x40($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46025082  # mul.s       $f2, $f10, $f2
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46020000  # add.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462E0000  # add.d       $f0, $f0, $f14
    addu        $a0, $a0, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x0($a0)
    lh          $v0, 0x0($v1)
    lwc1        $f0, 0x44($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lh          $v0, 0x2($v1)
    lwc1        $f8, 0x48($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46024202  # mul.s       $f8, $f8, $f2
    lh          $v0, 0x4($v1)
    lwc1        $f4, 0x4C($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46080000  # add.s       $f0, $f0, $f8
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462E0000  # add.d       $f0, $f0, $f14
    lui         $at, 0x8000
    lwc1        $f3, 0x99C($at)
    lwc1        $f2, 0x9A0($at)
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x2($a0)
    lh          $v0, 0x0($v1)
    lwc1        $f0, 0x50($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lh          $v0, 0x2($v1)
    lwc1        $f8, 0x54($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46024202  # mul.s       $f8, $f8, $f2
    lh          $v0, 0x4($v1)
    lwc1        $f4, 0x58($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46080000  # add.s       $f0, $f0, $f8
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462E0000  # add.d       $f0, $f0, $f14
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x4($a0)
    lb          $v0, 0xC($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003182  # mul.s       $f6, $f6, $f0
    lb          $v0, 0xD($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46006302  # mul.s       $f12, $f12, $f0
    lb          $v0, 0xE($v1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46005282  # mul.s       $f10, $f10, $f0
    .word       0x460C3180  # add.s       $f6, $f6, $f12
    .word       0x460A3180  # add.s       $f6, $f6, $f10
    .word       0x460031A1  # cvt.d.s     $f6, $f6
    .word       0x462E3180  # add.d       $f6, $f6, $f14
    .word       0x4620300D  # trunc.w.d   $f0, $f6
    .word       0x44020000  # mfc1        $v0, $f0
    sb          $v0, 0xC($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v1, $v1, 4
    addu        $a0, $v1, $a3
    lb          $v0, 0xC($a0)
    lwc1        $f0, 0x44($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lb          $v0, 0xD($a0)
    lwc1        $f6, 0x48($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46023182  # mul.s       $f6, $f6, $f2
    lb          $v0, 0xE($a0)
    lwc1        $f4, 0x4C($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46060000  # add.s       $f0, $f0, $f6
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462E0000  # add.d       $f0, $f0, $f14
    addu        $v1, $v1, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0xD($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x5A1C($v1)
    sll         $v1, $v1, 4
    addu        $a0, $v1, $a3
    lb          $v0, 0xC($a0)
    lwc1        $f0, 0x50($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lb          $v0, 0xD($a0)
    lwc1        $f6, 0x54($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46023182  # mul.s       $f6, $f6, $f2
    lb          $v0, 0xE($a0)
    lwc1        $f4, 0x58($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46022102  # mul.s       $f4, $f4, $f2
    .word       0x46060000  # add.s       $f0, $f0, $f6
    .word       0x46040000  # add.s       $f0, $f0, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462E0000  # add.d       $f0, $f0, $f14
    addu        $v1, $v1, $t0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0xE($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    slti        $v0, $v0, 0x14
    bnez        $v0, .L80014924
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L800148F0
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4DE8
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    sll         $v1, $v1, 5
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $a3, -0x4DE8($at)
.L80014BDC:
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    sll         $v1, $v1, 5
    addu        $v1, $v1, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $t0, 0x0($v0)
.L80014C08:
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v1, $v0, $a3
    lbu         $v1, 0xC($v1)
    addu        $v0, $v0, $t0
    sb          $v1, 0xC($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v1, $v0, $a3
    lbu         $v1, 0xD($v1)
    addu        $v0, $v0, $t0
    sb          $v1, 0xD($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    sll         $v0, $v0, 4
    addu        $v1, $v0, $a3
    lbu         $v1, 0xE($v1)
    addu        $v0, $v0, $t0
    sb          $v1, 0xE($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5A1C($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    slti        $v0, $v0, 0x14
    bnez        $v0, .L80014C08
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L80014BDC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7918($v1)
    sll         $v0, $v0, 5
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x4DE8($at)
    lui         $at, 0x8009
    sw          $v1, -0x6A10($at)
    lui         $at, 0x8008
    sw          $v0, 0x57F8($at)
    addiu       $v0, $zero, -0x7F
    sb          $v0, 0xC($v1)
    lui         $a0, 0x8009
    lw          $a0, -0x6A10($a0)
    sh          $zero, 0x0($v1)
    sh          $zero, 0x4($v1)
    addiu       $v0, $zero, 0xBE
    sh          $v0, 0x2($v1)
    sb          $zero, 0xD($a0)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $zero, 0xE($v0)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    addiu       $a2, $zero, 0xFF
    sb          $a2, 0xF($v0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A10($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    sh          $zero, 0x8($a1)
    sh          $zero, 0xA($a1)
    lh          $v0, 0x20($a0)
    lh          $v1, 0x10($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f5, 0x9A4($at)
    lwc1        $f4, 0x9A8($at)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x10($a1)
    lh          $v0, 0x22($a0)
    lh          $v1, 0x12($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x12($a1)
    lh          $v0, 0x24($a0)
    lh          $v1, 0x14($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x14($a1)
    lb          $v0, 0x2C($a0)
    lb          $v1, 0x1C($a0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x1C($a1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lb          $v1, 0x2D($v0)
    lb          $v0, 0x1D($v0)
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x1D($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lb          $v1, 0x2E($v0)
    lb          $v0, 0x1E($v0)
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46020001  # sub.s       $f0, $f0, $f2
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x1E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x1F($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    sh          $zero, 0x18($v1)
    sh          $zero, 0x1A($v1)
    lhu         $v0, 0x20($a0)
    sh          $v0, 0x20($v1)
    lhu         $v0, 0x22($a0)
    sh          $v0, 0x22($v1)
    lhu         $v0, 0x24($a0)
    sh          $v0, 0x24($v1)
    lbu         $v0, 0x2C($a0)
    sb          $v0, 0x2C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lbu         $v0, 0x2D($v0)
    sb          $v0, 0x2D($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lbu         $v0, 0x2E($v0)
    sb          $v0, 0x2E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x2F($v0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A10($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sh          $zero, 0x28($a1)
    sh          $zero, 0x2A($a1)
    lh          $v0, 0x30($v1)
    lh          $a0, 0x20($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x30($a1)
    lh          $v0, 0x32($v1)
    lh          $a0, 0x22($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x32($a1)
    lh          $v0, 0x34($v1)
    lh          $a0, 0x24($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x34($a1)
    lb          $v0, 0x3C($v1)
    lb          $v1, 0x2C($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x3C($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0x3D($v1)
    lb          $v1, 0x2D($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x3D($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0x3E($v1)
    lb          $v1, 0x2E($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x3E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x3F($v0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A10($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sh          $zero, 0x38($a1)
    sh          $zero, 0x3A($a1)
    lh          $v0, 0xC0($v1)
    lh          $a0, 0xB0($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x40($a1)
    lh          $v0, 0xC2($v1)
    lh          $a0, 0xB2($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x42($a1)
    lh          $v0, 0xC4($v1)
    lh          $a0, 0xB4($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x44($a1)
    lb          $v0, 0xCC($v1)
    lb          $v1, 0xBC($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x4C($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0xCD($v1)
    lb          $v1, 0xBD($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x4D($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0xCE($v1)
    lb          $v1, 0xBE($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x4E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x4F($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x57F8($a0)
    sh          $zero, 0x48($v1)
    sh          $zero, 0x4A($v1)
    lhu         $v0, 0xC0($a0)
    sh          $v0, 0x50($v1)
    lhu         $v0, 0xC2($a0)
    sh          $v0, 0x52($v1)
    lhu         $v0, 0xC4($a0)
    sh          $v0, 0x54($v1)
    lbu         $v0, 0xCC($a0)
    sb          $v0, 0x5C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lbu         $v0, 0xCD($v0)
    sb          $v0, 0x5D($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x57F8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    lbu         $v0, 0xCE($v0)
    sb          $v0, 0x5E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x5F($v0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A10($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    sh          $zero, 0x58($a1)
    sh          $zero, 0x5A($a1)
    lh          $v0, 0xD0($v1)
    lh          $a0, 0xC0($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x60($a1)
    lh          $v0, 0xD2($v1)
    lh          $a0, 0xC2($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x62($a1)
    lh          $v0, 0xD4($v1)
    lh          $a0, 0xC4($v1)
    subu        $v0, $v0, $a0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x64($a1)
    lb          $v0, 0xDC($v1)
    lb          $v1, 0xCC($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x6C($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0xDD($v1)
    lb          $v1, 0xCD($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x6D($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x57F8($v1)
    lb          $v0, 0xDE($v1)
    lb          $v1, 0xCE($v1)
    subu        $v0, $v0, $v1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x44831000  # mtc1        $v1, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46220000  # add.d       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x6A10($v1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sb          $v0, 0x6E($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    sb          $a2, 0x6F($v0)
    lui         $v0, 0x8009
    lw          $v0, -0x6A10($v0)
    lui         $a0, 0x2
    ori         $a0, $a0, 0x205
    sh          $zero, 0x68($v0)
    jal         func_8000AFA8
    sh          $zero, 0x6A($v0)
    jal         func_8000DE34
    addiu       $a0, $zero, 0x9
    jal         func_8000E3C8
    lui         $s0, 0xE700
    jal         func_8000E20C
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C790
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
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
    addiu       $v0, $v1, 0x10
    sw          $a2, 0x0($v1)
    sw          $a1, 0x4($v1)
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s0, 0x8($v1)
    jal         func_8000A22C
    sw          $zero, 0xC($v1)
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A22C
    addiu       $a0, $zero, 0x80
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_80009E58
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lui         $a0, 0x44
    ori         $a0, $a0, 0x2078
    lui         $a1, 0x44
    jal         func_8000A63C
    ori         $a1, $a1, 0x2078
    jal         func_8000A404
    addu        $a0, $zero, $zero
    addiu       $a0, $zero, 0x3C0
    jal         func_8000AECC
    addiu       $a1, $zero, 0x3DE
    addiu       $a0, $zero, 0xFF
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0xFF
    jal         func_8000A08C
    addu        $a3, $zero, $zero
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lui         $a0, 0x8006
    lw          $a0, 0x5548($a0)
    jal         func_800093F4
    addiu       $s0, $zero, 0x2
    addiu       $a1, $zero, 0x2
    addiu       $a2, $zero, 0x1
    lui         $a0, 0x8006
    lw          $a0, 0x5544($a0)
    addiu       $a3, $zero, 0x40
    addiu       $v0, $zero, 0x20
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $s0, 0x18($sp)
    sw          $s0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    jal         func_800094D0
    sw          $zero, 0x2C($sp)
    lui         $t6, 0x8006
    lw          $t6, 0x5564($t6)
    lui         $a1, 0x400
    ori         $a1, $a1, 0x103F
    lui         $t0, 0xB100
    ori         $t0, $t0, 0x402
    lui         $a2, 0x2
    ori         $a2, $a2, 0x406
    lui         $t1, 0xFC60
    ori         $t1, $t1, 0xFEC1
    lui         $a3, 0x55FE
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    ori         $a3, $a3, 0x793C
    ori         $a0, $zero, 0x8000
    addiu       $v1, $v0, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x10
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x18
    sw          $a1, 0x0($v0)
    sw          $t6, 0x4($v0)
    sw          $t0, 0x8($v0)
    sw          $a2, 0xC($v0)
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    sw          $t1, 0x10($v0)
    jal         func_8000A940
    sw          $a3, 0x14($v0)
    lui         $a1, 0x8006
    lw          $a1, 0x5550($a1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2
    lui         $a0, 0x8006
    lw          $a0, 0x554C($a0)
    addiu       $a2, $zero, 0x10
    addiu       $a3, $zero, 0x20
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x5
    sw          $zero, 0x10($sp)
    sw          $s0, 0x14($sp)
    sw          $s0, 0x18($sp)
    sw          $v0, 0x20($sp)
    sw          $zero, 0x24($sp)
    jal         func_8000979C
    sw          $zero, 0x28($sp)
    lui         $t6, 0x8006
    lw          $t6, 0x5568($t6)
    lui         $a0, 0x400
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a0, $a0, 0x40FF
    lui         $t0, 0xB100
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a0, 0x0($v1)
    sw          $t6, 0x4($v1)
.L8001565C:
    lui         $a3, 0x8008
    lw          $a3, 0x4F5C($a3)
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    addiu       $v0, $a3, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a0, 1
    andi        $v0, $v0, 0xFF
    sll         $v0, $v0, 16
    addiu       $a1, $a0, 0x8
    sll         $a1, $a1, 9
    andi        $a1, $a1, 0xFE00
    or          $v0, $v0, $a1
    addiu       $a2, $a0, 0x1
    sll         $v1, $a2, 1
    andi        $v1, $v1, 0xFF
    or          $v0, $v0, $v1
    or          $v0, $v0, $t0
    sll         $v1, $v1, 16
    or          $v1, $v1, $a1
    addiu       $a0, $a0, 0x9
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v1, $v1, $a0
    lui         $at, 0x8008
    sw          $a2, 0x5A1C($at)
    slti        $a2, $a2, 0x7
    sw          $v0, 0x0($a3)
    bnez        $a2, .L8001565C
    sw          $v1, 0x4($a3)
    lui         $v1, 0xB10E
    ori         $v1, $v1, 0x1E00
    ori         $a0, $zero, 0x8000
    addiu       $v0, $a3, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x1E10
    sw          $v1, 0x8($a3)
    jal         func_8000A940
    sw          $v0, 0xC($a3)
    lui         $a1, 0x8006
    lw          $a1, 0x5550($a1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2
    lui         $a0, 0x8006
    lw          $a0, 0x554C($a0)
    addiu       $a2, $zero, 0x10
    addiu       $a3, $zero, 0x20
    addiu       $s0, $zero, 0x2
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x5
    sw          $zero, 0x10($sp)
    sw          $s0, 0x14($sp)
    sw          $s0, 0x18($sp)
    sw          $v0, 0x20($sp)
    sw          $zero, 0x24($sp)
    jal         func_8000979C
    sw          $zero, 0x28($sp)
    lui         $t6, 0x8008
    lw          $t6, 0x4FC0($t6)
    lui         $a1, 0x400
    ori         $a1, $a1, 0x185F
    lui         $a2, 0x8
    ori         $a2, $a2, 0x6
    lui         $a3, 0x8
    ori         $a3, $a3, 0x604
    lui         $t0, 0x8
    ori         $t0, $t0, 0x402
    lui         $t1, 0x8
    ori         $t1, $t1, 0x200
    lui         $t2, 0xA
    ori         $t2, $t2, 0x406
    lui         $t3, 0xA
    ori         $t3, $t3, 0x204
    lui         $t4, 0xA
    ori         $t4, $t4, 0x2
    lui         $t5, 0xA
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    ori         $t5, $t5, 0x600
    ori         $a0, $zero, 0x8000
    addiu       $v1, $v0, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x10
    sw          $a1, 0x0($v0)
    lui         $a1, 0xBF00
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x18
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x20
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x28
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x30
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x38
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x40
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x48
    sw          $t6, 0x4($v0)
    sw          $a1, 0x8($v0)
    sw          $a2, 0xC($v0)
    sw          $a1, 0x10($v0)
    sw          $a3, 0x14($v0)
    sw          $a1, 0x18($v0)
    sw          $t0, 0x1C($v0)
    sw          $a1, 0x20($v0)
    sw          $t1, 0x24($v0)
    sw          $a1, 0x28($v0)
    sw          $t2, 0x2C($v0)
    sw          $a1, 0x30($v0)
    sw          $t3, 0x34($v0)
    sw          $a1, 0x38($v0)
    sw          $t4, 0x3C($v0)
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    sw          $a1, 0x40($v0)
    jal         func_8000A940
    sw          $t5, 0x44($v0)
    lui         $a1, 0x8006
    lw          $a1, 0x5540($a1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2
    lui         $a0, 0x8006
    lw          $a0, 0x553C($a0)
    addiu       $a2, $zero, 0x40
    addiu       $a3, $zero, 0x40
    addiu       $v0, $zero, 0x6
    sw          $zero, 0x10($sp)
    sw          $s0, 0x14($sp)
    sw          $s0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $v0, 0x20($sp)
    sw          $zero, 0x24($sp)
    jal         func_8000979C
    sw          $zero, 0x28($sp)
    lui         $t2, 0x400
    ori         $t2, $t2, 0x513F
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    lui         $t0, 0xB100
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x4DE8
    sll         $v1, $v1, 5
    addu        $t1, $v1, $v0
.L800158E0:
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    lw          $t6, 0x0($v0)
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $t2, 0x0($v1)
    sw          $t6, 0x4($v1)
.L80015918:
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    lui         $a1, 0x8008
    lw          $a1, 0x5A1C($a1)
    addiu       $v0, $a2, 0x8
    sll         $a0, $a1, 1
    andi        $a0, $a0, 0xFF
    sll         $a0, $a0, 16
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a1, 0x5
    sll         $v0, $v0, 9
    andi        $v0, $v0, 0xFE00
    or          $v0, $a0, $v0
    addiu       $v1, $a1, 0x6
    sll         $v1, $v1, 1
    andi        $v1, $v1, 0xFF
    or          $v0, $v0, $v1
    or          $v0, $v0, $t0
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    addiu       $a1, $a1, 0x1
    sw          $v0, 0x0($a2)
    sll         $v0, $a1, 1
    andi        $v0, $v0, 0xFF
    or          $a0, $a0, $v0
    lui         $at, 0x8008
    sw          $a1, 0x5A1C($at)
    slti        $a1, $a1, 0x4
    bnez        $a1, .L80015918
    sw          $a0, 0x4($a2)
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
.L800159A0:
    lui         $a3, 0x8008
    lw          $a3, 0x4F5C($a3)
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    addiu       $v0, $a3, 0x8
    sll         $v1, $a0, 1
    andi        $v1, $v1, 0xFF
    sll         $v1, $v1, 16
    addiu       $a2, $a0, 0x1
    sll         $a1, $a2, 9
    andi        $a1, $a1, 0xFE00
    or          $v1, $v1, $a1
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a0, 0x5
    sll         $v0, $v0, 1
    andi        $v0, $v0, 0xFF
    or          $v1, $v1, $v0
    or          $v1, $v1, $t0
    sll         $v0, $v0, 16
    or          $v0, $v0, $a1
    addiu       $a0, $a0, 0x6
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v0, $v0, $a0
    lui         $at, 0x8008
    sw          $a2, 0x5A1C($at)
    slti        $a2, $a2, 0xE
    sw          $v1, 0x0($a3)
    bnez        $a2, .L800159A0
    sw          $v0, 0x4($a3)
    lui         $v0, 0x8008
    lw          $v0, 0x5A34($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5A34($at)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L800158E0
    nop
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lui         $a1, 0x8006
    lw          $a1, 0x5550($a1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2
    lui         $a0, 0x8006
    lw          $a0, 0x554C($a0)
    addiu       $a2, $zero, 0x10
    addiu       $a3, $zero, 0x20
    addiu       $v0, $zero, 0x6
    sw          $zero, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $zero, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $v0, 0x20($sp)
    sw          $zero, 0x24($sp)
    jal         func_8000979C
    sw          $zero, 0x28($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $a0, 0x400
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    sll         $v0, $v0, 5
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $t6, -0x4DE8($at)
    ori         $a0, $a0, 0x513F
    lui         $a3, 0xB100
    lui         $at, 0x8008
    sw          $zero, 0x5A1C($at)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a0, 0x0($v1)
    sw          $t6, 0x4($v1)
.L80015AD4:
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    lui         $a1, 0x8008
    lw          $a1, 0x5A1C($a1)
    addiu       $v0, $a2, 0x8
    sll         $a0, $a1, 1
    andi        $a0, $a0, 0xFF
    sll         $a0, $a0, 16
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a1, 0x5
    sll         $v0, $v0, 9
    andi        $v0, $v0, 0xFE00
    or          $v0, $a0, $v0
    addiu       $v1, $a1, 0x6
    sll         $v1, $v1, 1
    andi        $v1, $v1, 0xFF
    or          $v0, $v0, $v1
    or          $v0, $v0, $a3
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    addiu       $a1, $a1, 0x1
    sw          $v0, 0x0($a2)
    sll         $v0, $a1, 1
    andi        $v0, $v0, 0xFF
    or          $a0, $a0, $v0
    lui         $at, 0x8008
    sw          $a1, 0x5A1C($at)
    slti        $a1, $a1, 0x4
    bnez        $a1, .L80015AD4
    sw          $a0, 0x4($a2)
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8008
    sw          $v0, 0x5A1C($at)
    lui         $t0, 0xB100
.L80015B60:
    lui         $a3, 0x8008
    lw          $a3, 0x4F5C($a3)
    lui         $a0, 0x8008
    lw          $a0, 0x5A1C($a0)
    addiu       $v0, $a3, 0x8
    sll         $v1, $a0, 1
    andi        $v1, $v1, 0xFF
    sll         $v1, $v1, 16
    addiu       $a2, $a0, 0x1
    sll         $a1, $a2, 9
    andi        $a1, $a1, 0xFE00
    or          $v1, $v1, $a1
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a0, 0x5
    sll         $v0, $v0, 1
    andi        $v0, $v0, 0xFF
    or          $v1, $v1, $v0
    or          $v1, $v1, $t0
    sll         $v0, $v0, 16
    or          $v0, $v0, $a1
    addiu       $a0, $a0, 0x6
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v0, $v0, $a0
    lui         $at, 0x8008
    sw          $a2, 0x5A1C($at)
    slti        $a2, $a2, 0xE
    sw          $v1, 0x0($a3)
    bnez        $a2, .L80015B60
    sw          $v0, 0x4($a3)
    lui         $t6, 0x8008
    lw          $t6, 0x7918($t6)
    lui         $v1, 0x400
    ori         $v1, $v1, 0x1C6F
    lui         $a0, 0xB100
    ori         $a0, $a0, 0x204
    lui         $a1, 0xB100
    ori         $a1, $a1, 0xA08
    addiu       $v0, $a3, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a3, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x406
    sw          $v0, 0x14($a3)
    addiu       $v0, $a3, 0x20
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0xC0A
    sw          $v1, 0x8($a3)
    sw          $a0, 0x10($a3)
    sw          $a1, 0x18($a3)
    sw          $v0, 0x1C($a3)
    sw          $t6, 0xC($a3)
    lw          $ra, 0x6C($sp)
    lw          $s2, 0x68($sp)
    lw          $s1, 0x64($sp)
    lw          $s0, 0x60($sp)
    lwc1        $f27, 0x88($sp)
    lwc1        $f26, 0x8C($sp)
    lwc1        $f25, 0x80($sp)
    lwc1        $f24, 0x84($sp)
    lwc1        $f23, 0x78($sp)
    lwc1        $f22, 0x7C($sp)
    lwc1        $f21, 0x70($sp)
    lwc1        $f20, 0x74($sp)
    addiu       $sp, $sp, 0x90
    jr          $ra
    nop
.end render_world_pipeline

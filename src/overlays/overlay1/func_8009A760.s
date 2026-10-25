.text
.align 2
.set noreorder
.globl func_8009A760
.ent func_8009A760
func_8009A760:
    addiu       $sp, $sp, -0x90
    addu        $a2, $a0, $zero
    sw          $ra, 0x5C($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    swc1        $f31, 0x88($sp)
    swc1        $f30, 0x8C($sp)
    swc1        $f29, 0x80($sp)
    swc1        $f28, 0x84($sp)
    swc1        $f27, 0x78($sp)
    swc1        $f26, 0x7C($sp)
    swc1        $f25, 0x70($sp)
    swc1        $f24, 0x74($sp)
    swc1        $f23, 0x68($sp)
    swc1        $f22, 0x6C($sp)
    swc1        $f21, 0x60($sp)
    swc1        $f20, 0x64($sp)
    lw          $s2, 0x8($a2)
    lw          $v0, 0x70($s2)
    beqz        $v0, .L8009A7C8
    nop
    lw          $v0, 0x18($v0)
    sw          $v0, 0x18($a2)
.L8009A7C8:
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    lh          $v0, 0x12($s2)
    lhu         $v1, 0x14($a0)
    subu        $a1, $v1, $v0
    addiu       $a1, $a1, 0x100
    lhu         $v0, 0x206($a0)
    srl         $a1, $a1, 9
    andi        $v0, $v0, 0x100
    beqz        $v0, .L8009A828
    negu        $a1, $a1
    lui         $at, 0x8000
    lwc1        $f5, 0x720($at)
    lwc1        $f4, 0x724($at)
    lwc1        $f2, 0x1C($a2)
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    lwc1        $f0, 0x20($a2)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    j           func_80096138
    addiu       $a1, $a1, -0x4
.L8009A828:
    lui         $at, 0x8000
    lwc1        $f5, 0x728($at)
    lwc1        $f4, 0x72C($at)
    lwc1        $f2, 0x1C($a2)
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    lwc1        $f0, 0x20($a2)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x46201087  # neg.d       $f2, $f2
    .word       0x46200007  # neg.d       $f0, $f0
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x44141000  # mfc1        $s4, $f2
    .word       0x44130000  # mfc1        $s3, $f0
    lw          $v0, 0x18($a2)
    andi        $a1, $a1, 0x7
    lui         $a0, 0xFFFF
    lw          $v1, 0x1C($s2)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $a1, 0x0($v0)
    lhu         $v0, 0x60($s2)
    ori         $a0, $a0, 0x3FFF
    and         $v1, $a1, $a0
    and         $v0, $v0, $a0
    beq         $v1, $v0, .L8009A8CC
    addu        $a0, $a2, $zero
    lhu         $v0, 0x48($s2)
    sh          $a1, 0x60($s2)
    xori        $v0, $v0, 0x1
    sh          $v0, 0x48($s2)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $v0, 0x4C($v0)
    jal         func_800954E0
    sw          $v0, 0x54($s2)
.L8009A8CC:
    lui         $at, 0x8000
    lwc1        $f3, 0x730($at)
    lwc1        $f2, 0x734($at)
    lwc1        $f0, 0x28($s2)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f3, 0x738($at)
    lwc1        $f2, 0x73C($at)
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    lhu         $v0, 0x68($s2)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8009A924
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lh          $v0, 0x14($v0)
    j           func_80096204
    negu        $s1, $v0
.L8009A924:
    lh          $s1, 0x12($s2)
    lhu         $v1, 0x5C($s2)
    lh          $v0, 0x24($s2)
    addu        $v0, $v1, $v0
    .word       0x4482D000  # mtc1        $v0, $f26
    .word       0x4680D6A0  # cvt.s.w     $f26, $f26
    .word       0x4483C000  # mtc1        $v1, $f24
    .word       0x4680C620  # cvt.s.w     $f24, $f24
    lhu         $v1, 0x5E($s2)
    lh          $v0, 0x26($s2)
    .word       0x461AC601  # sub.s       $f24, $f24, $f26
    .word       0x4600D682  # mul.s       $f26, $f26, $f0
    addu        $v0, $v1, $v0
    .word       0x4482E000  # mtc1        $v0, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x4483B000  # mtc1        $v1, $f22
    .word       0x4680B5A0  # cvt.s.w     $f22, $f22
    .word       0x461CB581  # sub.s       $f22, $f22, $f28
    .word       0x4600E702  # mul.s       $f28, $f28, $f0
    nop
    .word       0x4600C602  # mul.s       $f24, $f24, $f0
    nop
    .word       0x4600B582  # mul.s       $f22, $f22, $f0
    jal         func_8002E848
    addu        $a0, $s1, $zero
    lui         $at, 0x8000
    lwc1        $f21, 0x740($at)
    lwc1        $f20, 0x744($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    addu        $a0, $s1, $zero
    jal         func_8002E828
    .word       0x462007A0  # cvt.s.d     $f30, $f0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    .word       0x46200320  # cvt.s.d     $f12, $f0
    .word       0x46186282  # mul.s       $f10, $f12, $f24
    nop
    .word       0x461A6302  # mul.s       $f12, $f12, $f26
    addiu       $s1, $s1, 0x400
    .word       0x44106000  # mfc1        $s0, $f12
    addu        $a0, $s1, $zero
    jal         func_8002E848
    swc1        $f10, 0x34($sp)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    nop
    .word       0x4618F602  # mul.s       $f24, $f30, $f24
    nop
    .word       0x461AF682  # mul.s       $f26, $f30, $f26
    addu        $a0, $s1, $zero
    jal         func_8002E828
    .word       0x462007A0  # cvt.s.d     $f30, $f0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    lwc1        $f10, 0x34($sp)
    .word       0x46200320  # cvt.s.d     $f12, $f0
    .word       0x46166182  # mul.s       $f6, $f12, $f22
    .word       0x44947000  # mtc1        $s4, $f14
    .word       0x460A7381  # sub.s       $f14, $f14, $f10
    .word       0x46067201  # sub.s       $f8, $f14, $f6
    swc1        $f14, 0x3C($sp)
    .word       0x44937000  # mtc1        $s3, $f14
    .word       0x44945000  # mtc1        $s4, $f10
    .word       0x46187081  # sub.s       $f2, $f14, $f24
    .word       0x4616F582  # mul.s       $f22, $f30, $f22
    .word       0x44907000  # mtc1        $s0, $f14
    .word       0x460E5280  # add.s       $f10, $f10, $f14
    .word       0x46161081  # sub.s       $f2, $f2, $f22
    .word       0x461CF002  # mul.s       $f0, $f30, $f28
    .word       0x46065181  # sub.s       $f6, $f10, $f6
    .word       0x44105000  # mfc1        $s0, $f10
    .word       0x44935000  # mtc1        $s3, $f10
    .word       0x461A5100  # add.s       $f4, $f10, $f26
    .word       0x461C6702  # mul.s       $f28, $f12, $f28
    lui         $a3, 0x8008
    lw          $a3, 0x4F5C($a3)
    .word       0x46005000  # add.s       $f0, $f10, $f0
    .word       0x4600138D  # trunc.w.s   $f14, $f2
    .word       0x44037000  # mfc1        $v1, $f14
    .word       0x44907000  # mtc1        $s0, $f14
    addiu       $v0, $a3, 0x8
    .word       0x461C7380  # add.s       $f14, $f14, $f28
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    .word       0x46162101  # sub.s       $f4, $f4, $f22
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $s1, 0x7C($v0)
    .word       0x46180601  # sub.s       $f24, $f0, $f24
    sh          $v1, 0x2($s1)
    .word       0x461A0000  # add.s       $f0, $f0, $f26
    .word       0x4600208D  # trunc.w.s   $f2, $f4
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x12($s1)
    lwc1        $f10, 0x3C($sp)
    addu        $a0, $zero, $zero
    .word       0x461C5280  # add.s       $f10, $f10, $f28
    .word       0x44107000  # mfc1        $s0, $f14
    .word       0x4600C08D  # trunc.w.s   $f2, $f24
    .word       0x44031000  # mfc1        $v1, $f2
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    swc1        $f10, 0x44($sp)
    sh          $v1, 0x22($s1)
    sh          $v0, 0x32($s1)
    .word       0x4600400D  # trunc.w.s   $f0, $f8
    .word       0x44020000  # mfc1        $v0, $f0
    .word       0x4600300D  # trunc.w.s   $f0, $f6
    .word       0x44030000  # mfc1        $v1, $f0
    .word       0x4600500D  # trunc.w.s   $f0, $f10
    .word       0x44050000  # mfc1        $a1, $f0
    .word       0x4600700D  # trunc.w.s   $f0, $f14
    .word       0x44060000  # mfc1        $a2, $f0
    sh          $v0, 0x0($s1)
    lui         $v0, 0xE700
    sh          $v1, 0x10($s1)
    sh          $a1, 0x20($s1)
    sh          $a2, 0x30($s1)
    sw          $v0, 0x0($a3)
    jal         func_80009E14
    sw          $zero, 0x4($a3)
    jal         func_8000A3C0
    addu        $a0, $zero, $zero
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A22C
    addiu       $a0, $zero, 0xC0
    jal         func_80009E9C
    addiu       $a0, $zero, 0x30
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000A13C
    addiu       $a3, $zero, 0x80
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3205
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lhu         $v0, 0x58($s2)
    beqz        $v0, .L8009AC30
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x7BAC($v0)
    lw          $a1, 0x64($s2)
    beq         $v0, $a1, .L8009ABE4
    nop
    jal         func_80009310
    addu        $a0, $zero, $zero
    lw          $v0, 0x64($s2)
    lui         $at, 0x8008
    sw          $v0, -0x7BAC($at)
.L8009ABE4:
    lui         $v1, 0x8008
    lw          $v1, -0x7BB0($v1)
    lw          $v0, 0x54($s2)
    beq         $v1, $v0, .L8009ACB0
    addiu       $v0, $zero, 0x2
    lhu         $a2, 0x5C($s2)
    lhu         $a3, 0x5E($s2)
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    lw          $a0, 0x54($s2)
    jal         func_8000979C
    addiu       $a1, $zero, 0x2
    j           func_80096580
    nop
.L8009AC30:
    lui         $v0, 0x8008
    lw          $v0, -0x7BAC($v0)
    lw          $a0, 0x64($s2)
    beq         $v0, $a0, .L8009AC58
    nop
    jal         func_800093F4
    nop
    lw          $v0, 0x64($s2)
    lui         $at, 0x8008
    sw          $v0, -0x7BAC($at)
.L8009AC58:
    lui         $v1, 0x8008
    lw          $v1, -0x7BB0($v1)
    lw          $v0, 0x54($s2)
    beq         $v1, $v0, .L8009ACB0
    addiu       $v0, $zero, 0x2
    lhu         $a3, 0x5A($s2)
    lhu         $v1, 0x5E($s2)
    sw          $zero, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    sw          $v1, 0x10($sp)
    lw          $a0, 0x54($s2)
    addiu       $a1, $zero, 0x2
    jal         func_800094D0
    addiu       $a2, $zero, 0x1
    lw          $v0, 0x54($s2)
    lui         $at, 0x8008
    sw          $v0, -0x7BB0($at)
.L8009ACB0:
    lhu         $v0, 0x68($s2)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L8009ACC4
    ori         $a0, $zero, 0xC000
    ori         $a0, $zero, 0x8000
.L8009ACC4:
    jal         func_8000A940
    nop
    lhu         $v1, 0x68($s2)
    andi        $v0, $v1, 0x4
    beqz        $v0, . + 4 + (0x24 << 2)
    andi        $v0, $v1, 0x10
    beqz        $v0, . + 4 + (0xE << 2)
    addu        $a1, $zero, $zero
    addu        $a0, $zero, $zero
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x80
    sw          $zero, 0x10($sp)
    jal         func_80009EE0
    sw          $v0, 0x14($sp)
    lui         $a1, 0xFC11
    ori         $a1, $a1, 0x9623
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    j           func_80096610
    lui         $a0, 0xFF2F
.end func_8009A760

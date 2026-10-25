.text
.align 2
.set noreorder
.globl render_pipeline_update
.ent render_pipeline_update
render_pipeline_update:
    addiu       $sp, $sp, -0x60
    sw          $s0, 0x10($sp)
    lhu         $s0, 0x92($sp)
    sw          $s1, 0x14($sp)
    lw          $s1, 0x70($sp)
    sw          $s2, 0x18($sp)
    lw          $s2, 0x74($sp)
    sw          $s3, 0x1C($sp)
    lw          $s3, 0x78($sp)
    sw          $s5, 0x24($sp)
    lw          $s5, 0x7C($sp)
    sw          $s6, 0x28($sp)
    lw          $s6, 0x80($sp)
    sw          $s7, 0x2C($sp)
    lw          $s7, 0x84($sp)
    sw          $fp, 0x30($sp)
    lw          $fp, 0x88($sp)
    swc1        $f23, 0x40($sp)
    swc1        $f22, 0x44($sp)
    .word       0x4486B000  # mtc1        $a2, $f22
    swc1        $f27, 0x50($sp)
    swc1        $f26, 0x54($sp)
    .word       0x46006686  # mov.s       $f26, $f12
    swc1        $f25, 0x48($sp)
    swc1        $f24, 0x4C($sp)
    .word       0x46007606  # mov.s       $f24, $f14
    sw          $s4, 0x20($sp)
    addu        $s4, $a3, $zero
    sw          $ra, 0x34($sp)
    swc1        $f29, 0x58($sp)
    swc1        $f28, 0x5C($sp)
    swc1        $f21, 0x38($sp)
    swc1        $f20, 0x3C($sp)
    jal         func_8002E828
    addu        $a0, $s0, $zero
    lui         $at, 0x8006
    lwc1        $f0, 0x5560($at)
    .word       0x4482A000  # mtc1        $v0, $f20
    .word       0x4680A520  # cvt.s.w     $f20, $f20
    .word       0x4600A502  # mul.s       $f20, $f20, $f0
    jal         func_8002E848
    addu        $a0, $s0, $zero
    .word       0x461AD082  # mul.s       $f2, $f26, $f26
    lui         $at, 0x8000
    lwc1        $f9, 0x91C($at)
    lwc1        $f8, 0x920($at)
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46224181  # sub.d       $f6, $f8, $f2
    .word       0x4600A521  # cvt.d.s     $f20, $f20
    .word       0x4626A182  # mul.d       $f6, $f20, $f6
    nop
    .word       0x4618C102  # mul.s       $f4, $f24, $f24
    nop
    .word       0x4618D382  # mul.s       $f14, $f26, $f24
    nop
    .word       0x461AB402  # mul.s       $f16, $f22, $f26
    lui         $at, 0x8006
    lwc1        $f0, 0x5560($at)
    .word       0x44826000  # mtc1        $v0, $f12
    .word       0x46806320  # cvt.s.w     $f12, $f12
    .word       0x46006302  # mul.s       $f12, $f12, $f0
    nop
    .word       0x460CB482  # mul.s       $f18, $f22, $f12
    nop
    .word       0x460CC702  # mul.s       $f28, $f24, $f12
    nop
    .word       0x4616C602  # mul.s       $f24, $f24, $f22
    nop
    .word       0x4616B582  # mul.s       $f22, $f22, $f22
    .word       0x46344001  # sub.d       $f0, $f8, $f20
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x46007382  # mul.s       $f14, $f14, $f0
    .word       0x46002121  # cvt.d.s     $f4, $f4
    .word       0x46244281  # sub.d       $f10, $f8, $f4
    .word       0x46008402  # mul.s       $f16, $f16, $f0
    .word       0x4600B5A1  # cvt.d.s     $f22, $f22
    .word       0x46364201  # sub.d       $f8, $f8, $f22
    .word       0x4600C602  # mul.s       $f24, $f24, $f0
    .word       0x46127001  # sub.s       $f0, $f14, $f18
    .word       0x46127380  # add.s       $f14, $f14, $f18
    .word       0x462AA282  # mul.d       $f10, $f20, $f10
    .word       0x46261080  # add.d       $f2, $f2, $f6
    .word       0x461C8180  # add.s       $f6, $f16, $f28
    .word       0x460CD682  # mul.s       $f26, $f26, $f12
    .word       0x462A2100  # add.d       $f4, $f4, $f10
    .word       0x461C8401  # sub.s       $f16, $f16, $f28
    .word       0x4628A502  # mul.d       $f20, $f20, $f8
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    .word       0x46202120  # cvt.s.d     $f4, $f4
    swc1        $f2, 0x0($s4)
    .word       0x461AC281  # sub.s       $f10, $f24, $f26
    swc1        $f0, 0x0($s1)
    swc1        $f6, 0x0($s2)
    swc1        $f14, 0x0($s3)
    .word       0x461AC600  # add.s       $f24, $f24, $f26
    swc1        $f4, 0x0($s5)
    swc1        $f10, 0x0($s6)
    swc1        $f16, 0x0($s7)
    .word       0x4634B580  # add.d       $f22, $f22, $f20
    swc1        $f24, 0x0($fp)
    lw          $v1, 0x8C($sp)
    .word       0x4620B5A0  # cvt.s.d     $f22, $f22
    swc1        $f22, 0x0($v1)
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    lwc1        $f29, 0x58($sp)
    lwc1        $f28, 0x5C($sp)
    lwc1        $f27, 0x50($sp)
    lwc1        $f26, 0x54($sp)
    lwc1        $f25, 0x48($sp)
    lwc1        $f24, 0x4C($sp)
    lwc1        $f23, 0x40($sp)
    lwc1        $f22, 0x44($sp)
    lwc1        $f21, 0x38($sp)
    lwc1        $f20, 0x3C($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end render_pipeline_update

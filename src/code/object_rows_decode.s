.text
.align 2
.set noreorder
.globl object_rows_decode
.ent object_rows_decode
object_rows_decode:
    addiu       $sp, $sp, -0x140
    sw          $s2, 0x108($sp)
    lw          $s2, 0x150($sp)
    sw          $s1, 0x104($sp)
    addu        $s1, $a3, $zero
    sw          $s0, 0x100($sp)
    swc1        $f31, 0x138($sp)
    swc1        $f30, 0x13C($sp)
    swc1        $f29, 0x130($sp)
    swc1        $f28, 0x134($sp)
    swc1        $f27, 0x128($sp)
    swc1        $f26, 0x12C($sp)
    swc1        $f25, 0x120($sp)
    swc1        $f24, 0x124($sp)
    swc1        $f23, 0x118($sp)
    swc1        $f22, 0x11C($sp)
    swc1        $f21, 0x110($sp)
    swc1        $f20, 0x114($sp)
    lw          $t7, 0x50($a1)
    addu        $t6, $sp, $zero
    addiu       $a3, $zero, 0x8
    lui         $s0, 0x3FB5
    ori         $s0, $s0, 0x4F3
    lw          $v0, 0x140($a0)
    addiu       $a0, $sp, 0x60
    addiu       $t0, $a2, 0x70
    addiu       $t8, $v0, 0x80
    addiu       $a1, $t7, 0xE0
.L8005D9C0:
    lhu         $v1, -0x60($t0)
    lhu         $t1, -0x50($t0)
    lhu         $t4, -0x40($t0)
    lhu         $t2, -0x30($t0)
    lhu         $t5, -0x20($t0)
    lhu         $t3, -0x10($t0)
    lhu         $t9, 0x0($t0)
    or          $v0, $v1, $t1
    or          $v0, $t4, $v0
    or          $v0, $t2, $v0
    or          $v0, $t5, $v0
    or          $v0, $t3, $v0
    or          $v0, $t9, $v0
    bnez        $v0, .L8005DA48
    addiu       $t0, $t0, 0x2
    lh          $v0, 0x0($a2)
    lwc1        $f2, 0x0($t7)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    addiu       $a2, $a2, 0x2
    addiu       $a1, $a1, 0x4
    addiu       $t7, $t7, 0x4
    swc1        $f0, 0x0($t6)
    swc1        $f0, -0x40($a0)
    swc1        $f0, -0x20($a0)
    swc1        $f0, 0x0($a0)
    swc1        $f0, 0x20($a0)
    swc1        $f0, 0x40($a0)
    swc1        $f0, 0x60($a0)
    swc1        $f0, 0x80($a0)
    addiu       $a0, $a0, 0x4
    j .L8005DBE8
    addiu       $t6, $t6, 0x4
.L8005DA48:
    lh          $v0, 0x0($a2)
    lwc1        $f2, 0x0($t7)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020182  # mul.s       $f6, $f0, $f2
    sll         $v0, $t1, 16
    lwc1        $f2, -0xA0($a1)
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020582  # mul.s       $f22, $f0, $f2
    sll         $v0, $t2, 16
    lwc1        $f2, -0x60($a1)
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020502  # mul.s       $f20, $f0, $f2
    sll         $v0, $t3, 16
    lwc1        $f2, -0x20($a1)
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020702  # mul.s       $f28, $f0, $f2
    sll         $v0, $t4, 16
    lwc1        $f2, -0x80($a1)
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020102  # mul.s       $f4, $f0, $f2
    sll         $v0, $t5, 16
    lwc1        $f2, -0x40($a1)
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020302  # mul.s       $f12, $f0, $f2
    sll         $v0, $v1, 16
    .word       0x46143280  # add.s       $f10, $f6, $f20
    sra         $v0, $v0, 16
    lwc1        $f2, -0xC0($a1)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46143401  # sub.s       $f16, $f6, $f20
    .word       0x46020382  # mul.s       $f14, $f0, $f2
    sll         $v0, $t9, 16
    lwc1        $f2, 0x0($a1)
    .word       0x461CB480  # add.s       $f18, $f22, $f28
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020202  # mul.s       $f8, $f0, $f2
    .word       0x461CB081  # sub.s       $f2, $f22, $f28
    .word       0x46125180  # add.s       $f6, $f10, $f18
    .word       0x46125701  # sub.s       $f28, $f10, $f18
    .word       0x46046680  # add.s       $f26, $f12, $f4
    .word       0x46046301  # sub.s       $f12, $f12, $f4
    .word       0x46087600  # add.s       $f24, $f14, $f8
    .word       0x46087781  # sub.s       $f30, $f14, $f8
    .word       0x440CC000  # mfc1        $t4, $f24
    .word       0x4490C000  # mtc1        $s0, $f24
    .word       0x46181082  # mul.s       $f2, $f2, $f24
    .word       0x461E6100  # add.s       $f4, $f12, $f30
    .word       0x448CC000  # mtc1        $t4, $f24
    lui         $at, 0x8000
    lwc1        $f0, 0x33F0($at)
    .word       0x461AC200  # add.s       $f8, $f24, $f26
    .word       0x46002382  # mul.s       $f14, $f4, $f0
    .word       0x46121101  # sub.s       $f4, $f2, $f18
    lui         $at, 0x8000
    lwc1        $f0, 0x33F4($at)
    .word       0x46048580  # add.s       $f22, $f16, $f4
    .word       0x46006002  # mul.s       $f0, $f12, $f0
    .word       0x46048501  # sub.s       $f20, $f16, $f4
    .word       0x460E0100  # add.s       $f4, $f0, $f14
    lui         $at, 0x8000
    lwc1        $f2, 0x33F8($at)
    .word       0x46083000  # add.s       $f0, $f6, $f8
    .word       0x4602F082  # mul.s       $f2, $f30, $f2
    .word       0x46083181  # sub.s       $f6, $f6, $f8
    .word       0x460E1281  # sub.s       $f10, $f2, $f14
    .word       0x461AC081  # sub.s       $f2, $f24, $f26
    .word       0x4490C000  # mtc1        $s0, $f24
    .word       0x46082301  # sub.s       $f12, $f4, $f8
    .word       0x46181402  # mul.s       $f16, $f2, $f24
    .word       0x460CB200  # add.s       $f8, $f22, $f12
    .word       0x460C8101  # sub.s       $f4, $f16, $f12
    .word       0x46045380  # add.s       $f14, $f10, $f4
    .word       0x460CB281  # sub.s       $f10, $f22, $f12
    .word       0x4604A300  # add.s       $f12, $f20, $f4
    addiu       $a2, $a2, 0x2
    addiu       $t7, $t7, 0x4
    .word       0x4604A101  # sub.s       $f4, $f20, $f4
    addiu       $a1, $a1, 0x4
    swc1        $f0, 0x0($t6)
    addiu       $t6, $t6, 0x4
    .word       0x460EE080  # add.s       $f2, $f28, $f14
    swc1        $f6, 0x80($a0)
    swc1        $f8, -0x40($a0)
    swc1        $f10, 0x60($a0)
    .word       0x460EE001  # sub.s       $f0, $f28, $f14
    swc1        $f12, -0x20($a0)
    swc1        $f4, 0x40($a0)
    swc1        $f2, 0x20($a0)
    swc1        $f0, 0x0($a0)
    addiu       $a0, $a0, 0x4
.L8005DBE8:
    addiu       $a3, $a3, -0x1
    bgtz        $a3, .L8005D9C0
    nop
    addu        $t6, $sp, $zero
    addu        $a3, $zero, $zero
    lui         $t0, 0x3FB5
    ori         $t0, $t0, 0x4F3
    lui         $t3, 0x3FEC
    ori         $t3, $t3, 0x835E
    lui         $t2, 0x3F8A
    ori         $t2, $t2, 0x8BD4
    lui         $t1, 0xC027
    ori         $t1, $t1, 0x3D75
    addu        $a2, $s1, $zero
    addiu       $a1, $sp, 0x1C
.L8005DC24:
    lwc1        $f2, 0x0($t6)
    lwc1        $f0, -0xC($a1)
    .word       0x46001280  # add.s       $f10, $f2, $f0
    lwc1        $f4, -0x14($a1)
    .word       0x46001401  # sub.s       $f16, $f2, $f0
    lwc1        $f6, -0x4($a1)
    .word       0x46062480  # add.s       $f18, $f4, $f6
    lwc1        $f2, -0x8($a1)
    .word       0x46062101  # sub.s       $f4, $f4, $f6
    lwc1        $f0, -0x10($a1)
    .word       0x46001680  # add.s       $f26, $f2, $f0
    .word       0x46001301  # sub.s       $f12, $f2, $f0
    lwc1        $f2, -0x18($a1)
    .word       0x46125180  # add.s       $f6, $f10, $f18
    lwc1        $f0, 0x0($a1)
    .word       0x46001600  # add.s       $f24, $f2, $f0
    .word       0x46001781  # sub.s       $f30, $f2, $f0
    .word       0x440CC000  # mfc1        $t4, $f24
    .word       0x4488C000  # mtc1        $t0, $f24
    .word       0x461E6000  # add.s       $f0, $f12, $f30
    .word       0x46182102  # mul.s       $f4, $f4, $f24
    .word       0x448CC000  # mtc1        $t4, $f24
    .word       0x461AC200  # add.s       $f8, $f24, $f26
    .word       0x448BC000  # mtc1        $t3, $f24
    .word       0x46180382  # mul.s       $f14, $f0, $f24
    .word       0x46122101  # sub.s       $f4, $f4, $f18
    .word       0x4489C000  # mtc1        $t1, $f24
    .word       0x46048580  # add.s       $f22, $f16, $f4
    .word       0x46186002  # mul.s       $f0, $f12, $f24
    .word       0x46048501  # sub.s       $f20, $f16, $f4
    .word       0x460E0100  # add.s       $f4, $f0, $f14
    .word       0x46083000  # add.s       $f0, $f6, $f8
    lw          $v1, 0x0($a2)
    .word       0x448CC000  # mtc1        $t4, $f24
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    .word       0x46083001  # sub.s       $f0, $f6, $f8
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    .word       0x461AC081  # sub.s       $f2, $f24, $f26
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $s2
    .word       0x4488C000  # mtc1        $t0, $f24
    .word       0x46082301  # sub.s       $f12, $f4, $f8
    sb          $v0, 0x0($v1)
    .word       0x4600010D  # trunc.w.s   $f4, $f0
    .word       0x44022000  # mfc1        $v0, $f4
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    .word       0x460CB000  # add.s       $f0, $f22, $f12
    .word       0x46181402  # mul.s       $f16, $f2, $f24
    sb          $v0, 0x7($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    .word       0x460CB001  # sub.s       $f0, $f22, $f12
    lbu         $v0, 0x0($v0)
    .word       0x448AC000  # mtc1        $t2, $f24
    .word       0x46125701  # sub.s       $f28, $f10, $f18
    sb          $v0, 0x1($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    .word       0x460C8101  # sub.s       $f4, $f16, $f12
    .word       0x4618F082  # mul.s       $f2, $f30, $f24
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    .word       0x4604A000  # add.s       $f0, $f20, $f4
    sb          $v0, 0x6($v1)
    .word       0x460E1281  # sub.s       $f10, $f2, $f14
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    .word       0x4604A001  # sub.s       $f0, $f20, $f4
    sb          $v0, 0x2($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    .word       0x46045380  # add.s       $f14, $f10, $f4
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    .word       0x460EE000  # add.s       $f0, $f28, $f14
    sb          $v0, 0x5($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    .word       0x460EE001  # sub.s       $f0, $f28, $f14
    addiu       $t6, $t6, 0x20
    addiu       $a2, $a2, 0x4
    sb          $v0, 0x4($v1)
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    addiu       $v0, $v0, 0x4
    sra         $v0, $v0, 3
    andi        $v0, $v0, 0x3FF
    addu        $v0, $t8, $v0
    lbu         $v0, 0x0($v0)
    addiu       $a3, $a3, 0x1
    sb          $v0, 0x3($v1)
    slti        $v0, $a3, 0x8
    bnez        $v0, .L8005DC24
    addiu       $a1, $a1, 0x20
    lw          $s2, 0x108($sp)
    lw          $s1, 0x104($sp)
    lw          $s0, 0x100($sp)
    lwc1        $f31, 0x138($sp)
    lwc1        $f30, 0x13C($sp)
    lwc1        $f29, 0x130($sp)
    lwc1        $f28, 0x134($sp)
    lwc1        $f27, 0x128($sp)
    lwc1        $f26, 0x12C($sp)
    lwc1        $f25, 0x120($sp)
    lwc1        $f24, 0x124($sp)
    lwc1        $f23, 0x118($sp)
    lwc1        $f22, 0x11C($sp)
    lwc1        $f21, 0x110($sp)
    lwc1        $f20, 0x114($sp)
    addiu       $sp, $sp, 0x140
    jr          $ra
    nop
.end object_rows_decode

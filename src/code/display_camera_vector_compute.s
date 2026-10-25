.text
.align 2
.set noreorder
.globl display_camera_vector_compute
.ent display_camera_vector_compute
display_camera_vector_compute:
    lui         $a2, 0x8009
    lw          $a2, -0x49AC($a2)
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    addiu       $a0, $sp, 0x10
    sw          $ra, 0x24($sp)
    jal         func_8002E01C
    addiu       $a2, $a2, 0x28
    lwc1        $f14, 0x1C($sp)
    .word       0x44800000  # mtc1        $zero, $f0
    .word       0x44800800  # mtc1        $zero, $f1
    .word       0x460070A1  # cvt.d.s     $f2, $f14
    .word       0x46201032  # c.eq.d      $f2, $f0
    nop
    .word       0x45010007  # bc1t        . + 4 + (0x7 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f1, 0x890($at)
    lwc1        $f0, 0x894($at)
    .word       0x46220003  # div.d       $f0, $f0, $f2
    j .L80010B1C
    .word       0x462001A0  # cvt.s.d     $f6, $f0
.L80010B10:
    lui         $at, 0x8000
    lwc1        $f14, 0x898($at)
    .word       0x46007186  # mov.s       $f6, $f14
.L80010B1C:
    lwc1        $f0, 0x18($sp)
    .word       0x46060302  # mul.s       $f12, $f0, $f6
    lwc1        $f0, 0x10($sp)
    .word       0x46060282  # mul.s       $f10, $f0, $f6
    .word       0x44800000  # mtc1        $zero, $f0
    .word       0x44800800  # mtc1        $zero, $f1
    lwc1        $f2, 0x14($sp)
    .word       0x46006221  # cvt.d.s     $f8, $f12
    .word       0x4620403C  # c.lt.d      $f8, $f0
    addu        $v1, $zero, $zero
    .word       0x46061182  # mul.s       $f6, $f2, $f6
    .word       0x45000004  # bc1f        . + 4 + (0x4 << 2)
    nop
    .word       0x44806000  # mtc1        $zero, $f12
    j .L80010B78
    addiu       $v1, $zero, 0x1
.L80010B5C:
    lui         $at, 0x8000
    lwc1        $f1, 0x89C($at)
    lwc1        $f0, 0x8A0($at)
    .word       0x4628003C  # c.lt.d      $f0, $f8
    nop
    .word       0x45030001  # bc1tl       . + 4 + (0x1 << 2)
    addiu       $v1, $zero, 0x2
.L80010B78:
    lui         $at, 0x8000
    lwc1        $f5, 0x8A4($at)
    lwc1        $f4, 0x8A8($at)
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x4624003C  # c.lt.d      $f0, $f4
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f10, 0x8AC($at)
.L80010BA0:
    lui         $at, 0x8000
    lwc1        $f3, 0x8B0($at)
    lwc1        $f2, 0x8B4($at)
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x4620103C  # c.lt.d      $f2, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f10, 0x8B8($at)
.L80010BC8:
    .word       0x4624003C  # c.lt.d      $f0, $f4
    nop
    .word       0x45020004  # bc1fl       . + 4 + (0x4 << 2)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f6, 0x8BC($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
.L80010BE4:
    .word       0x4620103C  # c.lt.d      $f2, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f6, 0x8C0($at)
.L80010BFC:
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lwc1        $f0, 0x228($v0)
    .word       0x46005002  # mul.s       $f0, $f10, $f0
    lwc1        $f2, 0x22C($v0)
    lwc1        $f4, 0x230($v0)
    .word       0x46023182  # mul.s       $f6, $f6, $f2
    .word       0x46040280  # add.s       $f10, $f0, $f4
    lwc1        $f4, 0x234($v0)
    .word       0x46043180  # add.s       $f6, $f6, $f4
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    lui         $at, 0x8000
    lwc1        $f1, 0x8C4($at)
    lwc1        $f0, 0x8C8($at)
    .word       0x46221080  # add.d       $f2, $f2, $f2
    .word       0x46006121  # cvt.d.s     $f4, $f12
    .word       0x46202102  # mul.d       $f4, $f4, $f0
    .word       0x46003021  # cvt.d.s     $f0, $f6
    .word       0x46201081  # sub.d       $f2, $f2, $f0
    addu        $v0, $v1, $zero
    swc1        $f14, 0x8($s0)
    swc1        $f10, 0x0($s0)
    .word       0x462011A0  # cvt.s.d     $f6, $f2
    swc1        $f6, 0x4($s0)
    .word       0x46202320  # cvt.s.d     $f12, $f4
    swc1        $f12, 0xC($s0)
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end display_camera_vector_compute

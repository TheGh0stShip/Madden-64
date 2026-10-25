.text
.align 2
.set noreorder
.globl func_80099DD4
.ent func_80099DD4
func_80099DD4:
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
    lwc1        $f1, 0x6D8($at)
    lwc1        $f0, 0x6DC($at)
    .word       0x46220003  # div.d       $f0, $f0, $f2
    j           func_80095718
    .word       0x462001A0  # cvt.s.d     $f6, $f0
.L80099E30:
    lui         $at, 0x8000
    lwc1        $f14, 0x6E0($at)
    .word       0x46007186  # mov.s       $f6, $f14
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
    j           func_80095774
    addiu       $v1, $zero, 0x1
.L80099E7C:
    lui         $at, 0x8000
    lwc1        $f1, 0x6E4($at)
    lwc1        $f0, 0x6E8($at)
    .word       0x4628003C  # c.lt.d      $f0, $f8
    nop
    .word       0x45030001  # bc1tl       . + 4 + (0x1 << 2)
    addiu       $v1, $zero, 0x2
.L80099E98:
    lui         $at, 0x8000
    lwc1        $f5, 0x6EC($at)
    lwc1        $f4, 0x6F0($at)
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x4624003C  # c.lt.d      $f0, $f4
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f10, 0x6F4($at)
.L80099EC0:
    lui         $at, 0x8000
    lwc1        $f3, 0x6F8($at)
    lwc1        $f2, 0x6FC($at)
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x4620103C  # c.lt.d      $f2, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f10, 0x700($at)
.L80099EE8:
    .word       0x4624003C  # c.lt.d      $f0, $f4
    nop
    .word       0x45020004  # bc1fl       . + 4 + (0x4 << 2)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f6, 0x704($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
.L80099F04:
    .word       0x4620103C  # c.lt.d      $f2, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f6, 0x708($at)
.L80099F1C:
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
    lwc1        $f1, 0x70C($at)
    lwc1        $f0, 0x710($at)
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
.end func_80099DD4

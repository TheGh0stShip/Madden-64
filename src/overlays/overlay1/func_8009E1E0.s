.text
.align 2
.set noreorder
.globl func_8009E1E0
.ent func_8009E1E0
func_8009E1E0:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x24($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x28($sp)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x4($s0)
    lw          $a0, 0x8($s0)
    addiu       $a1, $sp, 0x10
    sll         $v0, $v0, 16
    sll         $v1, $v1, 16
    sll         $a0, $a0, 16
    sw          $a0, 0x8($s0)
    addu        $a0, $s0, $zero
    sw          $v0, 0x0($s0)
    jal         func_8002DBD0
    sw          $v1, 0x4($s0)
    lh          $v0, 0x0($s0)
    lh          $v1, 0x4($s0)
    lh          $a0, 0x8($s0)
    sw          $v0, 0x0($s0)
    sw          $v1, 0x4($s0)
    sw          $a0, 0x8($s0)
    lw          $v0, 0x18($sp)
    bnez        $v0, .L8009E250
    lui         $v0, 0xFFFF
    sw          $v0, 0x18($sp)
.L8009E250:
    lui         $at, 0x8000
    lwc1        $f7, 0x9B0($at)
    lwc1        $f6, 0x9B4($at)
    lwc1        $f4, 0x10($sp)
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x46002021  # cvt.d.s     $f0, $f4
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    lwc1        $f12, 0x18($sp)
    .word       0x46806320  # cvt.s.w     $f12, $f12
    .word       0x460060A1  # cvt.d.s     $f2, $f12
    .word       0x46261082  # mul.d       $f2, $f2, $f6
    lui         $at, 0x8000
    lwc1        $f9, 0x9B8($at)
    lwc1        $f8, 0x9BC($at)
    .word       0x46200120  # cvt.s.d     $f4, $f0
    .word       0x46002121  # cvt.d.s     $f4, $f4
    .word       0x46282102  # mul.d       $f4, $f4, $f8
    .word       0x46201320  # cvt.s.d     $f12, $f2
    .word       0x460060A1  # cvt.d.s     $f2, $f12
    .word       0x46222103  # div.d       $f4, $f4, $f2
    lwc1        $f10, 0x14($sp)
    .word       0x468052A0  # cvt.s.w     $f10, $f10
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    .word       0x462002A0  # cvt.s.d     $f10, $f0
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x46280002  # mul.d       $f0, $f0, $f8
    .word       0x46220003  # div.d       $f0, $f0, $f2
    .word       0x4600608D  # trunc.w.s   $f2, $f12
    swc1        $f2, 0x8($s1)
    .word       0x46202120  # cvt.s.d     $f4, $f4
    .word       0x462002A0  # cvt.s.d     $f10, $f0
    .word       0x4600200D  # trunc.w.s   $f0, $f4
    swc1        $f0, 0x0($s1)
    .word       0x4600500D  # trunc.w.s   $f0, $f10
    swc1        $f0, 0x4($s1)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009E1E0

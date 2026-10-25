.text
.align 2
.set noreorder
.globl projection_scale_configure
.ent projection_scale_configure
projection_scale_configure:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s0, 0x20($sp)
    lhu         $v0, 0x4($s1)
    lui         $at, 0x8000
    lwc1        $f1, 0x6A8($at)
    lwc1        $f0, 0x6AC($at)
    .word       0x44825000  # mtc1        $v0, $f10
    .word       0x468052A0  # cvt.s.w     $f10, $f10
    .word       0x46005121  # cvt.d.s     $f4, $f10
    .word       0x46202002  # mul.d       $f0, $f4, $f0
    lui         $at, 0x8000
    lwc1        $f13, 0x6B0($at)
    lwc1        $f12, 0x6B4($at)
    addiu       $s0, $zero, 0x4
    lui         $at, 0x8000
    lwc1        $f2, 0x6B8($at)
    .word       0x4624603C  # c.lt.d      $f12, $f4
    lui         $at, 0x8000
    lwc1        $f8, 0x6BC($at)
    .word       0x45000010  # bc1f        . + 4 + (0x10 << 2)
    .word       0x462003A0  # cvt.s.d     $f14, $f0
    lui         $at, 0x8000
    lwc1        $f7, 0x6C0($at)
    lwc1        $f6, 0x6C4($at)
.L8000CD34:
    .word       0x46262102  # mul.d       $f4, $f4, $f6
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46261082  # mul.d       $f2, $f2, $f6
    .word       0x46004021  # cvt.d.s     $f0, $f8
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    sll         $s0, $s0, 1
    .word       0x462022A0  # cvt.s.d     $f10, $f4
    .word       0x46005121  # cvt.d.s     $f4, $f10
    .word       0x4624603C  # c.lt.d      $f12, $f4
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    .word       0x4501FFF5  # bc1t        . + 4 + (-0xB << 2)
    .word       0x46200220  # cvt.s.d     $f8, $f0
.L8000CD64:
    lui         $at, 0x8000
    lwc1        $f0, 0x6C8($at)
    .word       0x46001407  # neg.s       $f16, $f2
    swc1        $f8, 0x10($sp)
    .word       0x46004207  # neg.s       $f8, $f8
    .word       0x44051000  # mfc1        $a1, $f2
    .word       0x44068000  # mfc1        $a2, $f16
    .word       0x44074000  # mfc1        $a3, $f8
    addiu       $a0, $s1, 0x68
    swc1        $f10, 0x14($sp)
    swc1        $f14, 0x18($sp)
    jal         func_800468A8
    swc1        $f0, 0x1C($sp)
    sltiu       $v0, $s0, 0x101
    beql        $v0, $zero, .L8000CDA4
    addiu       $s0, $zero, 0x100
.L8000CDA4:
    sh          $s0, 0x1E8($s1)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end projection_scale_configure

.text
.align 2
.set noreorder
.globl func_8009F704
.ent func_8009F704
func_8009F704:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x1C($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($s2)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x40
    addu        $a2, $zero, $zero
    lui         $at, 0x8000
    lwc1        $f5, 0xB70($at)
    lwc1        $f4, 0xB74($at)
    addiu       $a3, $zero, 0xFF
    addu        $a1, $v0, $zero
    sw          $a1, 0x0($s0)
.L8009F74C:
    lw          $v0, 0x4($s1)
    sll         $v1, $a2, 4
    addu        $v0, $v1, $v0
    lwc1        $f0, 0x0($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x46200007  # neg.d       $f0, $f0
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x0($a1)
    lw          $v0, 0x4($s1)
    addu        $v1, $v1, $v0
    lwc1        $f0, 0x4($v1)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    sh          $zero, 0x4($a1)
    sh          $zero, 0x6($a1)
    .word       0x46200007  # neg.d       $f0, $f0
    sb          $a3, 0xF($a1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x2($a1)
    lbu         $v0, 0x9($s1)
    sb          $v0, 0xC($a1)
    lbu         $v0, 0xA($s1)
    sb          $v0, 0xD($a1)
    lbu         $v0, 0xB($s1)
    addiu       $a2, $a2, 0x1
    sb          $v0, 0xE($a1)
    sltiu       $v0, $a2, 0x4
    bnez        $v0, .L8009F74C
    addiu       $a1, $a1, 0x10
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x14($s2)
    sw          $zero, 0x18($s2)
    sw          $zero, 0x24($s2)
    sw          $zero, 0x20($s2)
    sw          $zero, 0x1C($s2)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8009F704

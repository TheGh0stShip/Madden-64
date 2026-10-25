.text
.align 2
.set noreorder
.globl func_8009BA3C
.ent func_8009BA3C
func_8009BA3C:
    sh          $a1, -0x7B80($at)
    lui         $at, 0x8008
    sh          $a0, -0x7B7C($at)
    .word       0x46040001  # sub.s       $f0, $f0, $f4
    .word       0x4600110D  # trunc.w.s   $f4, $f2
    .word       0x44042000  # mfc1        $a0, $f4
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44051000  # mfc1        $a1, $f2
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    jal         func_800975A0
    swc1        $f0, 0x44($sp)
    addu        $s1, $v0, $zero
    addiu       $v0, $zero, 0x8
    beq         $s1, $v0, . + 4 + (0x81 << 2)
    nop
    lui         $a2, 0x8008
    lh          $a2, -0x7B78($a2)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a1, 0x8009
    lw          $a1, -0x49AC($a1)
    .word       0x44861000  # mtc1        $a2, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    lwc1        $f0, 0x230($a1)
    lui         $a2, 0x8008
    lh          $a2, -0x7B74($a2)
    lwc1        $f4, 0x234($a1)
    addiu       $v0, $v1, 0x8
    .word       0x46001080  # add.s       $f2, $f2, $f0
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    .word       0x44860000  # mtc1        $a2, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46040000  # add.s       $f0, $f0, $f4
    sw          $v0, 0x0($v1)
    sw          $zero, 0x4($v1)
    .word       0x4600110D  # trunc.w.s   $f4, $f2
    .word       0x44022000  # mfc1        $v0, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44031000  # mfc1        $v1, $f2
    lui         $at, 0x8008
    sh          $v0, -0x7B78($at)
    addiu       $v0, $v0, -0x10
    lui         $at, 0x8008
    sh          $v1, -0x7B74($at)
.end func_8009BA3C

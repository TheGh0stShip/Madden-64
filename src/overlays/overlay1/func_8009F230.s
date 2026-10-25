.text
.align 2
.set noreorder
.globl func_8009F230
.ent func_8009F230
func_8009F230:
    lw          $v0, 0x1C($a1)
    lui         $at, 0x8000
    lwc1        $f3, 0xB68($at)
    lwc1        $f2, 0xB6C($at)
    negu        $v0, $v0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x44832000  # mtc1        $v1, $f4
    .word       0x46802121  # cvt.d.w     $f4, $f4
    .word       0x46240000  # add.d       $f0, $f0, $f4
    .word       0x4620018D  # trunc.w.d   $f6, $f0
    .word       0x44023000  # mfc1        $v0, $f6
    sh          $v0, 0x18($sp)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x20($v0)
    negu        $v0, $v0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x4620018D  # trunc.w.d   $f6, $f0
    .word       0x44023000  # mfc1        $v0, $f6
    sh          $v0, 0x1A($sp)
    lw          $v0, 0x4($s1)
    lw          $v0, 0x1C($v0)
    negu        $v0, $v0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x46240000  # add.d       $f0, $f0, $f4
    .word       0x4620010D  # trunc.w.d   $f4, $f0
    .word       0x44022000  # mfc1        $v0, $f4
    sh          $v0, 0x20($sp)
    lw          $v0, 0x4($s1)
    lw          $v0, 0x20($v0)
    negu        $v0, $v0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x22($sp)
    addu        $a3, $zero, $zero
    lui         $t3, 0x8888
    ori         $t3, $t3, 0x8889
    addu        $t1, $zero, $zero
    lh          $a1, 0x20($sp)
    lh          $v1, 0x18($sp)
    lh          $a0, 0x22($sp)
    lh          $v0, 0x1A($sp)
    addu        $t0, $zero, $zero
    subu        $t5, $a1, $v1
    subu        $t4, $a0, $v0
.L8009F314:
    .word       0x010B0018  # mult        $t0, $t3
    lw          $a1, 0xC($s1)
    sll         $a2, $a3, 3
    addiu       $a3, $a3, 0x1
    lhu         $a0, 0x18($sp)
    sra         $v0, $t0, 31
    .word       0x00001810  # mfhi        $v1
    addu        $a1, $a2, $a1
    addu        $v1, $v1, $t0
    .word       0x012B0018  # mult        $t1, $t3
    sra         $v1, $v1, 3
    subu        $v1, $v1, $v0
    addu        $a0, $a0, $v1
    sh          $a0, 0x0($a1)
    lw          $v0, 0xC($s1)
    sra         $a0, $t1, 31
    addu        $t0, $t0, $t5
    addu        $a2, $a2, $v0
    lhu         $v0, 0x1A($sp)
    .word       0x00005010  # mfhi        $t2
    addu        $v1, $t2, $t1
    sra         $v1, $v1, 3
    subu        $v1, $v1, $a0
    addu        $v0, $v0, $v1
    sh          $v0, 0x2($a2)
    slti        $v0, $a3, 0x10
    bnez        $v0, .L8009F314
    addu        $t1, $t1, $t4
    lw          $v0, 0xC($s1)
    lw          $v1, 0x8($s1)
    lhu         $v0, 0x0($v0)
    sh          $v0, 0x0($v1)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x8($s1)
    lhu         $v0, 0x2($v0)
    addiu       $s0, $zero, 0x8
    sh          $v0, 0x2($v1)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x8($s1)
    addu        $v0, $s0, $v0
    lh          $a1, 0x0($v0)
    addu        $a2, $s0, $v1
    lh          $a0, 0x0($a2)
    lh          $v0, -0x8($v0)
    lh          $v1, -0x8($a2)
    subu        $a0, $a1, $a0
    subu        $v0, $v0, $v1
    addu        $a0, $a0, $v0
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $a0, $v0, 1
    bgez        $a0, .L8009F410
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lw          $v1, 0xC($s1)
    lw          $a0, 0x8($s1)
    addu        $v1, $s0, $v1
    lhu         $v1, 0x0($v1)
    addu        $a0, $s0, $a0
    addu        $v1, $v1, $v0
    j           func_8009AD18
    sh          $v1, 0x0($a0)
.L8009F410:
    blezl       $a0, .L8009F43C
    sh          $a1, 0x0($a2)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lw          $v1, 0xC($s1)
    lw          $a0, 0x8($s1)
    addu        $v1, $s0, $v1
    lhu         $v1, 0x0($v1)
    addu        $a0, $s0, $a0
    subu        $v1, $v1, $v0
    sh          $v1, 0x0($a0)
.L8009F43C:
    lw          $v0, 0xC($s1)
    lw          $v1, 0x8($s1)
    addu        $v0, $s0, $v0
    lh          $a1, 0x2($v0)
    addu        $a2, $s0, $v1
    lh          $a0, 0x2($a2)
    lh          $v0, -0x6($v0)
    lh          $v1, -0x6($a2)
    subu        $a0, $a1, $a0
    subu        $v0, $v0, $v1
    addu        $a0, $a0, $v0
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $a0, $v0, 1
    bgez        $a0, . + 4 + (0xB << 2)
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lw          $v1, 0xC($s1)
    lw          $a0, 0x8($s1)
    addu        $v1, $s0, $v1
    lhu         $v1, 0x2($v1)
    addu        $a0, $s0, $a0
    addu        $v1, $v1, $v0
    j           func_8009ADAC
    sh          $v1, 0x2($a0)
.end func_8009F230

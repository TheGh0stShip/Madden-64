.text
.align 2
.set noreorder
.globl func_8009EFAC
.ent func_8009EFAC
func_8009EFAC:
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x0($a1)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x8($s0)
    lw          $v0, 0x20($v0)
    addu        $a1, $a3, $v1
    negu        $v0, $v0
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x00006010  # mfhi        $t4
    srl         $a0, $t4, 3
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    bgez        $a0, .L8009EFF4
    nop
    .word       0x46241080  # add.d       $f2, $f2, $f4
.L8009EFF4:
    .word       0x46220000  # add.d       $f0, $f0, $f2
    addu        $t1, $t1, $s2
    addiu       $a2, $a2, 0x1
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sh          $v0, 0x2($a1)
    sltiu       $v0, $a2, 0x10
    bnez        $v0, . + 4 + (-0x2F << 2)
    addu        $t0, $t0, $s3
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x400
    addu        $a2, $zero, $zero
    addiu       $t2, $zero, 0xFF
    addiu       $a3, $zero, 0x80
    addiu       $t3, $zero, -0xB
    addu        $t1, $v0, $zero
    addu        $a1, $t1, $zero
    addiu       $t0, $zero, 0x10
    addiu       $v0, $t1, 0x200
    sw          $t1, 0x10($s0)
    sw          $v0, 0x14($s0)
.L8009F04C:
    addu        $a0, $t0, $t1
    sb          $t2, 0xF($a1)
    sb          $a3, 0xE($a1)
    sb          $a3, 0xD($a1)
    sb          $a3, 0xC($a1)
    sb          $t2, 0xF($a0)
    sb          $a3, 0xE($a0)
    sb          $a3, 0xD($a0)
    sb          $a3, 0xC($a0)
    sh          $zero, 0x6($a1)
    sh          $zero, 0x6($a0)
    sh          $zero, 0x4($a1)
    sh          $t3, 0x4($a0)
    lw          $v0, 0x8($s0)
    sll         $v1, $a2, 3
    addu        $v0, $v1, $v0
    lhu         $v0, 0x0($v0)
    sh          $v0, 0x0($a1)
    sh          $v0, 0x0($a0)
    lw          $v0, 0x8($s0)
    addu        $v1, $v1, $v0
    lhu         $v0, 0x2($v1)
    addiu       $t0, $t0, 0x20
    addiu       $a2, $a2, 0x1
    sh          $v0, 0x2($a1)
    sh          $v0, 0x2($a0)
    sltiu       $v0, $a2, 0x10
    bnez        $v0, .L8009F04C
    addiu       $a1, $a1, 0x20
    lw          $a0, 0x14($s0)
    lw          $a1, 0x10($s0)
    jal         func_8002E17C
    addiu       $a2, $zero, 0x200
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x14($s1)
    sw          $zero, 0x18($s1)
    sw          $zero, 0x24($s1)
    sw          $zero, 0x20($s1)
    sw          $zero, 0x1C($s1)
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    lwc1        $f21, 0x28($sp)
    lwc1        $f20, 0x2C($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009EFAC

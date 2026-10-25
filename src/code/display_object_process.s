.text
.align 2
.set noreorder
.globl display_object_process
.ent display_object_process
display_object_process:
    addiu       $sp, $sp, -0x158
    sw          $ra, 0x124($sp)
    sw          $fp, 0x120($sp)
    sw          $s7, 0x11C($sp)
    sw          $s6, 0x118($sp)
    sw          $s5, 0x114($sp)
    sw          $s4, 0x110($sp)
    sw          $s3, 0x10C($sp)
    sw          $s2, 0x108($sp)
    sw          $s1, 0x104($sp)
    sw          $s0, 0x100($sp)
    swc1        $f31, 0x150($sp)
    swc1        $f30, 0x154($sp)
    swc1        $f29, 0x148($sp)
    swc1        $f28, 0x14C($sp)
    swc1        $f27, 0x140($sp)
    swc1        $f26, 0x144($sp)
    swc1        $f25, 0x138($sp)
    swc1        $f24, 0x13C($sp)
    swc1        $f23, 0x130($sp)
    swc1        $f22, 0x134($sp)
    swc1        $f21, 0x128($sp)
    swc1        $f20, 0x12C($sp)
    lw          $s2, 0x8($a0)
    lbu         $s3, 0x8($s2)
    addu        $s4, $zero, $zero
    addiu       $v0, $s3, -0x1
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80010914
    addu        $s5, $s4, $zero
    lui         $v0, 0x8006
    lh          $v0, 0x5458($v0)
    beqz        $v0, .L80010914
    nop
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    lui         $v0, 0xAAAA
    ori         $v0, $v0, 0xAAAB
    .word       0x00620019  # multu       $v1, $v0
    lui         $a0, 0x8006
    lhu         $a0, 0x4A4C($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x49AC($v1)
    addiu       $a0, $a0, 0xC00
    andi        $a0, $a0, 0xFFF
    lui         $at, 0x8009
    sh          $a0, -0x6AA4($at)
    lhu         $s0, 0x18($v1)
    lhu         $s1, 0x1A($v1)
    .word       0x00005010  # mfhi        $t2
    srl         $v0, $t2, 6
    andi        $v0, $v0, 0xFFFF
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    .word       0x4482A000  # mtc1        $v0, $f20
    .word       0x4680A520  # cvt.s.w     $f20, $f20
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    .word       0x4482B000  # mtc1        $v0, $f22
    .word       0x4680B5A0  # cvt.s.w     $f22, $f22
    lui         $at, 0x8006
    swc1        $f0, 0x5468($at)
    jal         func_8002E828
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5464($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lui         $at, 0x8006
    lwc1        $f2, 0x5468($at)
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lui         $at, 0x8006
    lwc1        $f3, 0x5470($at)
    lwc1        $f2, 0x5474($at)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46201081  # sub.d       $f2, $f2, $f0
    lui         $a0, 0x8009
    lh          $a0, -0x6AA4($a0)
    lui         $at, 0x8006
    swc1        $f3, 0x5470($at)
    swc1        $f2, 0x5474($at)
    jal         func_8002E848
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5464($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lui         $at, 0x8006
    lwc1        $f3, 0x5470($at)
    lwc1        $f2, 0x5474($at)
    lui         $at, 0x8006
    lwc1        $f4, 0x5468($at)
    .word       0x4600A521  # cvt.d.s     $f20, $f20
    .word       0x46341080  # add.d       $f2, $f2, $f20
    lui         $at, 0x8006
    lwc1        $f7, 0x5478($at)
    lwc1        $f6, 0x547C($at)
    .word       0x46040002  # mul.s       $f0, $f0, $f4
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44032000  # mfc1        $v1, $f4
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8000
    lwc1        $f5, 0x7C8($at)
    lwc1        $f4, 0x7CC($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46203180  # add.d       $f6, $f6, $f0
    .word       0x4600B5A1  # cvt.d.s     $f22, $f22
    .word       0x46363580  # add.d       $f22, $f6, $f22
    .word       0x44802000  # mtc1        $zero, $f4
    .word       0x44802800  # mtc1        $zero, $f5
    .word       0x46201220  # cvt.s.d     $f8, $f2
    .word       0x46004021  # cvt.d.s     $f0, $f8
    .word       0x4624003C  # c.lt.d      $f0, $f4
    lui         $at, 0x8006
    swc1        $f7, 0x5478($at)
    swc1        $f6, 0x547C($at)
    .word       0x4620B00D  # trunc.w.d   $f0, $f22
    .word       0x44060000  # mfc1        $a2, $f0
    .word       0x4600400D  # trunc.w.s   $f0, $f8
    .word       0x44040000  # mfc1        $a0, $f0
    .word       0x45000005  # bc1f        . + 4 + (0x5 << 2)
    addiu       $v0, $a0, -0x1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    j .L8000FB58
    nop
.L8000FB50:
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
.L8000FB58:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    swc1        $f2, 0x9C($sp)
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8000
    lwc1        $f3, 0x7D0($at)
    lwc1        $f2, 0x7D4($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x44801000  # mtc1        $zero, $f2
    .word       0x44801800  # mtc1        $zero, $f3
    .word       0x46200220  # cvt.s.d     $f8, $f0
    .word       0x46004021  # cvt.d.s     $f0, $f8
    .word       0x4620103C  # c.lt.d      $f2, $f0
    .word       0x4600400D  # trunc.w.s   $f0, $f8
    .word       0x44040000  # mfc1        $a0, $f0
    .word       0x45000005  # bc1f        . + 4 + (0x5 << 2)
    addiu       $v0, $a0, 0x1
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    j .L8000FBC0
    nop
.L8000FBB8:
    .word       0x44840000  # mtc1        $a0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
.L8000FBC0:
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    swc1        $f2, 0xA4($sp)
    lw          $t4, 0x9C($sp)
    lw          $t2, 0xA4($sp)
    addiu       $a0, $zero, 0x3FFF
    sll         $t4, $t4, 10
    sll         $t2, $t2, 10
    sw          $t4, 0x9C($sp)
    subu        $v0, $v1, $t4
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v1, $v1, $v0
    sw          $t2, 0xA4($sp)
    sw          $v1, 0x9C($sp)
    lw          $a1, 0xC($s2)
    subu        $v0, $t2, $a2
    sll         $v1, $s1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v1, $v1, $v0
    jal         func_800109A4
    sw          $v1, 0xA4($sp)
    jal         func_80009E14
    lui         $a0, 0x80
    jal         func_8000A404
    addiu       $a0, $zero, 0x4
    addu        $s1, $s3, $zero
    addiu       $v0, $zero, 0x1
    bne         $s1, $v0, .L8000FC5C
    addiu       $s0, $zero, 0x2
    lui         $a0, 0x44
    ori         $a0, $a0, 0x3078
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x3078
    addiu       $s0, $zero, 0x2
.L8000FC5C:
    bne         $s1, $s0, .L8000FC74
    lui         $a0, 0x40
    ori         $a0, $a0, 0x49D8
    lui         $a1, 0x40
    jal         func_8000A63C
    ori         $a1, $a1, 0x49D8
.L8000FC74:
    lhu         $a2, 0x0($s2)
    lhu         $a3, 0x2($s2)
    sw          $zero, 0x10($sp)
    sw          $s0, 0x14($sp)
    sw          $s0, 0x18($sp)
    lhu         $v0, 0x4($s2)
    sw          $v0, 0x1C($sp)
    lhu         $v0, 0x6($s2)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $v0, 0x20($sp)
    lw          $a0, 0x10($s2)
    addiu       $a1, $zero, 0x2
    addu        $t3, $zero, $zero
    jal         func_8000979C
    sw          $t3, 0xD4($sp)
    addu        $a3, $s1, $zero
    addiu       $t1, $zero, 0x1
    lui         $a2, 0x8006
    lw          $a2, 0x545C($a2)
    addiu       $t0, $zero, 0x2
    lw          $t3, 0xD4($sp)
.L8000FCCC:
    bne         $a3, $t1, .L8000FD28
    sll         $v0, $t3, 16
    sra         $v0, $v0, 15
    addu        $a1, $v0, $a2
    lhu         $a0, 0x0($a1)
    addiu       $v0, $a0, -0x1
    sltiu       $v0, $v0, 0x8
    beqz        $v0, .L8000FD00
    sll         $v0, $a0, 16
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    j .L8000FD24
    subu        $v0, $a0, $v0
.L8000FD00:
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x9
    bnez        $v0, .L8000FD28
    nop
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    subu        $v0, $a0, $v0
.L8000FD24:
    sh          $v0, 0x0($a1)
.L8000FD28:
    bne         $a3, $t0, .L8000FD5C
    addiu       $v0, $t3, 0x1
    sll         $v0, $t3, 16
    sra         $v0, $v0, 15
    addu        $a0, $v0, $a2
    lh          $v0, 0x0($a0)
    beqz        $v0, .L8000FD58
    addu        $v1, $v0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    subu        $v0, $v1, $v0
    sh          $v0, 0x0($a0)
.L8000FD58:
    addiu       $v0, $t3, 0x1
.L8000FD5C:
    addu        $t3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x400
    bnez        $v0, .L8000FCCC
    nop
    addu        $t3, $zero, $zero
    lui         $a0, 0x8006
    lw          $a0, 0x545C($a0)
    sll         $v0, $t3, 16
.L8000FD84:
    sra         $v0, $v0, 15
    addu        $v1, $v0, $a0
    lh          $v0, 0x0($v1)
    bltzl       $v0, .L8000FD98
    sh          $zero, 0x0($v1)
.L8000FD98:
    addiu       $v0, $t3, 0x1
    addu        $t3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x400
    bnez        $v0, .L8000FD84
    sll         $v0, $t3, 16
    addu        $s1, $s3, $zero
    addiu       $v0, $zero, 0x1
    bne         $s1, $v0, .L8000FE0C
    addiu       $v0, $zero, 0x2
    jal         func_80031A1C
    addiu       $a0, $zero, 0x400
    addiu       $a0, $zero, 0x400
    lui         $v1, 0x8006
    lw          $v1, 0x545C($v1)
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addiu       $s0, $zero, 0x12E
    addu        $v0, $v0, $v1
    jal         func_80031A1C
    sh          $s0, 0x0($v0)
    lui         $v1, 0x8006
    lw          $v1, 0x545C($v1)
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    sh          $s0, 0x0($v0)
    addiu       $v0, $zero, 0x2
.L8000FE0C:
    bne         $s1, $v0, .L8000FE38
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x400
    lui         $v1, 0x8006
    lw          $v1, 0x545C($v1)
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    addiu       $v1, $zero, 0x12C
    sh          $v1, 0x0($v0)
.L8000FE38:
    jal         func_8002DED0
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5464($at)
    lwc1        $f0, 0x8($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    swc1        $f0, 0x7C($sp)
    lwc1        $f0, 0x14($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    swc1        $f0, 0x84($sp)
    lwc1        $f0, 0x20($v0)
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lui         $v1, 0x8009
    lw          $v1, -0x49AC($v1)
    swc1        $f0, 0x8C($sp)
    lh          $v0, 0x18($v1)
    lwc1        $f28, 0x7C($sp)
    .word       0x44822000  # mtc1        $v0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x4604E102  # mul.s       $f4, $f28, $f4
    lh          $v0, 0x1A($v1)
    lwc1        $f30, 0x84($sp)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x4600F002  # mul.s       $f0, $f30, $f0
    lh          $v0, 0x1C($v1)
    lwc1        $f28, 0x8C($sp)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x4602E082  # mul.s       $f2, $f28, $f2
    .word       0x46002100  # add.s       $f4, $f4, $f0
    addu        $t3, $zero, $zero
    addu        $t0, $s1, $zero
    addu        $s6, $zero, $zero
    addu        $s7, $zero, $zero
    .word       0x46022100  # add.s       $f4, $f4, $f2
    swc1        $f4, 0x94($sp)
.L8000FED8:
    lw          $t2, 0xA4($sp)
    sll         $v0, $t3, 16
    sra         $v0, $v0, 11
    sw          $v0, 0xB4($sp)
    addiu       $v0, $v0, -0x800
    sh          $zero, 0x66($sp)
    addu        $v0, $t2, $v0
    sw          $v0, 0xBC($sp)
.L8000FEF8:
    lhu         $t4, 0x66($sp)
    sll         $v1, $t3, 5
    lui         $a0, 0x8006
    lw          $a0, 0x545C($a0)
    addu        $v1, $t4, $v1
    sll         $v0, $v1, 16
    sra         $v0, $v0, 15
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
    beqz        $v0, .L800108D4
    sh          $v1, 0x76($sp)
    sll         $v0, $t4, 16
    sra         $v0, $v0, 11
    lw          $t2, 0x9C($sp)
    addiu       $v1, $v0, -0x400
    lw          $t4, 0xB4($sp)
    addu        $t9, $t2, $v1
    addu        $t8, $t2, $v0
    addiu       $v0, $v0, 0x400
    addu        $t7, $t2, $v0
    lw          $t2, 0xA4($sp)
    sh          $zero, 0x6E($sp)
    addiu       $v0, $t4, -0x400
    addu        $t6, $t2, $v0
    addu        $t5, $t2, $t4
.L8000FF5C:
    lhu         $t4, 0x6E($sp)
    sll         $v0, $t4, 16
    sra         $v1, $v0, 16
    bnez        $v1, .L8000FF88
    addiu       $t2, $zero, 0x1
    .word       0x4499E000  # mtc1        $t9, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x4415E000  # mfc1        $s5, $f28
    lwc1        $f30, 0xBC($sp)
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4414F000  # mfc1        $s4, $f30
.L8000FF88:
    bne         $v1, $t2, .L8000FFAC
    addiu       $v0, $zero, 0x2
    .word       0x4498E000  # mtc1        $t8, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    lwc1        $f30, 0xBC($sp)
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L8000FFAC:
    bne         $v1, $v0, .L8000FFD0
    addiu       $v0, $zero, 0x3
    .word       0x448FE000  # mtc1        $t7, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    lwc1        $f30, 0xBC($sp)
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L8000FFD0:
    bne         $v1, $v0, .L8000FFF4
    addiu       $v0, $zero, 0x4
    .word       0x4499E000  # mtc1        $t9, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x448EF000  # mtc1        $t6, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L8000FFF4:
    bne         $v1, $v0, .L80010018
    addiu       $v0, $zero, 0x5
    .word       0x4498E000  # mtc1        $t8, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x448EF000  # mtc1        $t6, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L80010018:
    bne         $v1, $v0, .L8001003C
    addiu       $v0, $zero, 0x6
    .word       0x448FE000  # mtc1        $t7, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x448EF000  # mtc1        $t6, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L8001003C:
    bne         $v1, $v0, .L80010060
    addiu       $v0, $zero, 0x7
    .word       0x4499E000  # mtc1        $t9, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x448DF000  # mtc1        $t5, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L80010060:
    bne         $v1, $v0, .L80010084
    addiu       $v0, $zero, 0x8
    .word       0x4498E000  # mtc1        $t8, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x448DF000  # mtc1        $t5, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
    .word       0x4415E000  # mfc1        $s5, $f28
    j .L800100A0
    nop
.L80010084:
    bne         $v1, $v0, .L800100A4
    nop
    .word       0x448FE000  # mtc1        $t7, $f28
    .word       0x4680E720  # cvt.s.w     $f28, $f28
    .word       0x4415E000  # mfc1        $s5, $f28
    .word       0x448DF000  # mtc1        $t5, $f30
    .word       0x4680F7A0  # cvt.s.w     $f30, $f30
.L800100A0:
    .word       0x4414F000  # mfc1        $s4, $f30
.L800100A4:
    lhu         $t2, 0x76($sp)
    lui         $v1, 0x8006
    lw          $v1, 0x545C($v1)
    sll         $v0, $t2, 16
    sra         $v0, $v0, 15
    addu        $v0, $v0, $v1
    lh          $v0, 0x0($v0)
    addiu       $t4, $zero, 0x1
    .word       0x44823000  # mtc1        $v0, $f6
    .word       0x468031A0  # cvt.s.w     $f6, $f6
    bne         $t0, $t4, .L800100E0
    slti        $v0, $v0, 0x7
    beqz        $v0, .L800100E0
    nop
    .word       0x44803000  # mtc1        $zero, $f6
.L800100E0:
    lwc1        $f28, 0x7C($sp)
    .word       0x4495F000  # mtc1        $s5, $f30
    .word       0x461EE002  # mul.s       $f0, $f28, $f30
    lwc1        $f28, 0x84($sp)
    .word       0x4494F000  # mtc1        $s4, $f30
    .word       0x461EE082  # mul.s       $f2, $f28, $f30
    lwc1        $f28, 0x8C($sp)
    .word       0x4606E102  # mul.s       $f4, $f28, $f6
    .word       0x46020000  # add.s       $f0, $f0, $f2
    .word       0x46040000  # add.s       $f0, $f0, $f4
    lwc1        $f30, 0x94($sp)
    .word       0x4600F03C  # c.lt.s      $f30, $f0
    nop
    .word       0x450001E7  # bc1f        . + 4 + (0x1E7 << 2)
    addiu       $v0, $zero, 0x2
    .word       0x4495E000  # mtc1        $s5, $f28
    .word       0x4600E007  # neg.s       $f0, $f28
    .word       0x4494F000  # mtc1        $s4, $f30
    .word       0x4600F087  # neg.s       $f2, $f30
    swc1        $f0, 0x50($sp)
    bne         $t0, $v0, .L80010148
    swc1        $f2, 0x54($sp)
    lui         $v0, 0x8006
    lh          $v0, 0x5482($v0)
    j .L80010154
    .word       0x46003087  # neg.s       $f2, $f6
.L80010148:
    lui         $v0, 0x8006
    lh          $v0, 0x5484($v0)
    .word       0x46003087  # neg.s       $f2, $f6
.L80010154:
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46001082  # mul.s       $f2, $f2, $f0
    swc1        $f2, 0x58($sp)
    addiu       $a0, $sp, 0x40
    addiu       $a1, $sp, 0x50
    sw          $t0, 0xC8($sp)
    sw          $t3, 0xD4($sp)
    sw          $t5, 0xDC($sp)
    sw          $t6, 0xE0($sp)
    sw          $t7, 0xE4($sp)
    sw          $t8, 0xE8($sp)
    jal         func_80010AB4
    sw          $t9, 0xEC($sp)
    lwc1        $f4, 0x48($sp)
    lwc1        $f8, 0x40($sp)
    lw          $t1, 0x44($sp)
    lw          $t0, 0xC8($sp)
    lw          $t3, 0xD4($sp)
    lw          $t5, 0xDC($sp)
    lw          $t6, 0xE0($sp)
    lw          $t7, 0xE4($sp)
    lw          $t8, 0xE8($sp)
    lw          $t9, 0xEC($sp)
    .word       0x4497E000  # mtc1        $s7, $f28
    .word       0x4496E800  # mtc1        $s6, $f29
    .word       0x46002021  # cvt.d.s     $f0, $f4
    .word       0x463C003C  # c.lt.d      $f0, $f28
    addiu       $a0, $zero, 0x1
    .word       0x45000002  # bc1f        . + 4 + (0x2 << 2)
    sw          $v0, 0x3C($sp)
    addu        $a0, $zero, $zero
.L800101D4:
    .word       0x4497F000  # mtc1        $s7, $f30
    .word       0x4496F800  # mtc1        $s6, $f31
    .word       0x460040A1  # cvt.d.s     $f2, $f8
    .word       0x463E103C  # c.lt.d      $f2, $f30
    nop
    .word       0x45030008  # bc1tl       . + 4 + (0x8 << 2)
    addu        $a0, $zero, $zero
    lui         $at, 0x8000
    lwc1        $f1, 0x7D8($at)
    lwc1        $f0, 0x7DC($at)
    .word       0x4622003E  # c.le.d      $f0, $f2
    nop
    .word       0x45030001  # bc1tl       . + 4 + (0x1 << 2)
    addu        $a0, $zero, $zero
.L8001020C:
    .word       0x4489E000  # mtc1        $t1, $f28
    .word       0x4497F000  # mtc1        $s7, $f30
    .word       0x4496F800  # mtc1        $s6, $f31
    .word       0x4600E0A1  # cvt.d.s     $f2, $f28
    .word       0x463E103C  # c.lt.d      $f2, $f30
    nop
    .word       0x45030008  # bc1tl       . + 4 + (0x8 << 2)
    addu        $a0, $zero, $zero
    lui         $at, 0x8000
    lwc1        $f1, 0x7E0($at)
    lwc1        $f0, 0x7E4($at)
    .word       0x4622003E  # c.le.d      $f0, $f2
    nop
    .word       0x45030001  # bc1tl       . + 4 + (0x1 << 2)
    addu        $a0, $zero, $zero
.L80010248:
    lui         $at, 0x8000
    lwc1        $f3, 0x7E8($at)
    lwc1        $f2, 0x7EC($at)
    .word       0x46002021  # cvt.d.s     $f0, $f4
    .word       0x46201083  # div.d       $f2, $f2, $f0
    lui         $at, 0x8000
    lwc1        $f5, 0x7F0($at)
    lwc1        $f4, 0x7F4($at)
    .word       0x462011A0  # cvt.s.d     $f6, $f2
    .word       0x46003021  # cvt.d.s     $f0, $f6
    .word       0x4620203C  # c.lt.d      $f4, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    addiu       $t2, $zero, 0x1
    lui         $at, 0x8000
    lwc1        $f6, 0x7F8($at)
.L80010288:
    bne         $t0, $t2, .L800102E0
    addiu       $v0, $zero, 0x2
    lhu         $t4, 0x76($sp)
    lui         $v0, 0x8006
    lw          $v0, 0x545C($v0)
    sll         $v1, $t4, 16
    sra         $v1, $v1, 15
    addu        $v1, $v1, $v0
    lh          $v0, 0x0($v1)
    slti        $v0, $v0, 0x7
    bnez        $v0, .L800102E0
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8000
    lwc1        $f3, 0x7FC($at)
    lwc1        $f2, 0x800($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    .word       0x4620103C  # c.lt.d      $f2, $f0
    nop
    .word       0x45000003  # bc1f        . + 4 + (0x3 << 2)
    nop
    lui         $at, 0x8000
    lwc1        $f6, 0x804($at)
.L800102E0:
    bne         $t0, $v0, .L80010304
    nop
    lui         $at, 0x8000
    lwc1        $f18, 0x808($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x80C($at)
    .word       0x46009306  # mov.s       $f12, $f18
    j .L80010324
    .word       0x4600A406  # mov.s       $f16, $f20
.L80010304:
    lui         $at, 0x8000
    lwc1        $f12, 0x810($at)
    lui         $at, 0x8000
    lwc1        $f18, 0x814($at)
    lui         $at, 0x8000
    lwc1        $f16, 0x818($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x81C($at)
.L80010324:
    addiu       $t2, $zero, 0x1
    bne         $t0, $t2, .L80010414
    addu        $v0, $a0, $zero
    lhu         $t4, 0x76($sp)
    lui         $v0, 0x8006
    lw          $v0, 0x545C($v0)
    sll         $v1, $t4, 16
    sra         $v1, $v1, 15
    addu        $v1, $v1, $v0
    lh          $v0, 0x0($v1)
    addu        $v1, $v0, $zero
    slti        $v0, $v0, 0x8
    beqz        $v0, .L80010410
    addiu       $v0, $v1, -0x5
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80010398
    addiu       $v0, $v1, -0x3
    lui         $at, 0x8000
    lwc1        $f12, 0x820($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f18, 0x824($at)
    lui         $at, 0x8000
    lwc1        $f16, 0x828($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x82C($at)
    j .L8001040C
    .word       0x46200000  # add.d       $f0, $f0, $f0
.L80010398:
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800103D4
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8000
    lwc1        $f12, 0x830($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    lui         $at, 0x8000
    lwc1        $f18, 0x834($at)
    lui         $at, 0x8000
    lwc1        $f16, 0x838($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x83C($at)
    j .L8001040C
    .word       0x46200000  # add.d       $f0, $f0, $f0
.L800103D4:
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80010414
    addu        $v0, $a0, $zero
    lui         $at, 0x8000
    lwc1        $f12, 0x840($at)
    .word       0x46003021  # cvt.d.s     $f0, $f6
    .word       0x46200000  # add.d       $f0, $f0, $f0
    lui         $at, 0x8000
    lwc1        $f18, 0x844($at)
    lui         $at, 0x8000
    lwc1        $f16, 0x848($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x84C($at)
.L8001040C:
    .word       0x462001A0  # cvt.s.d     $f6, $f0
.L80010410:
    addu        $v0, $a0, $zero
.L80010414:
    beqz        $v0, .L800108B4
    nop
    lui         $at, 0x8000
    lwc1        $f31, 0x850($at)
    lwc1        $f30, 0x854($at)
    .word       0x46003721  # cvt.d.s     $f28, $f6
    .word       0x463EE382  # mul.d       $f14, $f28, $f30
    .word       0x46004021  # cvt.d.s     $f0, $f8
    .word       0x462E0080  # add.d       $f2, $f0, $f14
    .word       0x4411E000  # mfc1        $s1, $f28
    .word       0x4410E800  # mfc1        $s0, $f29
    .word       0x462E0001  # sub.d       $f0, $f0, $f14
    .word       0x4497E000  # mtc1        $s7, $f28
    .word       0x4496E800  # mtc1        $s6, $f29
    .word       0x462011A0  # cvt.s.d     $f6, $f2
    .word       0x460030A1  # cvt.d.s     $f2, $f6
    .word       0x463C103C  # c.lt.d      $f2, $f28
    nop
    .word       0x45010138  # bc1t        . + 4 + (0x138 << 2)
    .word       0x46200220  # cvt.s.d     $f8, $f0
    .word       0x46004021  # cvt.d.s     $f0, $f8
    .word       0x463C003C  # c.lt.d      $f0, $f28
    nop
    .word       0x45000008  # bc1f        . + 4 + (0x8 << 2)
    nop
    .word       0x46083081  # sub.s       $f2, $f6, $f8
    .word       0x46004007  # neg.s       $f0, $f8
    .word       0x46020003  # div.s       $f0, $f0, $f2
    .word       0x460C8281  # sub.s       $f10, $f16, $f12
    .word       0x460A0002  # mul.s       $f0, $f0, $f10
    .word       0x44804000  # mtc1        $zero, $f8
    .word       0x460C0300  # add.s       $f12, $f0, $f12
.L80010494:
    .word       0x4600300D  # trunc.w.s   $f0, $f6
    .word       0x44060000  # mfc1        $a2, $f0
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003001  # sub.s       $f0, $f6, $f0
    .word       0x4600408D  # trunc.w.s   $f2, $f8
    .word       0x44051000  # mfc1        $a1, $f2
    lui         $at, 0x8000
    lwc1        $f24, 0x858($at)
    sll         $a0, $a1, 16
    .word       0x460C8281  # sub.s       $f10, $f16, $f12
    sra         $a0, $a0, 16
    .word       0x46180002  # mul.s       $f0, $f0, $f24
    .word       0x44842000  # mtc1        $a0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x46044101  # sub.s       $f4, $f8, $f4
    .word       0x46083181  # sub.s       $f6, $f6, $f8
    .word       0x46182102  # mul.s       $f4, $f4, $f24
    .word       0x4600C001  # sub.s       $f0, $f24, $f0
    .word       0x46065183  # div.s       $f6, $f10, $f6
    lui         $at, 0x8000
    lwc1        $f27, 0x85C($at)
    lwc1        $f26, 0x860($at)
    .word       0x4604C101  # sub.s       $f4, $f24, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x463A1082  # mul.d       $f2, $f2, $f26
    .word       0x4600200D  # trunc.w.s   $f0, $f4
    .word       0x44020000  # mfc1        $v0, $f0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x463A0002  # mul.d       $f0, $f0, $f26
    lui         $at, 0x8000
    lwc1        $f23, 0x864($at)
    lwc1        $f22, 0x868($at)
    .word       0x4622B081  # sub.d       $f2, $f22, $f2
    .word       0x460031A1  # cvt.d.s     $f6, $f6
    .word       0x46261082  # mul.d       $f2, $f2, $f6
    .word       0x4620B001  # sub.d       $f0, $f22, $f0
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    .word       0x46008121  # cvt.d.s     $f4, $f16
    .word       0x46222101  # sub.d       $f4, $f4, $f2
    lui         $s3, 0x88E3
    ori         $s3, $s3, 0x68F1
    lui         $s2, 0x3EE4
    ori         $s2, $s2, 0xF8B5
    .word       0x460060A1  # cvt.d.s     $f2, $f12
    .word       0x46201081  # sub.d       $f2, $f2, $f0
    subu        $v1, $v1, $a0
    .word       0x4493F000  # mtc1        $s3, $f30
    .word       0x4492F800  # mtc1        $s2, $f31
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x463E0000  # add.d       $f0, $f0, $f30
    .word       0x46202420  # cvt.s.d     $f16, $f4
    .word       0x46201320  # cvt.s.d     $f12, $f2
    .word       0x460C8281  # sub.s       $f10, $f16, $f12
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x46005003  # div.s       $f0, $f10, $f0
    lui         $at, 0x8000
    lwc1        $f29, 0x86C($at)
    lwc1        $f28, 0x870($at)
    .word       0x4489F000  # mtc1        $t1, $f30
    .word       0x46006121  # cvt.d.s     $f4, $f12
    .word       0x463C2102  # mul.d       $f4, $f4, $f28
    .word       0x4600F221  # cvt.d.s     $f8, $f30
    .word       0x462E4181  # sub.d       $f6, $f8, $f14
    lui         $at, 0x8000
    lwc1        $f13, 0x874($at)
    lwc1        $f12, 0x878($at)
    .word       0x462E4080  # add.d       $f2, $f8, $f14
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462C0002  # mul.d       $f0, $f0, $f12
    sll         $fp, $a2, 2
    sll         $t1, $a1, 2
    .word       0x462032A0  # cvt.s.d     $f10, $f6
    .word       0x462011A0  # cvt.s.d     $f6, $f2
    .word       0x4620208D  # trunc.w.d   $f2, $f4
    .word       0x440A1000  # mfc1        $t2, $f2
    sh          $t2, 0xF6($sp)
    addiu       $t2, $zero, 0x1
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x440C1000  # mfc1        $t4, $f2
    bne         $t0, $t2, .L80010638
    sh          $t4, 0xFE($sp)
    lui         $at, 0x8000
    lwc1        $f1, 0x87C($at)
    lwc1        $f0, 0x880($at)
    .word       0x4491E000  # mtc1        $s1, $f28
    .word       0x4490E800  # mtc1        $s0, $f29
    .word       0x4620E002  # mul.d       $f0, $f28, $f0
    .word       0x46204081  # sub.d       $f2, $f8, $f0
    .word       0x46204000  # add.d       $f0, $f8, $f0
    .word       0x462012A0  # cvt.s.d     $f10, $f2
    .word       0x462001A0  # cvt.s.d     $f6, $f0
.L80010638:
    .word       0x4497F000  # mtc1        $s7, $f30
    .word       0x4496F800  # mtc1        $s6, $f31
    .word       0x46003021  # cvt.d.s     $f0, $f6
    .word       0x463E003C  # c.lt.d      $f0, $f30
    nop
    .word       0x450100BC  # bc1t        . + 4 + (0xBC << 2)
    nop
    .word       0x46005021  # cvt.d.s     $f0, $f10
    .word       0x463E003C  # c.lt.d      $f0, $f30
    nop
    .word       0x45000008  # bc1f        . + 4 + (0x8 << 2)
    nop
    .word       0x460A3081  # sub.s       $f2, $f6, $f10
    .word       0x46005007  # neg.s       $f0, $f10
    .word       0x46020003  # div.s       $f0, $f0, $f2
    .word       0x4612A201  # sub.s       $f8, $f20, $f18
    .word       0x46080002  # mul.s       $f0, $f0, $f8
    .word       0x44805000  # mtc1        $zero, $f10
    .word       0x46120480  # add.s       $f18, $f0, $f18
.L80010684:
    .word       0x4600300D  # trunc.w.s   $f0, $f6
    .word       0x44060000  # mfc1        $a2, $f0
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46003001  # sub.s       $f0, $f6, $f0
    .word       0x4600508D  # trunc.w.s   $f2, $f10
    .word       0x44051000  # mfc1        $a1, $f2
    sll         $a0, $a1, 16
    .word       0x4612A201  # sub.s       $f8, $f20, $f18
    sra         $a0, $a0, 16
    .word       0x46180002  # mul.s       $f0, $f0, $f24
    .word       0x44842000  # mtc1        $a0, $f4
    .word       0x46802120  # cvt.s.w     $f4, $f4
    .word       0x46045101  # sub.s       $f4, $f10, $f4
    .word       0x460A3181  # sub.s       $f6, $f6, $f10
    .word       0x46182102  # mul.s       $f4, $f4, $f24
    .word       0x4600C001  # sub.s       $f0, $f24, $f0
    .word       0x46064183  # div.s       $f6, $f8, $f6
    .word       0x4604C101  # sub.s       $f4, $f24, $f4
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x463A1082  # mul.d       $f2, $f2, $f26
    .word       0x4600200D  # trunc.w.s   $f0, $f4
    .word       0x44020000  # mfc1        $v0, $f0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x463A0002  # mul.d       $f0, $f0, $f26
    .word       0x4622B081  # sub.d       $f2, $f22, $f2
    .word       0x460031A1  # cvt.d.s     $f6, $f6
    .word       0x46261082  # mul.d       $f2, $f2, $f6
    .word       0x4620B001  # sub.d       $f0, $f22, $f0
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    .word       0x4600A121  # cvt.d.s     $f4, $f20
    .word       0x46222101  # sub.d       $f4, $f4, $f2
    .word       0x460090A1  # cvt.d.s     $f2, $f18
    .word       0x46201081  # sub.d       $f2, $f2, $f0
    subu        $v1, $v1, $a0
    .word       0x4493E000  # mtc1        $s3, $f28
    .word       0x4492E800  # mtc1        $s2, $f29
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x463C0000  # add.d       $f0, $f0, $f28
    .word       0x46202520  # cvt.s.d     $f20, $f4
    .word       0x462014A0  # cvt.s.d     $f18, $f2
    .word       0x4612A201  # sub.s       $f8, $f20, $f18
    .word       0x46200020  # cvt.s.d     $f0, $f0
    .word       0x46004003  # div.s       $f0, $f8, $f0
    lui         $at, 0x8000
    lwc1        $f31, 0x884($at)
    lwc1        $f30, 0x888($at)
    .word       0x460090A1  # cvt.d.s     $f2, $f18
    .word       0x463E1082  # mul.d       $f2, $f2, $f30
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x462C0002  # mul.d       $f0, $f0, $f12
    lwc1        $f6, 0x4C($sp)
    lui         $at, 0x8000
    lwc1        $f8, 0x88C($at)
    sll         $s1, $a1, 2
    .word       0x4606403E  # c.le.s      $f8, $f6
    .word       0x4620110D  # trunc.w.d   $f4, $f2
    .word       0x44122000  # mfc1        $s2, $f4
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44131000  # mfc1        $s3, $f2
    .word       0x45010005  # bc1t        . + 4 + (0x5 << 2)
    sll         $s0, $a2, 2
    .word       0x4600300D  # trunc.w.s   $f0, $f6
    .word       0x44040000  # mfc1        $a0, $f0
    j .L800107D8
    andi        $a0, $a0, 0xFFFF
.L800107C0:
    .word       0x46083001  # sub.s       $f0, $f6, $f8
    .word       0x4600008D  # trunc.w.s   $f2, $f0
    .word       0x44041000  # mfc1        $a0, $f2
    lui         $v0, 0x8000
    or          $a0, $a0, $v0
    andi        $a0, $a0, 0xFFFF
.L800107D8:
    addu        $a1, $zero, $zero
    sw          $t0, 0xC8($sp)
    sw          $t1, 0xCC($sp)
    sw          $t3, 0xD4($sp)
    sw          $t5, 0xDC($sp)
    sw          $t6, 0xE0($sp)
    sw          $t7, 0xE4($sp)
    sw          $t8, 0xE8($sp)
    jal         func_8000A5D4
    sw          $t9, 0xEC($sp)
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $a0, $fp, 0xFFC
    sll         $a0, $a0, 12
    andi        $v1, $s0, 0xFFC
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE400
    or          $v1, $v1, $v0
    or          $a0, $a0, $v1
    sw          $a0, 0x0($a1)
    lw          $t1, 0xCC($sp)
    andi        $v1, $s1, 0xFFC
    andi        $v0, $t1, 0xFFC
    sll         $v0, $v0, 12
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a1)
    lhu         $t2, 0xF6($sp)
    andi        $v0, $s2, 0xFFFF
    sll         $v1, $t2, 16
    or          $v1, $v1, $v0
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v1, 0xC($a1)
    sw          $v0, 0x10($a1)
    lhu         $t4, 0xFE($sp)
    andi        $v0, $s3, 0xFFFF
    sll         $v1, $t4, 16
    or          $v1, $v1, $v0
    sw          $v1, 0x14($a1)
    lw          $t9, 0xEC($sp)
    lw          $t8, 0xE8($sp)
    lw          $t7, 0xE4($sp)
    lw          $t6, 0xE0($sp)
    lw          $t5, 0xDC($sp)
    lw          $t3, 0xD4($sp)
    lw          $t0, 0xC8($sp)
.L800108B4:
    lhu         $t2, 0x6E($sp)
    addiu       $v0, $t2, 0x1
    sh          $v0, 0x6E($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x9
    bnez        $v0, .L8000FF5C
    nop
.L800108D4:
    lhu         $t4, 0x66($sp)
    addiu       $v0, $t4, 0x1
    sh          $v0, 0x66($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x20
    bnez        $v0, .L8000FEF8
    addiu       $v0, $t3, 0x1
    addu        $t3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x20
    beqz        $v0, .L80010940
    nop
    j .L8000FED8
    nop
.L80010914:
    lbu         $v0, 0x8($s2)
    bnez        $v0, .L80010940
    nop
    lui         $v0, 0x8006
    lhu         $v0, 0x4A48($v0)
    lui         $at, 0x8006
    sh          $v0, 0x5480($at)
    bnez        $v0, .L80010940
    addu        $a1, $s2, $zero
    jal         func_80010C78
    addu        $a2, $zero, $zero
.L80010940:
    lw          $ra, 0x124($sp)
    lw          $fp, 0x120($sp)
    lw          $s7, 0x11C($sp)
    lw          $s6, 0x118($sp)
    lw          $s5, 0x114($sp)
    lw          $s4, 0x110($sp)
    lw          $s3, 0x10C($sp)
    lw          $s2, 0x108($sp)
    lw          $s1, 0x104($sp)
    lw          $s0, 0x100($sp)
    lwc1        $f31, 0x150($sp)
    lwc1        $f30, 0x154($sp)
    lwc1        $f29, 0x148($sp)
    lwc1        $f28, 0x14C($sp)
    lwc1        $f27, 0x140($sp)
    lwc1        $f26, 0x144($sp)
    lwc1        $f25, 0x138($sp)
    lwc1        $f24, 0x13C($sp)
    lwc1        $f23, 0x130($sp)
    lwc1        $f22, 0x134($sp)
    lwc1        $f21, 0x128($sp)
    lwc1        $f20, 0x12C($sp)
    addiu       $sp, $sp, 0x158
    jr          $ra
    nop
.end display_object_process

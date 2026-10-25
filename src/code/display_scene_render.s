.text
.align 2
.set noreorder
.globl display_scene_render
.ent display_scene_render
display_scene_render:
    addiu       $sp, $sp, -0x58
    sw          $s0, 0x30($sp)
    lui         $s0, 0x8006
    lhu         $s0, 0x4A4E($s0)
    sw          $s1, 0x34($sp)
    sw          $ra, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    swc1        $f23, 0x50($sp)
    swc1        $f22, 0x54($sp)
    swc1        $f21, 0x48($sp)
    swc1        $f20, 0x4C($sp)
    slti        $v0, $s0, 0x12C
    beqz        $v0, .L80010CB8
    addu        $s1, $a1, $zero
    addiu       $s0, $zero, 0x12C
.L80010CB8:
    slti        $v0, $s0, 0x2BD
    beql        $v0, $zero, .L80010CC4
    addiu       $s0, $zero, 0x2BC
.L80010CC4:
    lui         $a0, 0x8006
    lhu         $a0, 0x4A4C($a0)
    addiu       $a0, $a0, 0xC00
    andi        $a0, $a0, 0xFFF
    lui         $at, 0x8009
    sh          $a0, -0x6AA4($at)
    jal         func_8002E828
    nop
    lui         $at, 0x8006
    lwc1        $f2, 0x5464($at)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    .word       0x46020002  # mul.s       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f23, 0x8CC($at)
    lwc1        $f22, 0x8D0($at)
    .word       0x46000021  # cvt.d.s     $f0, $f0
    .word       0x46360002  # mul.d       $f0, $f0, $f22
    .word       0x4490A000  # mtc1        $s0, $f20
    .word       0x4680A520  # cvt.s.w     $f20, $f20
    .word       0x4600A521  # cvt.d.s     $f20, $f20
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    lui         $a0, 0x8009
    lh          $a0, -0x6AA4($a0)
    .word       0x46200020  # cvt.s.d     $f0, $f0
    lui         $at, 0x8008
    swc1        $f0, 0x7924($at)
    jal         func_8002E848
    nop
    lui         $at, 0x8006
    lwc1        $f0, 0x5464($at)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A0  # cvt.s.w     $f2, $f2
    .word       0x46001082  # mul.s       $f2, $f2, $f0
    lui         $at, 0x8008
    lwc1        $f4, 0x7924($at)
    lui         $at, 0x8000
    lwc1        $f7, 0x8D4($at)
    lwc1        $f6, 0x8D8($at)
    .word       0x46002121  # cvt.d.s     $f4, $f4
    .word       0x46262102  # mul.d       $f4, $f4, $f6
    .word       0x460010A1  # cvt.d.s     $f2, $f2
    .word       0x46361082  # mul.d       $f2, $f2, $f22
    nop
    .word       0x4624A102  # mul.d       $f4, $f20, $f4
    nop
    .word       0x46341082  # mul.d       $f2, $f2, $f20
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46202102  # mul.d       $f4, $f4, $f0
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    .word       0x46001021  # cvt.d.s     $f0, $f2
    .word       0x46260002  # mul.d       $f0, $f0, $f6
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $a1, 0x8006
    lw          $a1, 0x548C($a1)
    .word       0x4620A502  # mul.d       $f20, $f20, $f0
    lui         $at, 0x8008
    swc1        $f2, 0x7930($at)
    .word       0x4620200D  # trunc.w.d   $f0, $f4
    .word       0x44020000  # mfc1        $v0, $f0
    .word       0x44830000  # mtc1        $v1, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    lui         $v1, 0x8006
    lw          $v1, 0x5490($v1)
    lui         $a0, 0x8006
    lw          $a0, 0x5488($a0)
    sll         $v0, $v0, 16
    .word       0x4620A502  # mul.d       $f20, $f20, $f0
    sra         $v0, $v0, 16
    lui         $at, 0x8006
    sw          $v0, 0x5498($at)
    addu        $v1, $v1, $v0
    addu        $a2, $a0, $v0
    lui         $at, 0x8006
    sw          $v1, 0x5490($at)
    slti        $v1, $v1, 0x4000
    lui         $at, 0x8006
    sw          $a2, 0x5488($at)
    .word       0x4620A00D  # trunc.w.d   $f0, $f20
    .word       0x44020000  # mfc1        $v0, $f0
    sll         $v0, $v0, 16
    lui         $a0, 0x8006
    lw          $a0, 0x5494($a0)
    sra         $v0, $v0, 16
    negu        $v0, $v0
    addu        $a1, $a1, $v0
    lui         $at, 0x8006
    sw          $v0, 0x549C($at)
    lui         $at, 0x8006
    sw          $a1, 0x548C($at)
    addu        $a0, $a0, $v0
    lui         $at, 0x8006
    sw          $a0, 0x5494($at)
    bnez        $v1, .L80010E58
    slti        $v0, $a0, 0x4000
    lui         $at, 0x8006
    sw          $zero, 0x5490($at)
.L80010E58:
    bnez        $v0, .L80010E68
    addiu       $v1, $zero, 0x7FFF
    lui         $at, 0x8006
    sw          $zero, 0x5494($at)
.L80010E68:
    slt         $v0, $v1, $a2
    beqz        $v0, .L80010E7C
    addiu       $v0, $zero, 0x4000
    lui         $at, 0x8006
    sw          $v0, 0x5488($at)
.L80010E7C:
    slt         $v0, $v1, $a1
    beqz        $v0, .L80010E90
    addiu       $v0, $zero, 0x4000
    lui         $at, 0x8006
    sw          $v0, 0x548C($at)
.L80010E90:
    lui         $v0, 0x8006
    lw          $v0, 0x5490($v0)
    slti        $v0, $v0, -0x3FFF
    beqz        $v0, .L80010EAC
    nop
    lui         $at, 0x8006
    sw          $zero, 0x5490($at)
.L80010EAC:
    lui         $v0, 0x8006
    lw          $v0, 0x5494($v0)
    slti        $v0, $v0, -0x3FFF
    beqz        $v0, .L80010EC8
    nop
    lui         $at, 0x8006
    sw          $zero, 0x5494($at)
.L80010EC8:
    lui         $v0, 0x8006
    lw          $v0, 0x5488($v0)
    bgez        $v0, .L80010EE0
    addiu       $v0, $zero, 0x3FFF
    lui         $at, 0x8006
    sw          $v0, 0x5488($at)
.L80010EE0:
    lui         $v0, 0x8006
    lw          $v0, 0x548C($v0)
    bgez        $v0, .L80010EF8
    addiu       $v0, $zero, 0x3FFF
    lui         $at, 0x8006
    sw          $v0, 0x548C($at)
.L80010EF8:
    lui         $s0, 0x8006
    lw          $s0, 0x5460($s0)
    lui         $v1, 0x8006
    lw          $v1, 0x5490($v1)
    lui         $v0, 0x8006
    lw          $v0, 0x5494($v0)
    lui         $a1, 0x8006
    lw          $a1, 0x5488($a1)
    lui         $a2, 0x8006
    lw          $a2, 0x548C($a2)
    sh          $v1, 0x8($s0)
    sh          $v0, 0xA($s0)
    sh          $a1, 0x18($s0)
    sh          $v0, 0x1A($s0)
    sh          $v1, 0x28($s0)
    sh          $a2, 0x2A($s0)
    sh          $a1, 0x38($s0)
    sh          $a2, 0x3A($s0)
    sh          $v1, 0x48($s0)
    sh          $v0, 0x4A($s0)
    sh          $a1, 0x58($s0)
    sh          $v0, 0x5A($s0)
    sh          $v1, 0x68($s0)
    sh          $a2, 0x6A($s0)
    sh          $a1, 0x78($s0)
    sh          $a2, 0x7A($s0)
    sh          $v1, 0x88($s0)
    sh          $v0, 0x8A($s0)
    sh          $a1, 0x98($s0)
    sh          $v0, 0x9A($s0)
    sh          $v1, 0xA8($s0)
    sh          $a2, 0xAA($s0)
    sh          $a1, 0xB8($s0)
    sh          $a2, 0xBA($s0)
    sh          $v1, 0xC8($s0)
    sh          $v0, 0xCA($s0)
    sh          $a1, 0xD8($s0)
    sh          $v0, 0xDA($s0)
    sh          $v1, 0xE8($s0)
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    sh          $a2, 0xEA($s0)
    sh          $a1, 0xF8($s0)
    jal         func_8000C790
    sh          $a2, 0xFA($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0x10
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFC
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xF838
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A22C
    sw          $a1, 0x4($v1)
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_80009E58
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $s3, $zero, 0x1
    jal         func_8000B1D8
    sw          $s3, 0x10($sp)
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lw          $a1, 0xC($s1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x6
    sw          $zero, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $zero, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $v0, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    lw          $a0, 0x10($s1)
    addiu       $a1, $zero, 0x2
    addiu       $a2, $zero, 0x40
    jal         func_8000979C
    addiu       $a3, $zero, 0x40
    lui         $a0, 0x3
    jal         func_8000B008
    ori         $a0, $a0, 0x2205
    lui         $a0, 0x1
    jal         func_8000AFA8
    ori         $a0, $a0, 0x204
    lui         $a0, 0xC800
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x2048
    addiu       $a0, $zero, 0x3C0
    jal         func_8000AECC
    addiu       $a1, $zero, 0x3DE
    addiu       $s2, $zero, 0x2
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L80011100
    addiu       $s1, $zero, 0x4
    addiu       $a0, $zero, 0xFF
    addiu       $a1, $zero, 0xFF
    j .L8001113C
    addiu       $a2, $zero, 0xFF
.L80011100:
    bne         $v1, $s3, .L80011114
    addiu       $a0, $zero, 0x20
    addiu       $a1, $zero, 0x20
    j .L8001113C
    addiu       $a2, $zero, 0x20
.L80011114:
    beq         $v1, $s2, .L80011134
    addiu       $a0, $zero, 0x62
    bne         $v1, $s1, .L80011138
    addiu       $a1, $zero, 0x7F
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    j .L8001113C
    addu        $a2, $zero, $zero
.L80011134:
    addiu       $a1, $zero, 0x7F
.L80011138:
    addiu       $a2, $zero, 0xD6
.L8001113C:
    jal         func_8000A08C
    addu        $a3, $zero, $zero
    lui         $a0, 0x400
    ori         $a0, $a0, 0x40FF
    lui         $t1, 0xB100
    ori         $t1, $t1, 0x402
    lui         $a2, 0x2
    ori         $a2, $a2, 0x406
    lui         $t2, 0xB108
    ori         $t2, $t2, 0xC0A
    lui         $a3, 0xA
    ori         $a3, $a3, 0xC0E
    lui         $t3, 0xB110
    ori         $t3, $t3, 0x1412
    lui         $t0, 0x12
    ori         $t0, $t0, 0x1416
    lui         $t4, 0xB118
    ori         $t4, $t4, 0x1C1A
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    lui         $a1, 0x1A
    ori         $a1, $a1, 0x1C1E
    addiu       $v1, $v0, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x10
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x18
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x20
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x28
    sw          $a0, 0x0($v0)
    sw          $s0, 0x4($v0)
    sw          $t1, 0x8($v0)
    sw          $a2, 0xC($v0)
    sw          $t2, 0x10($v0)
    sw          $a3, 0x14($v0)
    sw          $t3, 0x18($v0)
    sw          $t0, 0x1C($v0)
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    sw          $t4, 0x20($v0)
    sw          $a1, 0x24($v0)
    lw          $ra, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    lwc1        $f23, 0x50($sp)
    lwc1        $f22, 0x54($sp)
    lwc1        $f21, 0x48($sp)
    lwc1        $f20, 0x4C($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end display_scene_render

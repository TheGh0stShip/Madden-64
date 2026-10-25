.text
.align 2
.set noreorder
.globl render_command_dispatch
.ent render_command_dispatch
render_command_dispatch:
    lui         $v0, 0x8006
    lw          $v0, 0x5508($v0)
    addiu       $sp, $sp, -0x68
    sw          $s5, 0x5C($sp)
    sw          $ra, 0x60($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8006
    sw          $v0, 0x5508($at)
    slti        $v0, $v0, 0x21
    bnez        $v0, .L80011BB4
    addu        $s5, $zero, $zero
    jal         func_80011488
    nop
    lui         $at, 0x8006
    sh          $zero, 0x5504($at)
.L80011BB4:
    lui         $v0, 0x8006
    lh          $v0, 0x5504($v0)
    beqz        $v0, .L8001278C
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C790
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFC
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xF279
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A404
    sw          $a1, 0x4($v1)
    lui         $a0, 0x2
    jal         func_8000AFA8
    ori         $a0, $a0, 0x2205
    lui         $a0, 0xC08
    ori         $a0, $a0, 0x4000
    lui         $a1, 0x302
    jal         func_8000A63C
    ori         $a1, $a1, 0x4000
    jal         func_8000A22C
    addiu       $a0, $zero, 0xC0
    lui         $v1, 0x8008
    lw          $v1, 0x6DD8($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    bne         $v1, $v0, .L80011CA8
    addiu       $a0, $zero, 0x2000
    lui         $v0, 0x8006
    lw          $v0, 0x5508($v0)
    slti        $v0, $v0, 0x4
    bnel        $v0, $zero, .L80011CA8
    addu        $a0, $zero, $zero
.L80011CA8:
    jal         func_8000A8B8
    nop
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
    lui         $v1, 0x8006
    lh          $v1, 0x5520($v1)
    lui         $t1, 0x7
    bnez        $v1, .L80011D98
    ori         $t1, $t1, 0xA120
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    lui         $v1, 0x8006
    lhu         $v1, 0x550E($v1)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $t0, 0x8009
    lhu         $t0, -0x5A4C($t0)
    lui         $a3, 0x8009
    lhu         $a3, -0x5A4C($a3)
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    sll         $v0, $a0, 4
    .word       0x00E90018  # mult        $a3, $t1
    .word       0x00003812  # mflo        $a3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    lui         $at, 0x8006
    sh          $v1, 0x550E($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5510($v1)
    sll         $v0, $v0, 3
    lui         $a0, 0x8006
    lw          $a0, 0x5514($a0)
    lui         $a1, 0x8006
    lw          $a1, 0x5518($a1)
    .word       0x00C90018  # mult        $a2, $t1
    .word       0x00003012  # mflo        $a2
    subu        $v1, $v1, $v0
    sll         $v0, $t0, 2
    lui         $at, 0x8006
    sh          $v1, 0x5510($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5512($v1)
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x5512($at)
    j .L8001206C
    addu        $a0, $a0, $a3
.L80011D98:
    addiu       $v0, $zero, 0x1
    bnel        $v1, $v0, .L80011E3C
    addiu       $v0, $zero, 0x2
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    lui         $v1, 0x8006
    lhu         $v1, 0x550E($v1)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $t0, 0x8009
    lhu         $t0, -0x5A4C($t0)
    lui         $a3, 0x8009
    lhu         $a3, -0x5A4C($a3)
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    sll         $v0, $a0, 4
    .word       0x00E90018  # mult        $a3, $t1
    .word       0x00003812  # mflo        $a3
    subu        $v0, $v0, $a0
    subu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    lui         $at, 0x8006
    sh          $v1, 0x550E($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5510($v1)
    sll         $v0, $v0, 3
    lui         $a0, 0x8006
    lw          $a0, 0x5514($a0)
    lui         $a1, 0x8006
    lw          $a1, 0x5518($a1)
    .word       0x00C90018  # mult        $a2, $t1
    .word       0x00003012  # mflo        $a2
    addu        $v1, $v1, $v0
    sll         $v0, $t0, 2
    lui         $at, 0x8006
    sh          $v1, 0x5510($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5512($v1)
    j .L80012058
    addu        $v0, $v0, $t0
.L80011E3C:
    bne         $v1, $v0, .L80011F08
    addiu       $v0, $zero, 0x3
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $v1, 0x8006
    lhu         $v1, 0x550E($v1)
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $t0, 0x8009
    lhu         $t0, -0x5A4C($t0)
    lui         $a3, 0x8009
    lhu         $a3, -0x5A4C($a3)
    lui         $a2, 0x8006
    lw          $a2, 0x5518($a2)
    .word       0x01090018  # mult        $t0, $t1
    .word       0x00004012  # mflo        $t0
    sll         $v0, $v0, 4
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    lui         $at, 0x8006
    sh          $v1, 0x550E($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5510($v1)
    addu        $v0, $v0, $a0
    sll         $a0, $a1, 1
    addu        $a0, $a0, $a1
    lui         $a1, 0x8006
    lw          $a1, 0x5514($a1)
    .word       0x00E90018  # mult        $a3, $t1
    .word       0x00003812  # mflo        $a3
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x5510($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5512($v1)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    subu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x5512($at)
    addu        $a1, $a1, $t0
    addu        $a2, $a2, $a3
    lui         $at, 0x8006
    sw          $a1, 0x5514($at)
    lui         $at, 0x8006
    sw          $a2, 0x5518($at)
    j .L80012080
    nop
.L80011F08:
    bne         $v1, $v0, .L80011FC0
    addiu       $v0, $zero, 0x4
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    lui         $v1, 0x8006
    lhu         $v1, 0x550E($v1)
    sll         $a2, $a2, 1
    .word       0x00C90018  # mult        $a2, $t1
    .word       0x00003012  # mflo        $a2
    lui         $a3, 0x8009
    lhu         $a3, -0x5A4C($a3)
    sll         $v0, $v0, 4
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    lui         $at, 0x8006
    sh          $v1, 0x550E($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5510($v1)
    sll         $v0, $v0, 1
    lui         $a0, 0x8006
    lw          $a0, 0x5514($a0)
    .word       0x00E90018  # mult        $a3, $t1
    .word       0x00003812  # mflo        $a3
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    lui         $at, 0x8006
    sh          $v1, 0x5510($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5512($v1)
    lui         $a1, 0x8006
    lw          $a1, 0x5518($a1)
    sll         $v0, $v0, 3
    subu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x5512($at)
    addu        $a0, $a0, $a2
    j .L80012070
    subu        $a1, $a1, $a3
.L80011FC0:
    bne         $v1, $v0, .L80012080
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a3, 0x8009
    lhu         $a3, -0x5A4C($a3)
    lui         $v1, 0x8006
    lhu         $v1, 0x550E($v1)
    .word       0x00E90018  # mult        $a3, $t1
    .word       0x00003812  # mflo        $a3
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    sll         $v0, $v0, 4
    subu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    addu        $v0, $v0, $a0
    lui         $at, 0x8006
    sh          $v1, 0x550E($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5510($v1)
    sll         $v0, $v0, 1
    lui         $a0, 0x8006
    lw          $a0, 0x5514($a0)
    .word       0x00C90018  # mult        $a2, $t1
    .word       0x00003012  # mflo        $a2
    subu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    lui         $at, 0x8006
    sh          $v1, 0x5510($at)
    lui         $v1, 0x8006
    lhu         $v1, 0x5512($v1)
    lui         $a1, 0x8006
    lw          $a1, 0x5518($a1)
.L80012058:
    sll         $v0, $v0, 3
    subu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x5512($at)
    subu        $a0, $a0, $a3
.L8001206C:
    addu        $a1, $a1, $a2
.L80012070:
    lui         $at, 0x8006
    sw          $a0, 0x5514($at)
    lui         $at, 0x8006
    sw          $a1, 0x5518($at)
.L80012080:
    lui         $v0, 0x8006
    lw          $v0, 0x5508($v0)
    slti        $v0, $v0, 0x5
    beqz        $v0, .L800120BC
    nop
    lui         $at, 0x8006
    sh          $zero, 0x550E($at)
    lui         $at, 0x8006
    sh          $zero, 0x5510($at)
    lui         $at, 0x8006
    sh          $zero, 0x5512($at)
    lui         $at, 0x8006
    sw          $zero, 0x5514($at)
    lui         $at, 0x8006
    sw          $zero, 0x5518($at)
.L800120BC:
    lui         $v0, 0x8006
    lw          $v0, 0x5514($v0)
    lui         $v1, 0x8006
    lw          $v1, 0x5518($v1)
    sw          $v0, 0x30($sp)
    negu        $v0, $v1
    sw          $v0, 0x34($sp)
    lui         $v0, 0x12C
    subu        $v0, $v0, $v1
    jal         func_8002CBD4
    sw          $v0, 0x38($sp)
    jal         func_8002DA14
    addiu       $a0, $sp, 0x30
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x79B8
    sll         $a0, $a0, 6
    jal         func_8002DEF4
    addu        $a0, $a0, $s0
    lui         $a0, 0x8006
    lh          $a0, 0x550E($a0)
    negu        $a0, $a0
    jal         func_8002CD44
    andi        $a0, $a0, 0xFFF
    lui         $a0, 0x8006
    lhu         $a0, 0x5510($a0)
    jal         func_8002CF48
    andi        $a0, $a0, 0xFFF
    lui         $a0, 0x8006
    lh          $a0, 0x5512($a0)
    addiu       $a0, $a0, 0x800
    jal         func_8002D14C
    andi        $a0, $a0, 0xFFF
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    addu        $s2, $zero, $zero
    sll         $a0, $a0, 6
    jal         func_8002DEF4
    addu        $a0, $a0, $s0
    lui         $a1, 0x106
    ori         $a1, $a1, 0x40
    addiu       $a3, $zero, 0x20
    addiu       $t3, $zero, 0xA20
    addiu       $t2, $zero, 0x7A0
    addiu       $a2, $zero, 0x7F
    addiu       $t1, $zero, -0x5A
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    addiu       $t0, $zero, -0x78
    addiu       $v0, $a0, 0x8
    sll         $v1, $v1, 6
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x8
    addiu       $v0, $v0, 0x79B8
    addu        $v1, $v1, $v0
    sw          $a1, 0x0($a0)
    sw          $v1, 0x4($a0)
.L800121B0:
    addu        $s0, $zero, $zero
    addu        $a1, $t0, $zero
    addu        $a0, $t1, $zero
.L800121BC:
    sll         $v0, $s2, 3
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $s1, -0x4860($at)
    sll         $v1, $s0, 2
    addu        $v1, $v1, $s0
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    sll         $v1, $v1, 3
    addiu       $v1, $v1, -0xA0
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addiu       $v0, $v0, -0xA0
    sh          $v1, 0x0($s1)
    sh          $v1, 0x20($s1)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4860
    sh          $v0, 0x10($s1)
    sh          $v0, 0x30($s1)
    slti        $v0, $s0, 0x8
    sh          $a1, 0x2($s1)
    sh          $zero, 0x4($s1)
    sh          $a3, 0x8($s1)
    sh          $a3, 0xA($s1)
    sb          $zero, 0xC($s1)
    sb          $zero, 0xD($s1)
    sb          $a2, 0xE($s1)
    sh          $a1, 0x12($s1)
    sh          $zero, 0x14($s1)
    sh          $t3, 0x18($s1)
    sh          $a3, 0x1A($s1)
    sb          $zero, 0x1C($s1)
    sb          $zero, 0x1D($s1)
    sb          $a2, 0x1E($s1)
    sh          $a0, 0x22($s1)
    sh          $zero, 0x24($s1)
    sh          $a3, 0x28($s1)
    sh          $t2, 0x2A($s1)
    sb          $zero, 0x2C($s1)
    sb          $zero, 0x2D($s1)
    sb          $a2, 0x2E($s1)
    sh          $a0, 0x32($s1)
    sh          $zero, 0x34($s1)
    sh          $t3, 0x38($s1)
    sh          $t2, 0x3A($s1)
    sb          $zero, 0x3C($s1)
    sb          $zero, 0x3D($s1)
    bnez        $v0, .L800121BC
    sb          $a2, 0x3E($s1)
    addiu       $t1, $t1, 0x1E
    addiu       $s2, $s2, 0x1
    slti        $v0, $s2, 0x8
    bnez        $v0, .L800121B0
    addiu       $t0, $t0, 0x1E
    addu        $s2, $zero, $zero
    addu        $s4, $v1, $zero
    addiu       $s3, $zero, 0x2
    addu        $s0, $zero, $zero
.L800122B0:
    sll         $v0, $s2, 3
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v1, $v0, $s4
    lw          $s1, 0x0($v1)
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x54A8($at)
    addiu       $a3, $zero, 0x28
    addiu       $v0, $zero, 0x1E
    addiu       $s0, $s0, 0x1
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $s3, 0x18($sp)
    sw          $s3, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    jal         func_800094D0
    sw          $zero, 0x2C($sp)
    lui         $a0, 0x400
    ori         $a0, $a0, 0x103F
    lui         $a2, 0xB100
    ori         $a2, $a2, 0x402
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a1, 0x4
    ori         $a1, $a1, 0x602
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    slti        $v0, $s0, 0x8
    sw          $a0, 0x0($v1)
    sw          $s1, 0x4($v1)
    sw          $a2, 0x8($v1)
    bnez        $v0, .L800122B0
    sw          $a1, 0xC($v1)
    addiu       $s2, $s2, 0x1
    slti        $v0, $s2, 0x8
    bnel        $v0, $zero, .L800122B0
    addu        $s0, $zero, $zero
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lui         $a1, 0x8008
    lw          $a1, 0x76D8($a1)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    lui         $a0, 0x8006
    lw          $a0, 0x551C($a0)
    addiu       $a2, $zero, 0x80
    addiu       $a3, $zero, 0x20
    addiu       $v0, $zero, 0x2
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    jal         func_8000979C
    sw          $zero, 0x28($sp)
    lui         $s1, 0x8009
    lw          $s1, -0x4760($s1)
    nor         $v0, $zero, $s5
    addiu       $t3, $zero, -0xA0
    addiu       $t1, $zero, -0x78
    addiu       $a2, $zero, -0x1E
    addiu       $a1, $zero, -0x7F
    addiu       $t2, $zero, 0x20
    addiu       $t0, $zero, 0x78
    addiu       $a3, $zero, 0x80
    sh          $t3, 0x0($s1)
    sh          $t1, 0x2($s1)
    sh          $a2, 0x4($s1)
    sb          $a1, 0xC($s1)
    sb          $zero, 0xD($s1)
    sb          $zero, 0xE($s1)
    sh          $zero, 0x8($s1)
    sh          $t2, 0xA($s1)
    sh          $t3, 0x10($s1)
    sh          $t1, 0x12($s1)
    sh          $zero, 0x14($s1)
    sb          $a1, 0x1C($s1)
    sb          $zero, 0x1D($s1)
    sb          $zero, 0x1E($s1)
    sh          $zero, 0x18($s1)
    sh          $zero, 0x1A($s1)
    sh          $t3, 0x20($s1)
    sh          $t0, 0x22($s1)
    sh          $a2, 0x24($s1)
    sb          $a1, 0x2C($s1)
    sb          $zero, 0x2D($s1)
    sb          $zero, 0x2E($s1)
    sh          $a3, 0x28($s1)
    sh          $t2, 0x2A($s1)
    sh          $t3, 0x30($s1)
    sh          $t0, 0x32($s1)
    sh          $zero, 0x34($s1)
    sb          $a1, 0x3C($s1)
    sb          $zero, 0x3D($s1)
    sb          $zero, 0x3E($s1)
    sh          $a3, 0x38($s1)
    sh          $zero, 0x3A($s1)
    addu        $s2, $zero, $zero
    addu        $a0, $s1, $zero
    addiu       $v1, $zero, 0xA0
    addiu       $v0, $zero, 0x7F
    sh          $v1, 0x40($s1)
    sh          $t1, 0x42($s1)
    sh          $zero, 0x44($s1)
    sb          $v0, 0x4C($s1)
    sb          $zero, 0x4D($s1)
    sb          $zero, 0x4E($s1)
    sh          $a3, 0x48($s1)
    sh          $zero, 0x4A($s1)
    sh          $v1, 0x50($s1)
    sh          $t1, 0x52($s1)
    sh          $a2, 0x54($s1)
    sb          $v0, 0x5C($s1)
    sb          $zero, 0x5D($s1)
    sb          $zero, 0x5E($s1)
    sh          $a3, 0x58($s1)
    sh          $t2, 0x5A($s1)
    sh          $v1, 0x60($s1)
    sh          $t0, 0x62($s1)
    sh          $zero, 0x64($s1)
    sb          $v0, 0x6C($s1)
    sb          $zero, 0x6D($s1)
    sb          $zero, 0x6E($s1)
    sh          $zero, 0x68($s1)
    sh          $zero, 0x6A($s1)
    sh          $v1, 0x70($s1)
    sh          $t0, 0x72($s1)
    sh          $a2, 0x74($s1)
    sb          $v0, 0x7C($s1)
    sb          $zero, 0x7D($s1)
    sb          $zero, 0x7E($s1)
    sh          $zero, 0x78($s1)
    sh          $t2, 0x7A($s1)
    sh          $t3, 0x80($s1)
    sh          $t1, 0x82($s1)
    sh          $zero, 0x84($s1)
    sb          $zero, 0x8C($s1)
    sb          $a1, 0x8D($s1)
    sb          $zero, 0x8E($s1)
    sh          $zero, 0x88($s1)
    sh          $t2, 0x8A($s1)
    sh          $t3, 0x90($s1)
    sh          $t1, 0x92($s1)
    sh          $a2, 0x94($s1)
    sb          $zero, 0x9C($s1)
    sb          $a1, 0x9D($s1)
    sb          $zero, 0x9E($s1)
    sh          $zero, 0x98($s1)
    sh          $zero, 0x9A($s1)
    sh          $v1, 0xA0($s1)
    sh          $t1, 0xA2($s1)
    sh          $zero, 0xA4($s1)
    sb          $zero, 0xAC($s1)
    sb          $a1, 0xAD($s1)
    sb          $zero, 0xAE($s1)
    sh          $a3, 0xA8($s1)
    sh          $t2, 0xAA($s1)
    sh          $v1, 0xB0($s1)
    sh          $t1, 0xB2($s1)
    sh          $a2, 0xB4($s1)
    sb          $zero, 0xBC($s1)
    sb          $a1, 0xBD($s1)
    sb          $zero, 0xBE($s1)
    sh          $a3, 0xB8($s1)
    sh          $zero, 0xBA($s1)
    sh          $t3, 0xC0($s1)
    sh          $t0, 0xC2($s1)
    sh          $a2, 0xC4($s1)
    sb          $zero, 0xCC($s1)
    sb          $a1, 0xCD($s1)
    sb          $zero, 0xCE($s1)
    sh          $zero, 0xC8($s1)
    sh          $t2, 0xCA($s1)
    sh          $t3, 0xD0($s1)
    sh          $t0, 0xD2($s1)
    sh          $zero, 0xD4($s1)
    sb          $zero, 0xDC($s1)
    sb          $a1, 0xDD($s1)
    sb          $zero, 0xDE($s1)
    sh          $zero, 0xD8($s1)
    sh          $zero, 0xDA($s1)
    sh          $v1, 0xE0($s1)
    sh          $t0, 0xE2($s1)
    sh          $a2, 0xE4($s1)
    sb          $zero, 0xEC($s1)
    sb          $a1, 0xED($s1)
    sb          $zero, 0xEE($s1)
    sh          $a3, 0xE8($s1)
    sh          $t2, 0xEA($s1)
    sh          $v1, 0xF0($s1)
    sh          $t0, 0xF2($s1)
    sh          $zero, 0xF4($s1)
    sb          $zero, 0xFC($s1)
    sb          $a1, 0xFD($s1)
    sb          $zero, 0xFE($s1)
    sh          $a3, 0xF8($s1)
    sh          $zero, 0xFA($s1)
    sh          $v1, 0x100($s1)
    sh          $t1, 0x102($s1)
    sh          $a2, 0x104($s1)
    sb          $zero, 0x10C($s1)
    sb          $zero, 0x10D($s1)
    sb          $a1, 0x10E($s1)
    sh          $zero, 0x108($s1)
    sh          $zero, 0x10A($s1)
    sh          $t3, 0x110($s1)
    sh          $t1, 0x112($s1)
    sh          $a2, 0x114($s1)
    sb          $zero, 0x11C($s1)
    sb          $zero, 0x11D($s1)
    sb          $a1, 0x11E($s1)
    sh          $a3, 0x118($s1)
    sh          $zero, 0x11A($s1)
    sh          $v1, 0x120($s1)
    sh          $t0, 0x122($s1)
    sh          $a2, 0x124($s1)
    sb          $zero, 0x12C($s1)
    sb          $zero, 0x12D($s1)
    sb          $a1, 0x12E($s1)
    sh          $zero, 0x128($s1)
    sh          $t2, 0x12A($s1)
    sh          $t3, 0x130($s1)
    sh          $t0, 0x132($s1)
    sh          $a2, 0x134($s1)
    sb          $zero, 0x13C($s1)
    sb          $zero, 0x13D($s1)
    sb          $a1, 0x13E($s1)
    sh          $a3, 0x138($s1)
    sh          $t2, 0x13A($s1)
.L80012670:
    lh          $v0, 0x8($a0)
    lh          $v1, 0xA($a0)
    addiu       $s2, $s2, 0x1
    sll         $v0, $v0, 6
    sll         $v1, $v1, 6
    sh          $v0, 0x8($a0)
    sh          $v1, 0xA($a0)
    slti        $v0, $s2, 0x14
    bnez        $v0, .L80012670
    addiu       $a0, $a0, 0x10
    lui         $a0, 0x400
    ori         $a0, $a0, 0x513F
    lui         $t2, 0xB100
    ori         $t2, $t2, 0x402
    lui         $a2, 0x2
    ori         $a2, $a2, 0x406
    lui         $t3, 0xB108
    ori         $t3, $t3, 0xC0A
    lui         $a3, 0xA
    ori         $a3, $a3, 0xC0E
    lui         $t4, 0xB110
    ori         $t4, $t4, 0x1412
    lui         $t0, 0x12
    ori         $t0, $t0, 0x1416
    lui         $t5, 0xB118
    ori         $t5, $t5, 0x1C1A
    lui         $t1, 0x1A
    ori         $t1, $t1, 0x1C1E
    lui         $t6, 0xB120
    ori         $t6, $t6, 0x2422
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    lui         $a1, 0x22
    ori         $a1, $a1, 0x2426
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
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x30
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    addiu       $v1, $v0, 0x38
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $v1, 0xBD00
    sw          $a0, 0x0($v0)
    sw          $s1, 0x4($v0)
    sw          $t2, 0x8($v0)
    sw          $a2, 0xC($v0)
    sw          $t3, 0x10($v0)
    sw          $a3, 0x14($v0)
    sw          $t4, 0x18($v0)
    sw          $t0, 0x1C($v0)
    sw          $t5, 0x20($v0)
    sw          $t1, 0x24($v0)
    sw          $t6, 0x28($v0)
    sw          $a1, 0x2C($v0)
    sw          $v1, 0x30($v0)
    jal         func_8002CD28
    sw          $zero, 0x34($v0)
.L8001278C:
    lw          $ra, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end render_command_dispatch

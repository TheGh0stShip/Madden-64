.text
.align 2
.set noreorder
.globl display_frame_build
.ent display_frame_build
display_frame_build:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $sp, $sp, -0xD0
    sw          $s2, 0xB8($sp)
    addu        $s2, $a0, $zero
    addu        $a0, $zero, $zero
    sw          $s1, 0xB4($sp)
    lui         $s1, 0x1FFF
    sw          $s3, 0xBC($sp)
    lui         $s3, 0xE700
    sw          $ra, 0xC4($sp)
    sw          $s4, 0xC0($sp)
    sw          $s0, 0xB0($sp)
    swc1        $f21, 0xC8($sp)
    swc1        $f20, 0xCC($sp)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s3, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    lui         $a0, 0x80
    lhu         $a1, 0x1F8($s2)
    lhu         $a2, 0x1FA($s2)
    lhu         $a3, 0xA($s2)
    lhu         $v0, 0xC($s2)
    ori         $s1, $s1, 0xFFFF
    addu        $a0, $zero, $zero
    jal         func_8000A6A0
    sw          $v0, 0x10($sp)
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A940
    addu        $a0, $zero, $zero
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFE
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0x793C
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A270
    sw          $a1, 0x4($v1)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    lui         $a0, 0xC08
    ori         $a0, $a0, 0x4000
    lui         $a1, 0x302
    jal         func_8000A63C
    ori         $a1, $a1, 0x4000
    jal         func_8000A22C
    addiu       $a0, $zero, 0xC0
    lui         $a1, 0x380
    ori         $a1, $a1, 0x10
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0x1F
    ori         $a0, $a0, 0x3204
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $s2, 0x218
    and         $v0, $v0, $s1
    sw          $s3, 0x0($v1)
    sw          $zero, 0x4($v1)
    sw          $a1, 0x8($v1)
    jal         func_8000B008
    sw          $v0, 0xC($v1)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $v0, 0x8009
    lh          $v0, -0x79CC($v0)
    lui         $a0, 0x30
    lui         $s0, 0xFF10
    addiu       $v1, $a1, 0x8
    addiu       $v0, $v0, -0x1
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $v1, 0x8009
    lw          $v1, -0x7910($v1)
    andi        $v0, $v0, 0xFFF
    or          $v0, $v0, $s0
    sw          $v0, 0x0($a1)
    and         $v1, $v1, $s1
    jal         func_8000A3C0
    sw          $v1, 0x4($a1)
    lui         $a0, 0xFFFC
    jal         func_8000A1EC
    ori         $a0, $a0, 0xFFFC
    lhu         $v1, 0xA($s2)
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lhu         $v0, 0xC($s2)
    lui         $s4, 0xF600
    addiu       $v1, $v1, -0x1
    andi        $v1, $v1, 0x3FF
    sll         $v1, $v1, 14
    addiu       $v0, $v0, -0x1
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 2
    or          $v0, $v0, $s4
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    lhu         $v1, 0x1F8($s2)
    lhu         $a0, 0x1FA($s2)
    lui         $v0, 0x8009
    lh          $v0, -0x79CC($v0)
    sw          $s3, 0x8($a1)
    sw          $zero, 0xC($a1)
    addiu       $v0, $v0, -0x1
    andi        $v0, $v0, 0xFFF
    or          $v0, $v0, $s0
    andi        $v1, $v1, 0x3FF
    sll         $v1, $v1, 14
    andi        $a0, $a0, 0x3FF
    sw          $v0, 0x10($a1)
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    sll         $a0, $a0, 2
    or          $v1, $v1, $a0
    sw          $v1, 0x4($a1)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x5F98($at)
    lui         $v0, 0x8009
    lw          $v0, -0x7910($v0)
    lui         $v1, 0xFE00
    sw          $v1, 0x18($a1)
    and         $v0, $v0, $s1
    and         $a0, $a0, $s1
    sw          $v0, 0x1C($a1)
    sw          $a0, 0x14($a1)
    lhu         $v1, 0x206($s2)
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a1, 0x18
    addiu       $a1, $a1, 0x20
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $at, 0x8008
    sw          $a1, 0x4F5C($at)
    andi        $v1, $v1, 0x10
    beqz        $v1, .L8000C5C4
    nop
    lbu         $a0, 0x6($s2)
    lbu         $v1, 0x7($s2)
    lbu         $v0, 0x8($s2)
    sll         $a0, $a0, 8
    andi        $a0, $a0, 0xF800
    sll         $v1, $v1, 3
    andi        $v1, $v1, 0x7C0
    or          $a0, $a0, $v1
    srl         $v0, $v0, 2
    andi        $v0, $v0, 0x3E
    or          $a0, $a0, $v0
    ori         $a0, $a0, 0x1
    sll         $v0, $a0, 16
    jal         func_8000A1EC
    or          $a0, $a0, $v0
    lhu         $v1, 0xA($s2)
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lhu         $v0, 0xC($s2)
    addiu       $v1, $v1, -0x1
    andi        $v1, $v1, 0x3FF
    sll         $v1, $v1, 14
    addiu       $v0, $v0, -0x1
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 2
    or          $v0, $v0, $s4
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    lhu         $v1, 0x1F8($s2)
    lhu         $a0, 0x1FA($s2)
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s3, 0x8($a1)
    sw          $zero, 0xC($a1)
    andi        $v1, $v1, 0x3FF
    sll         $v1, $v1, 14
    andi        $a0, $a0, 0x3FF
    sll         $a0, $a0, 2
    or          $v1, $v1, $a0
    sw          $v1, 0x4($a1)
.L8000C5C4:
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $a1, 0xC320
    lui         $a2, 0x4320
    lui         $a3, 0x42F0
    lui         $at, 0x8000
    lwc1        $f0, 0x690($at)
    lui         $at, 0x8000
    lwc1        $f2, 0x694($at)
    lui         $at, 0x8000
    lwc1        $f20, 0x698($at)
    addiu       $a0, $s2, 0xA8
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x1EA($s2)
    sw          $zero, 0x14($sp)
    swc1        $f0, 0x10($sp)
    swc1        $f2, 0x18($sp)
    jal         func_80048F2C
    swc1        $f20, 0x1C($sp)
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    .word       0x44800000  # mtc1        $zero, $f0
    swc1        $f20, 0x10($sp)
    .word       0x44050000  # mfc1        $a1, $f0
    lui         $at, 0x8000
    lwc1        $f0, 0x69C($at)
    addu        $a2, $a1, $zero
    addu        $a3, $a1, $zero
    sll         $a0, $a0, 6
    addiu       $a0, $a0, 0x168
    addu        $a0, $s2, $a0
    sw          $a1, 0x14($sp)
    sw          $a1, 0x18($sp)
    jal         func_8004CBC8
    swc1        $f0, 0x1C($sp)
    lhu         $v0, 0x206($s2)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L8000C75C
    nop
    lw          $v0, 0x1F0($s2)
    beqz        $v0, .L8000C674
    nop
    jalr        $v0
    addu        $a0, $s2, $zero
.L8000C674:
    jal         func_8002CAA0
    nop
    lh          $a0, 0x10($s2)
    jal         func_8002CD44
    nop
    lh          $a0, 0x12($s2)
    jal         func_8002CF48
    nop
    lh          $a0, 0x14($s2)
    jal         func_8002D14C
    nop
    lh          $v0, 0x18($s2)
    negu        $v0, $v0
    sll         $v0, $v0, 16
    sw          $v0, 0x20($sp)
    lh          $v0, 0x1A($s2)
    negu        $v0, $v0
    sll         $v0, $v0, 16
    sw          $v0, 0x24($sp)
    lh          $v0, 0x1C($s2)
    addiu       $a0, $sp, 0x20
    negu        $v0, $v0
    sll         $v0, $v0, 16
    jal         func_8002DA14
    sw          $v0, 0x28($sp)
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    sll         $a0, $a0, 6
    addiu       $a0, $a0, 0xE8
    jal         func_8002DEF4
    addu        $a0, $s2, $a0
    addiu       $s1, $sp, 0x30
    addu        $a0, $s1, $zero
    jal         func_80048D20
    addiu       $a1, $s2, 0x68
    lui         $a1, 0x8009
    lhu         $a1, -0x502C($a1)
    addiu       $s0, $sp, 0x70
    addu        $a0, $s0, $zero
    sll         $a1, $a1, 6
    addiu       $a1, $a1, 0xE8
    jal         func_80048D20
    addu        $a1, $s2, $a1
    addu        $a0, $s0, $zero
    addu        $a1, $s1, $zero
    jal         func_800489F8
    addiu       $a2, $s2, 0x28
    jal         func_8000C790
    addu        $a0, $s2, $zero
    jal         func_8000DDF0
    nop
    lhu         $a0, 0x1E8($s2)
    jal         func_8000B140
    nop
    jal         func_8000ADC0
    addiu       $a0, $zero, 0x2
    j .L8000C764
    nop
.L8000C75C:
    jal         func_8000C810
    addu        $a0, $s2, $zero
.L8000C764:
    lw          $ra, 0xC4($sp)
    lw          $s4, 0xC0($sp)
    lw          $s3, 0xBC($sp)
    lw          $s2, 0xB8($sp)
    lw          $s1, 0xB4($sp)
    lw          $s0, 0xB0($sp)
    lwc1        $f21, 0xC8($sp)
    lwc1        $f20, 0xCC($sp)
    addiu       $sp, $sp, 0xD0
    jr          $ra
    nop
.end display_frame_build

.text
.align 2
.set noreorder
.globl func_800A8500
.ent func_800A8500
func_800A8500:
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    addiu       $sp, $sp, -0x50
    sw          $s2, 0x40($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x4C($sp)
    sw          $s4, 0x48($sp)
    sw          $s3, 0x44($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6DEC($at)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $a0, 0x8007
    lw          $a0, -0x4678($a0)
    jal         func_80016FF4
    nop
    lh          $v0, 0xA($s2)
    lui         $v1, 0x8008
    lw          $v1, -0x5F78($v1)
    beq         $v0, $v1, .L800A85A4
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A8598
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F60($v0)
    sw          $v0, 0x2C($s2)
    lui         $v0, 0x8008
    lw          $v0, -0x5F5C($v0)
    sw          $v0, 0x30($s2)
    lui         $v0, 0x8008
    lw          $v0, -0x5F58($v0)
    sw          $v0, 0x34($s2)
.L800A8598:
    lh          $v0, 0xA($s2)
    lui         $at, 0x8008
    sw          $v0, -0x5F78($at)
.L800A85A4:
    lui         $v0, 0x8007
    lw          $v0, -0x564C($v0)
    bnez        $v0, .L800A8630
    addu        $s3, $zero, $zero
    addu        $a0, $zero, $zero
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7F10
.L800A85C0:
    lw          $v0, 0x0($v1)
    bnez        $v0, .L800A85FC
    addiu       $a0, $a0, 0x1
    sltiu       $v0, $a0, 0x8
    bnez        $v0, .L800A85C0
    addiu       $v1, $v1, 0x4
    bnez        $s3, .L800A85F0
    nop
    lui         $s3, 0x8009
    lw          $s3, -0x5FA8($s3)
    beqz        $s3, .L800A8604
    nop
.L800A85F0:
    lw          $v0, 0x24($s3)
    j           func_800A3F04
    addu        $s1, $v0, $zero
.L800A85FC:
    j           func_800A3EB4
    addu        $s3, $v0, $zero
.L800A8604:
    lui         $v0, 0x8008
    lw          $v0, 0x6C88($v0)
    beqz        $v0, .L800A861C
    nop
    j           func_800A3F0C
    sw          $v0, 0xC($s2)
.L800A861C:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    addu        $s1, $v0, $zero
    j           func_800A3F10
    sw          $s1, 0xC($s2)
.L800A8630:
    addu        $s1, $v0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    addiu       $v1, $zero, 0x4
    addiu       $v0, $zero, 0x7
    sh          $v0, 0x54($s2)
    sh          $v0, 0x56($s2)
    sh          $v0, 0x58($s2)
    addiu       $v0, $zero, 0x5
    sh          $v0, 0x78($s2)
    sh          $v0, 0x7C($s2)
    sh          $v0, 0x7E($s2)
    addiu       $v0, $zero, 0x6
    sh          $v1, 0x4C($s2)
    sh          $v1, 0x4E($s2)
    sh          $v1, 0x50($s2)
    sh          $v1, 0x74($s2)
    sh          $v1, 0x76($s2)
    bne         $s1, $a0, .L800A86A0
    sh          $v0, 0x80($s2)
    sh          $zero, 0x2C($sp)
    lw          $a0, 0x14($s2)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A86CC
    addiu       $v0, $zero, 0x7FF
    j           func_800A3FA8
    sh          $v0, 0x2C($sp)
.L800A86A0:
    lw          $v0, 0x8($s1)
    lhu         $v0, 0x12($v0)
    sh          $v0, 0x2C($sp)
    lw          $a0, 0x14($s2)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A86CC
    nop
    lhu         $v0, 0x2C($sp)
    addiu       $v0, $v0, 0x7FF
    sh          $v0, 0x2C($sp)
.L800A86CC:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beql        $v0, $zero, .L800A86FC
    addiu       $v0, $zero, 0x400
    lw          $v0, 0x24($v0)
    bne         $s1, $v0, .L800A86FC
    addiu       $v0, $zero, 0x400
    lui         $a0, 0x8007
    lw          $a0, -0x4678($a0)
    jal         func_80016FE4
    nop
    addiu       $v0, $zero, 0x400
.L800A86FC:
    sh          $zero, 0x2A($sp)
    sh          $v0, 0x28($sp)
    lhu         $v0, 0x84($s2)
    andi        $v0, $v0, 0xFBFF
    bnez        $s3, .L800A8734
    sh          $v0, 0x84($s2)
    lhu         $v1, 0x54($s1)
    addiu       $v0, $zero, 0x7
    beq         $v1, $v0, .L800A8744
    nop
    jal         func_800A4484
    addu        $a0, $s2, $zero
    j           func_800A4460
    nop
.L800A8734:
    lhu         $v1, 0x54($s1)
    addiu       $v0, $zero, 0x7
    bne         $v1, $v0, .L800A8B84
    nop
.L800A8744:
    lui         $v1, 0x8008
    lw          $v1, 0x6C88($v1)
    beqz        $v1, .L800A8768
    nop
    beq         $v1, $s1, .L800A8768
    nop
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800A8768:
    lw          $v0, 0x14($s1)
    addiu       $v1, $zero, -0x2
    lui         $at, 0x8008
    sw          $s1, 0x6C88($at)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($s1)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x4C($s2)
    sh          $v0, 0x4E($s2)
    sh          $v0, 0x50($s2)
    addiu       $v0, $zero, 0x3
    sh          $v0, 0x54($s2)
    sh          $v0, 0x56($s2)
    beqz        $s3, .L800A897C
    sh          $v0, 0x58($s2)
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    sll         $a2, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lw          $v1, 0x6DEC($at)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lbu         $v1, 0x1E($s3)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0xD6A
    addiu       $s4, $a1, 0xAF6
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lbu         $v1, 0x1F($s3)
    sll         $v0, $v0, 2
    addu        $a0, $v0, $s4
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a0
    lh          $a0, 0x0($v1)
    addu        $v0, $v0, $a1
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4714
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    lw          $a0, 0x0($a1)
    sll         $v1, $v1, 3
    addu        $v0, $v0, $v1
    beq         $v0, $a0, .L800A897C
    nop
    sw          $v0, 0x0($a1)
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lw          $a0, 0x6DEC($at)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8008
    sw          $zero, -0x5F74($at)
    lbu         $a0, 0x1E($s3)
    lbu         $v0, 0x1F($s3)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    sll         $v0, $v0, 1
    addu        $a0, $v1, $s4
    addu        $v0, $v0, $a0
    lh          $a0, 0x0($v0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5F74
    jal         func_800167FC
    addu        $a1, $s0, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    lui         $at, 0x8007
    sw          $s0, -0x4710($at)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6DEC($at)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x2
    lbu         $a0, 0x1E($s3)
    lbu         $v0, 0x1F($s3)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    sll         $v0, $v0, 1
    addu        $a0, $v1, $s4
    addu        $v0, $v0, $a0
    lh          $a0, 0x0($v0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v1, -0x2AA0($at)
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    sll         $v0, $v0, 3
    lui         $at, 0x8007
    sw          $v1, -0x470C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6DEC($at)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x3
.L800A897C:
    lh          $v1, 0xA($s2)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A8A50
    addu        $a0, $s1, $zero
    lw          $v1, 0x1C($s2)
    lw          $a0, 0x20($s2)
    lw          $a1, 0x24($s2)
    lhu         $a2, 0x5C($s2)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x78($s2)
    addiu       $v0, $zero, 0x3
    sh          $v0, 0x80($s2)
    sw          $v1, 0x2C($s2)
    sw          $a0, 0x30($s2)
    sw          $a1, 0x34($s2)
    sh          $a2, 0x28($sp)
    lhu         $v0, 0x5E($s2)
    sh          $v0, 0x2A($sp)
    lw          $a0, 0x14($s2)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A89E0
    addiu       $v0, $zero, 0x7FF
    j           func_800A42C0
    sh          $v0, 0x2C($sp)
.L800A89E0:
    sh          $zero, 0x2C($sp)
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0x688
    jal         func_800A6A70
    addiu       $a2, $zero, 0x11
    lw          $v1, 0x98($s2)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800A8A0C
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x78($s2)
    sh          $v0, 0x80($s2)
.L800A8A0C:
    lw          $v1, 0xA0($s2)
    lhu         $v0, 0x2C($sp)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x28
    addu        $v0, $v0, $v1
    jal         func_800A2EB4
    sh          $v0, 0x2C($sp)
    lui         $v0, 0x8009
    lh          $v0, -0x4DA8($v0)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x6DEC($at)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    j           func_800A4460
    sw          $v0, 0x14($v1)
.L800A8A50:
    addu        $a1, $zero, $zero
    lhu         $v0, 0x84($s2)
    addiu       $a2, $sp, 0x18
    addiu       $a3, $sp, 0x30
    ori         $v0, $v0, 0x400
    sh          $v0, 0x84($s2)
    jal         func_80044108
    sw          $zero, 0x10($sp)
    lhu         $v0, 0x32($sp)
    andi        $v1, $v0, 0xFFF
    andi        $v0, $v0, 0x800
    beqz        $v0, .L800A8A8C
    sh          $v1, 0x32($sp)
    ori         $v0, $v1, 0xF000
    sh          $v0, 0x32($sp)
.L800A8A8C:
    lhu         $v1, 0x30($sp)
    andi        $v0, $v1, 0x800
    beqz        $v0, .L800A8AA0
    ori         $v0, $v1, 0xF000
    sh          $v0, 0x30($sp)
.L800A8AA0:
    lhu         $v1, 0x32($sp)
    lh          $a0, 0x30($sp)
    addiu       $v0, $zero, 0x400
    sll         $v1, $v1, 16
    sra         $v1, $v1, 17
    subu        $v0, $v0, $v1
    addiu       $a0, $a0, 0x400
    sra         $a0, $a0, 4
    sh          $v0, 0x28($sp)
    sh          $a0, 0x2A($sp)
    sw          $zero, 0x9C($s2)
    lh          $a0, 0x32($sp)
    jal         func_8002E828
    addiu       $s1, $zero, 0x3
    lui         $t0, 0x10
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    lui         $s3, 0x8008
    addiu       $s3, $s3, -0x5F60
    addu        $a0, $s3, $zero
    sw          $t0, 0x98($s2)
    sw          $s1, 0x10($sp)
    lw          $a2, 0x18($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5F70
    addu        $a1, $s0, $zero
    jal         func_800A5D6C
    addiu       $a3, $zero, 0x2
    addiu       $a0, $s3, 0x4
    sw          $s1, 0x10($sp)
    lw          $a2, 0x1C($sp)
    addiu       $a1, $s0, 0x4
    jal         func_800A5D6C
    addiu       $a3, $zero, 0x2
    addiu       $a0, $s3, 0x8
    sw          $s1, 0x10($sp)
    lw          $a2, 0x20($sp)
    addiu       $a1, $s0, 0x8
    jal         func_800A5D6C
    addiu       $a3, $zero, 0x2
    lw          $v1, 0x8($s3)
    lui         $v0, 0xF
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L800A8B70
    addu        $a0, $s2, $zero
    lui         $v0, 0x10
    sw          $v0, 0x8($s3)
.L800A8B70:
    jal         func_800A2E58
    addu        $a1, $s3, $zero
    addu        $a0, $s2, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x28
.L800A8B84:
    lw          $ra, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800A8500

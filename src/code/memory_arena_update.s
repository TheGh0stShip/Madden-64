.text
.align 2
.set noreorder
.globl memory_arena_update
.ent memory_arena_update
memory_arena_update:
    addiu       $sp, $sp, -0x40
    sw          $s4, 0x30($sp)
    addu        $s4, $a0, $zero
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s3, 0x8($s4)
    lw          $s5, 0x4($s3)
    beqz        $s5, .L80033EF8
    nop
    lhu         $v0, 0xA($s3)
    subu        $v0, $v0, $a1
    sh          $v0, 0xA($s3)
    lhu         $v0, 0x10($s3)
    lh          $v1, 0xA($s3)
    addu        $v0, $v0, $a1
    bgtz        $v1, .L80033EF8
    sh          $v0, 0x10($s3)
    addiu       $s6, $zero, 0x1
.L80033B7C:
    lhu         $a0, 0x8($s3)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $s5
    lhu         $s1, 0x2($v0)
    ori         $v0, $zero, 0x8000
    andi        $v1, $s1, 0xC000
    beq         $v1, $v0, .L80033BC8
    slt         $v0, $v0, $v1
    bnez        $v0, .L80033BB8
    ori         $v0, $zero, 0xC000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80033EEC
    nop
    j .L80033ECC
    nop
.L80033BB8:
    beq         $v1, $v0, .L80033EB8
    andi        $v0, $s1, 0x3FFF
    j .L80033ECC
    nop
.L80033BC8:
    andi        $v1, $s1, 0xFF00
    ori         $v0, $zero, 0x8600
    beq         $v1, $v0, .L80033D1C
    slt         $v0, $v0, $v1
    bnez        $v0, .L80033C20
    ori         $v0, $zero, 0x9200
    ori         $v0, $zero, 0x8200
    beq         $v1, $v0, .L80033C70
    slt         $v0, $v0, $v1
    bnez        $v0, .L80033C08
    ori         $v0, $zero, 0x8400
    ori         $v0, $zero, 0x8100
    beq         $v1, $v0, .L80033C64
    andi        $v0, $s1, 0xFF
    j .L80033EEC
    nop
.L80033C08:
    beq         $v1, $v0, .L80033C94
    ori         $v0, $zero, 0x8500
    beq         $v1, $v0, .L80033CB0
    sll         $s1, $s1, 24
    j .L80033EEC
    nop
.L80033C20:
    beq         $v1, $v0, .L80033E64
    slt         $v0, $v0, $v1
    bnez        $v0, .L80033C4C
    ori         $v0, $zero, 0xBE00
    ori         $v0, $zero, 0x8700
    beq         $v1, $v0, .L80033D68
    ori         $v0, $zero, 0x9100
    beq         $v1, $v0, .L80033DE4
    sll         $v1, $s1, 24
    j .L80033EEC
    nop
.L80033C4C:
    beq         $v1, $v0, .L80033E80
    ori         $v0, $zero, 0xBF00
    beql        $v1, $v0, .L80033E98
    sh          $s6, 0xA($s3)
    j .L80033EEC
    nop
.L80033C64:
    sh          $v0, 0x8($s3)
    j .L80033EEC
    sh          $zero, 0x10($s3)
.L80033C70:
    addiu       $v0, $a0, 0x1
    sh          $v0, 0x8($s3)
    andi        $v0, $s1, 0x3
    lw          $v1, 0x14($s4)
    addiu       $v0, $v0, 0x12
    sllv        $v0, $s6, $v0
    or          $v1, $v1, $v0
    j .L80033EEC
    sw          $v1, 0x14($s4)
.L80033C94:
    addiu       $v0, $a0, 0x1
    sh          $v0, 0x8($s3)
    andi        $v0, $s1, 0xFF
    lui         $at, 0x8009
    sh          $v0, -0x7B90($at)
    j .L80033EEC
    nop
.L80033CB0:
    lui         $a0, 0x8008
    lw          $a0, -0x5BA8($a0)
    jal         func_8000C8EC
    sra         $s1, $s1, 24
    lui         $v1, 0x8008
    lw          $v1, -0x5BA8($v1)
    lh          $a0, 0x14($v1)
    sltu        $s0, $zero, $v0
    sll         $s0, $s0, 11
    jal         func_8002E848
    subu        $a0, $s0, $a0
    .word       0x00510018  # mult        $v0, $s1
    .word       0x00009012  # mflo        $s2
    lui         $v0, 0x8008
    lw          $v0, -0x5BA8($v0)
    lh          $a0, 0x14($v0)
    jal         func_8002E828
    subu        $a0, $s0, $a0
    .word       0x02220018  # mult        $s1, $v0
    .word       0x00008812  # mflo        $s1
    lw          $v0, 0x20($s4)
    lw          $v1, 0x1C($s4)
    addu        $v0, $v0, $s2
    sw          $v0, 0x20($s4)
    addu        $v1, $v1, $s1
    j .L80033E70
    sw          $v1, 0x1C($s4)
.L80033D1C:
    lui         $a0, 0x8008
    lw          $a0, -0x5BA8($a0)
    andi        $s1, $s1, 0x7
    jal         func_8000C8EC
    addu        $s0, $s1, $zero
    bnel        $v0, $zero, .L80033D38
    addiu       $s0, $s1, 0x4
.L80033D38:
    lui         $v1, 0x8008
    lw          $v1, -0x5BA8($v1)
    lhu         $v0, 0x8($s3)
    lhu         $v1, 0x14($v1)
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x8($s3)
    negu        $v0, $s0
    sll         $v0, $v0, 9
    addiu       $v0, $v0, -0x100
    subu        $v1, $v1, $v0
    j .L80033EEC
    sh          $v1, 0x12($s3)
.L80033D68:
    lui         $a0, 0x8008
    lw          $a0, -0x5BA8($a0)
    sll         $s1, $s1, 24
    jal         func_8000C8EC
    sra         $s1, $s1, 24
    sltiu       $s0, $v0, 0x1
    lui         $v1, 0x8008
    lw          $v1, -0x5BA8($v1)
    negu        $s0, $s0
    addiu       $v0, $zero, -0x4000
    lh          $a0, 0x14($v1)
    and         $s0, $s0, $v0
    ori         $s0, $s0, 0x4000
    jal         func_8002E848
    subu        $a0, $s0, $a0
    .word       0x00510018  # mult        $v0, $s1
    .word       0x00009012  # mflo        $s2
    lui         $v0, 0x8008
    lw          $v0, -0x5BA8($v0)
    lh          $a0, 0x14($v0)
    jal         func_8002E828
    subu        $a0, $s0, $a0
    .word       0x02220018  # mult        $s1, $v0
    .word       0x00008812  # mflo        $s1
    lw          $v0, 0x20($s4)
    lw          $v1, 0x1C($s4)
    addu        $v0, $v0, $s2
    sw          $v0, 0x20($s4)
    addu        $v1, $v1, $s1
    j .L80033E70
    sw          $v1, 0x1C($s4)
.L80033DE4:
    sra         $v1, $v1, 24
    sw          $v1, 0x10($sp)
    lhu         $v0, 0x8($s3)
    addu        $a0, $s4, $zero
    sll         $v1, $v1, 12
    sll         $v0, $v0, 1
    addu        $v0, $s5, $v0
    lhu         $s1, 0x4($v0)
    addiu       $a1, $sp, 0x10
    addu        $a2, $zero, $zero
    sw          $v1, 0x10($sp)
    sll         $v1, $s1, 16
    sra         $v1, $v1, 24
    sll         $v0, $s1, 24
    sra         $v0, $v0, 24
    sw          $v1, 0x14($sp)
    sll         $v1, $v1, 12
    sw          $v0, 0x18($sp)
    sll         $v0, $v0, 12
    sw          $v1, 0x14($sp)
    jal         func_80043E7C
    sw          $v0, 0x18($sp)
    lw          $v0, 0x10($sp)
    sw          $v0, 0x1C($s4)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x20($s4)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x24($s4)
    lhu         $v0, 0x8($s3)
    addiu       $v0, $v0, 0x2
    j .L80033EEC
    sh          $v0, 0x8($s3)
.L80033E64:
    andi        $a0, $s1, 0xFF
    jal         func_800E0E34
    sll         $a0, $a0, 4
.L80033E70:
    lhu         $v0, 0x8($s3)
    addiu       $v0, $v0, 0x1
    j .L80033EEC
    sh          $v0, 0x8($s3)
.L80033E80:
    sh          $s6, 0xA($s3)
    sw          $zero, 0x4($s3)
    sh          $zero, 0x10($s3)
    lw          $v0, 0x14($s4)
    j .L80033EA8
    lui         $v1, 0xFFFC
.L80033E98:
    sw          $zero, 0x4($s3)
    sh          $zero, 0x10($s3)
    lw          $v0, 0x14($s4)
    lui         $v1, 0xFFFD
.L80033EA8:
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j .L80033EEC
    sw          $v0, 0x14($s4)
.L80033EB8:
    lhu         $v1, 0x8($s3)
    sh          $v0, 0xC($s3)
    addiu       $v1, $v1, 0x1
    j .L80033EEC
    sh          $v1, 0x8($s3)
.L80033ECC:
    lhu         $v0, 0x8($s3)
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x8($s3)
    sw          $s1, 0x18($s4)
    lhu         $v0, 0xA($s3)
    lhu         $v1, 0xC($s3)
    addu        $v0, $v0, $v1
    sh          $v0, 0xA($s3)
.L80033EEC:
    lh          $v0, 0xA($s3)
    blez        $v0, .L80033B7C
    nop
.L80033EF8:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end memory_arena_update

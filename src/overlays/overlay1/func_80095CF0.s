.text
.align 2
.set noreorder
.globl func_80095CF0
.ent func_80095CF0
func_80095CF0:
    addiu       $sp, $sp, -0x60
    sw          $s3, 0x54($sp)
    addu        $s3, $a0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    sll         $a0, $a1, 16
    sra         $a0, $a0, 16
    sw          $ra, 0x58($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    jal         func_80030B54
    andi        $s2, $v0, 0xFFFF
    addu        $s1, $v0, $zero
    andi        $v0, $s1, 0xFF3F
    beqz        $v0, .L80095F84
    sll         $s0, $s2, 3
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x30
    sw          $zero, 0x10($sp)
    jal         func_8000C990
    sw          $zero, 0x14($sp)
    addu        $a0, $s3, $zero
    jal         func_8000C9C8
    addiu       $a1, $sp, 0x38
    andi        $v0, $s1, 0x8
    beqz        $v0, .L80095D70
    andi        $v0, $s1, 0x4
    lhu         $v0, 0x30($sp)
    subu        $v0, $v0, $s0
    sh          $v0, 0x30($sp)
    andi        $v0, $s1, 0x4
.L80095D70:
    beqz        $v0, .L80095D88
    andi        $v0, $s1, 0x2
    lhu         $v0, 0x30($sp)
    addu        $v0, $v0, $s0
    sh          $v0, 0x30($sp)
    andi        $v0, $s1, 0x2
.L80095D88:
    beqz        $v0, .L80095DA0
    andi        $v0, $s1, 0x1
    lhu         $v0, 0x34($sp)
    subu        $v0, $v0, $s0
    sh          $v0, 0x34($sp)
    andi        $v0, $s1, 0x1
.L80095DA0:
    beqz        $v0, .L80095DB8
    andi        $v0, $s1, 0x10
    lhu         $v0, 0x34($sp)
    addu        $v0, $v0, $s0
    sh          $v0, 0x34($sp)
    andi        $v0, $s1, 0x10
.L80095DB8:
    beqz        $v0, .L80095DD0
    andi        $v0, $s1, 0x20
    lhu         $v0, 0x32($sp)
    addu        $v0, $v0, $s0
    sh          $v0, 0x32($sp)
    andi        $v0, $s1, 0x20
.L80095DD0:
    beqz        $v0, .L80095DE8
    andi        $v0, $s1, 0x100
    lhu         $v0, 0x32($sp)
    subu        $v0, $v0, $s0
    sh          $v0, 0x32($sp)
    andi        $v0, $s1, 0x100
.L80095DE8:
    beqz        $v0, .L80095DF4
    sll         $v0, $s2, 19
    sw          $v0, 0x10($sp)
.L80095DF4:
    andi        $v0, $s1, 0x200
    beqz        $v0, .L80095E08
    negu        $v0, $s0
    sll         $v0, $v0, 16
    sw          $v0, 0x10($sp)
.L80095E08:
    andi        $v0, $s1, 0x800
    beqz        $v0, .L80095E18
    sll         $v0, $s2, 19
    sw          $v0, 0x14($sp)
.L80095E18:
    andi        $v0, $s1, 0x400
    beqz        $v0, .L80095E2C
    negu        $v0, $s0
    sll         $v0, $v0, 16
    sw          $v0, 0x14($sp)
.L80095E2C:
    andi        $v0, $s1, 0x4000
    beqz        $v0, .L80095E44
    sll         $v1, $s0, 16
    lw          $v0, 0x40($sp)
    addu        $v0, $v0, $v1
    sw          $v0, 0x40($sp)
.L80095E44:
    andi        $v0, $s1, 0x8000
    beqz        $v0, .L80095E5C
    sll         $v1, $s0, 16
    lw          $v0, 0x40($sp)
    subu        $v0, $v0, $v1
    sw          $v0, 0x40($sp)
.L80095E5C:
    lh          $a0, 0x34($sp)
    jal         func_8002E828
    negu        $a0, $a0
    lh          $a0, 0x34($sp)
    lw          $t0, 0x10($sp)
    sra         $t6, $v0, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00004012  # mflo        $t0
    nop
    nop
    sw          $t0, 0x20($sp)
    jal         func_8002E848
    negu        $a0, $a0
    lh          $a0, 0x34($sp)
    lw          $t0, 0x10($sp)
    sra         $t6, $v0, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00004012  # mflo        $t0
    nop
    nop
    sw          $t0, 0x24($sp)
    negu        $a0, $a0
    jal         func_8002E828
    addiu       $a0, $a0, 0x400
    lh          $a0, 0x34($sp)
    lw          $v1, 0x20($sp)
    lw          $t0, 0x14($sp)
    sra         $t6, $v0, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    negu        $a0, $a0
    addiu       $a0, $a0, 0x400
    addu        $v1, $v1, $v0
    jal         func_8002E848
    sw          $v1, 0x20($sp)
    lw          $a3, 0x40($sp)
    lw          $a1, 0x24($sp)
    lw          $v1, 0x38($sp)
    lw          $a2, 0x20($sp)
    lw          $a0, 0x3C($sp)
    lw          $t0, 0x14($sp)
    sra         $t6, $v0, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $a1, $a1, $v0
    addu        $v1, $v1, $a2
    addu        $a0, $a0, $a1
    lui         $v0, 0x14
    slt         $v0, $a3, $v0
    sw          $a1, 0x24($sp)
    sw          $v1, 0x38($sp)
    beqz        $v0, .L80095F54
    sw          $a0, 0x3C($sp)
    lui         $a3, 0x14
.L80095F54:
    sw          $a3, 0x40($sp)
    addu        $a0, $s3, $zero
    jal         func_8000C9AC
    addiu       $a1, $sp, 0x30
    addu        $a0, $s3, $zero
    jal         func_8000CA20
    addiu       $a1, $sp, 0x38
    andi        $v0, $s1, 0x1000
    beqz        $v0, .L80095F84
    nop
    jal         func_8008D1EC
    nop
.L80095F84:
    lw          $ra, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end func_80095CF0

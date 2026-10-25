.text
.align 2
.set noreorder
.globl func_800A9940
.ent func_800A9940
func_800A9940:
    addiu       $sp, $sp, -0x78
    sw          $s1, 0x6C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x70($sp)
    sw          $s0, 0x68($sp)
    lhu         $v1, 0x84($s1)
    andi        $v0, $v1, 0x100
    beqz        $v0, .L800A99B0
    nop
    jal         func_800A2DFC
    addiu       $a1, $s1, 0x1C
    addu        $a0, $s1, $zero
    jal         func_800A2E24
    addiu       $a1, $s1, 0x5C
    addiu       $v0, $zero, 0x20
    sh          $v0, 0x4C($s1)
    sh          $v0, 0x4E($s1)
    sh          $v0, 0x50($s1)
    sh          $v0, 0x54($s1)
    sh          $v0, 0x56($s1)
    sh          $v0, 0x58($s1)
    sh          $v0, 0x74($s1)
    sh          $v0, 0x76($s1)
    sh          $v0, 0x78($s1)
    sh          $v0, 0x7C($s1)
    sh          $v0, 0x7E($s1)
    j           func_800A5720
    sh          $v0, 0x80($s1)
.L800A99B0:
    lw          $v0, 0xC($s1)
    beqz        $v0, .L800A9E44
    andi        $v0, $v1, 0x80
    bnez        $v0, .L800A9B38
    addu        $a0, $s1, $zero
    lhu         $v0, 0x84($s1)
    sh          $zero, 0x4C($s1)
    sh          $zero, 0x4E($s1)
    sh          $zero, 0x50($s1)
    sh          $zero, 0x54($s1)
    sh          $zero, 0x56($s1)
    sh          $zero, 0x58($s1)
    sh          $zero, 0x74($s1)
    sh          $zero, 0x76($s1)
    sh          $zero, 0x78($s1)
    sh          $zero, 0x7C($s1)
    sh          $zero, 0x7E($s1)
    sh          $zero, 0x80($s1)
    ori         $v0, $v0, 0x80
    jal         func_800A5AA8
    sh          $v0, 0x84($s1)
    addu        $a0, $s1, $zero
    jal         func_800A2DFC
    addiu       $a1, $s1, 0x88
    lw          $v0, 0xC($s1)
    lw          $v1, 0x1C($s1)
    lw          $v0, 0x1C($v0)
    subu        $v0, $v0, $v1
    sw          $v0, 0x20($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x20($s1)
    lw          $v0, 0x20($v0)
    addiu       $s0, $sp, 0x20
    addu        $a0, $s0, $zero
    subu        $v0, $v0, $v1
    jal         func_800B9208
    sw          $v0, 0x24($sp)
    sh          $v0, 0x34($sp)
    sh          $zero, 0x32($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x1C($s1)
    lw          $a0, 0x1C($v0)
    lw          $a1, 0x20($v0)
    lw          $v0, 0x20($s1)
    subu        $a0, $a0, $v1
    sra         $a0, $a0, 16
    subu        $a1, $a1, $v0
    jal         func_800A69D8
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    sw          $v0, 0x20($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x24($v0)
    addu        $a0, $s0, $zero
    subu        $v0, $v0, $v1
    jal         func_800B9208
    sw          $v0, 0x24($sp)
    addu        $v1, $v0, $zero
    sh          $v1, 0x30($sp)
    lhu         $v0, 0x84($s1)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L800A9AC8
    sll         $v0, $v1, 16
    lh          $v1, 0xA6($s1)
    sra         $v0, $v0, 16
    lw          $a0, 0xA4($s1)
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L800A9AC8
    sh          $a0, 0x30($sp)
.L800A9AC8:
    lwl         $v0, 0x30($sp)
    lwr         $v0, 0x33($sp)
    lwl         $v1, 0x34($sp)
    lwr         $v1, 0x37($sp)
    swl         $v0, 0x5C($s1)
    swr         $v0, 0x5F($s1)
    swl         $v1, 0x60($s1)
    swr         $v1, 0x63($s1)
    lwl         $v0, 0x5C($s1)
    lwr         $v0, 0x5F($s1)
    lwl         $v1, 0x60($s1)
    lwr         $v1, 0x63($s1)
    swl         $v0, 0x64($s1)
    swr         $v0, 0x67($s1)
    swl         $v1, 0x68($s1)
    swr         $v1, 0x6B($s1)
    lhu         $v0, 0x34($sp)
    sh          $v0, 0x6($s1)
    lwl         $v0, 0x30($sp)
    lwr         $v0, 0x33($sp)
    lwl         $v1, 0x34($sp)
    lwr         $v1, 0x37($sp)
    swl         $v0, 0xA8($s1)
    swr         $v0, 0xAB($s1)
    swl         $v1, 0xAC($s1)
    swr         $v1, 0xAF($s1)
    j           func_800A5720
    nop
.L800A9B38:
    lw          $v0, 0x1C($s1)
    lw          $v1, 0x20($s1)
    lw          $a0, 0x24($s1)
    lw          $a1, 0x28($s1)
    sw          $v0, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $a0, 0x18($sp)
    sw          $a1, 0x1C($sp)
    lhu         $v0, 0x84($s1)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L800A9B80
    addiu       $v1, $sp, 0x10
    lw          $v0, 0xC($s1)
    lw          $a0, 0x1C($s1)
    lw          $v0, 0x1C($v0)
    lw          $a1, 0x88($s1)
    j           func_800A5470
    addu        $a3, $v1, $zero
.L800A9B80:
    lw          $v0, 0xC($s1)
    lw          $a0, 0x20($s1)
    lw          $v0, 0x20($v0)
    lw          $a1, 0x8C($s1)
    addiu       $a3, $sp, 0x14
    subu        $v1, $v0, $a0
    lw          $a2, 0x98($s1)
    subu        $v0, $a0, $a1
    bltz        $v0, .L800A9BB8
    slt         $v0, $a2, $v0
    beqz        $v0, .L800A9C00
    nop
    j           func_800A54A4
    nop
.L800A9BB8:
    subu        $v0, $a1, $a0
    slt         $v0, $a2, $v0
    beqz        $v0, .L800A9C00
    nop
    lw          $v0, 0x9C($s1)
    sll         $v0, $v0, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L800A9BE0
    nop
    break       7
.L800A9BE0:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L800A9BF8
    lui         $at, 0x8000
    bne         $v1, $at, .L800A9BF8
    nop
    break       6
.L800A9BF8:
    .word       0x00001012  # mflo        $v0
    sll         $v1, $v0, 8
.L800A9C00:
    lw          $v0, 0x0($a3)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($a3)
    lw          $v0, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x18($sp)
    lw          $a1, 0x1C($sp)
    sw          $v0, 0x2C($s1)
    sw          $v1, 0x30($s1)
    sw          $a0, 0x34($s1)
    sw          $a1, 0x38($s1)
    lw          $v0, 0x2C($s1)
    lw          $v1, 0x30($s1)
    lw          $a0, 0x34($s1)
    lw          $a1, 0x38($s1)
    sw          $v0, 0x1C($s1)
    sw          $v1, 0x20($s1)
    sw          $a0, 0x24($s1)
    sw          $a1, 0x28($s1)
    lhu         $v0, 0x84($s1)
    andi        $v0, $v0, 0x2
    bnez        $v0, .L800A9E44
    nop
    lw          $v0, 0xC($s1)
    lw          $v1, 0x1C($s1)
    lw          $a0, 0x1C($v0)
    lw          $a1, 0x20($v0)
    lw          $v0, 0x20($s1)
    subu        $a0, $a0, $v1
    sra         $a0, $a0, 16
    subu        $a1, $a1, $v0
    jal         func_800A69D8
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    sw          $v0, 0x20($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x24($v0)
    addiu       $a0, $sp, 0x20
    subu        $v0, $v0, $v1
    jal         func_800B9208
    sw          $v0, 0x24($sp)
    addu        $v1, $v0, $zero
    sh          $v1, 0x30($sp)
    lhu         $v0, 0x84($s1)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L800A9CD8
    sll         $v0, $v1, 16
    lh          $v1, 0xA6($s1)
    sra         $v0, $v0, 16
    lw          $a0, 0xA4($s1)
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L800A9CD8
    sh          $a0, 0x30($sp)
.L800A9CD8:
    sh          $zero, 0x32($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x1C($s1)
    lw          $v0, 0x1C($v0)
    subu        $v0, $v0, $v1
    sw          $v0, 0x20($sp)
    lw          $v0, 0xC($s1)
    lw          $v1, 0x20($s1)
    lw          $v0, 0x20($v0)
    addiu       $a0, $sp, 0x20
    subu        $v0, $v0, $v1
    jal         func_800B9208
    sw          $v0, 0x24($sp)
    lh          $a0, 0x30($sp)
    sh          $v0, 0x34($sp)
    lh          $v1, 0xA8($s1)
    subu        $v0, $a0, $v1
    slti        $v0, $v0, 0x800
    beqz        $v0, .L800A9D38
    addu        $a1, $a0, $zero
    subu        $v0, $v1, $a0
    slti        $v0, $v0, 0x800
    bnez        $v0, .L800A9D40
    nop
.L800A9D38:
    addiu       $v0, $a1, -0x1000
    sh          $v0, 0x30($sp)
.L800A9D40:
    lh          $a1, 0x34($sp)
    lh          $v1, 0xAC($s1)
    subu        $v0, $a1, $v1
    slti        $v0, $v0, 0x800
    beqz        $v0, .L800A9D68
    addu        $a0, $a1, $zero
    subu        $v0, $v1, $a1
    slti        $v0, $v0, 0x800
    bnez        $v0, .L800A9D70
    nop
.L800A9D68:
    addiu       $v0, $a0, -0x1000
    sh          $v0, 0x34($sp)
.L800A9D70:
    lh          $v0, 0x30($sp)
    lh          $a0, 0xA8($s1)
    lw          $v1, 0xA0($s1)
    subu        $v0, $v0, $a0
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L800A9D90
    nop
    break       7
.L800A9D90:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L800A9DA8
    lui         $at, 0x8000
    bne         $v0, $at, .L800A9DA8
    nop
    break       6
.L800A9DA8:
    .word       0x00001012  # mflo        $v0
    lh          $v1, 0xAC($s1)
    sh          $zero, 0x5E($s1)
    addu        $a0, $a0, $v0
    sh          $a0, 0x5C($s1)
    lh          $v0, 0x34($sp)
    lw          $a0, 0xA0($s1)
    subu        $v0, $v0, $v1
    .word       0x0044001A  # div         $zero, $v0, $a0
    bnez        $a0, .L800A9DD8
    nop
    break       7
.L800A9DD8:
    addiu       $at, $zero, -0x1
    bne         $a0, $at, .L800A9DF0
    lui         $at, 0x8000
    bne         $v0, $at, .L800A9DF0
    nop
    break       6
.L800A9DF0:
    .word       0x00001012  # mflo        $v0
    addu        $v1, $v1, $v0
    sh          $v1, 0x60($s1)
    lwl         $v0, 0x5C($s1)
    lwr         $v0, 0x5F($s1)
    lwl         $v1, 0x60($s1)
    lwr         $v1, 0x63($s1)
    swl         $v0, 0x64($s1)
    swr         $v0, 0x67($s1)
    swl         $v1, 0x68($s1)
    swr         $v1, 0x6B($s1)
    lhu         $v0, 0x60($s1)
    sh          $v0, 0x6($s1)
    lwl         $v0, 0x5C($s1)
    lwr         $v0, 0x5F($s1)
    lwl         $v1, 0x60($s1)
    lwr         $v1, 0x63($s1)
    swl         $v0, 0xA8($s1)
    swr         $v0, 0xAB($s1)
    swl         $v1, 0xAC($s1)
    swr         $v1, 0xAF($s1)
.L800A9E44:
    lw          $ra, 0x70($sp)
    lw          $s1, 0x6C($sp)
    lw          $s0, 0x68($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end func_800A9940

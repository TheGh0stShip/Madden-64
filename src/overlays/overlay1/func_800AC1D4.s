.text
.align 2
.set noreorder
.globl func_800AC1D4
.ent func_800AC1D4
func_800AC1D4:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $v1, 0x8008
    lh          $v1, -0x5E98($v1)
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    bnez        $v1, .L800AC660
    andi        $s0, $v0, 0xFFFF
    jal         func_800AAC40
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x4814
    jal         func_8001AEA8
    nop
    lui         $at, 0x8008
    sw          $v0, -0x5F30($at)
    jal         func_800DD6EC
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800AC268
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4848($v0)
    lui         $v1, 0x8007
    lhu         $v1, -0x4846($v1)
    lui         $at, 0x8008
    sh          $v0, -0x5EA8($at)
    lui         $at, 0x8008
    sh          $v1, -0x5EA6($at)
    j           func_800A7B64
    nop
.L800AC268:
    lui         $v0, 0x8007
    lhu         $v0, -0x4848($v0)
    lui         $v1, 0x8007
    lhu         $v1, -0x4846($v1)
    lui         $at, 0x8008
    sh          $v0, -0x5EA6($at)
    lui         $at, 0x8008
    sh          $v1, -0x5EA8($at)
    jal         func_8000CDC0
    nop
    jal         func_800334B8
    nop
    jal         func_800A94A0
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800AC2F8
    nop
    jal         func_800AAED4
    addiu       $a0, $zero, 0x9
    lui         $at, 0x8007
    sw          $v0, -0x4834($at)
    jal         func_800AAED4
    addiu       $a0, $zero, 0x8
    lui         $a0, 0x8008
    lh          $a0, 0x2D96($a0)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5F39
    lui         $at, 0x8007
    sw          $v0, -0x4830($at)
    jal         func_800167FC
    addu        $a1, $s0, $zero
    lui         $a0, 0x8008
    lh          $a0, 0x4EE2($a0)
    j           func_800A7C18
    addiu       $a1, $s0, -0x3
.L800AC2F8:
    jal         func_800AAED4
    addiu       $a0, $zero, 0x8
    lui         $at, 0x8007
    sw          $v0, -0x4834($at)
    jal         func_800AAED4
    addiu       $a0, $zero, 0x9
    lui         $a0, 0x8008
    lh          $a0, 0x2D96($a0)
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5F3C
    lui         $at, 0x8007
    sw          $v0, -0x4830($at)
    jal         func_800167FC
    addu        $a1, $s0, $zero
    lui         $a0, 0x8008
    lh          $a0, 0x4EE2($a0)
    addiu       $a1, $s0, 0x3
    jal         func_800167FC
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    addiu       $v1, $zero, 0x40
    andi        $v0, $v0, 0xC0
    bne         $v0, $v1, .L800AC39C
    nop
    lui         $v0, 0x8008
    lhu         $v0, -0x5EAA($v0)
    beqz        $v0, .L800AC3D0
    nop
    lui         $v0, 0x8008
    lhu         $v0, -0x5ED6($v0)
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lw          $v0, 0x2E04($at)
    lui         $at, 0x8007
    sw          $v0, -0x4820($at)
    j           func_800A7CB4
    nop
.L800AC39C:
    lui         $v1, 0x8007
    lh          $v1, -0x4844($v1)
    bltz        $v1, .L800AC3D0
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, 0x2E04($at)
    lui         $at, 0x8007
    sw          $v0, -0x4820($at)
    j           func_800A7CB4
    nop
.L800AC3D0:
    lui         $at, 0x8007
    sw          $zero, -0x4820($at)
    lui         $at, 0x8007
    sw          $zero, -0x4824($at)
    addu        $s1, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, -0x5EAC
    lui         $s2, 0x8008
    addiu       $s2, $s2, -0x5EB8
.L800AC3F4:
    lhu         $a0, 0x0($s2)
    andi        $s0, $s1, 0xFFFF
    addu        $a1, $s0, $zero
    addiu       $s2, $s2, 0x2
    jal         func_800A84E0
    addiu       $s1, $s1, 0x1
    lhu         $a1, 0x0($s3)
    addu        $a0, $s0, $zero
    jal         func_800A9330
    addiu       $s3, $s3, 0x2
    sltiu       $v0, $s1, 0x2
    bnez        $v0, .L800AC3F4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DCC($at)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $at, 0x8007
    sw          $v0, -0x4810($at)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x2DCC($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    andi        $v0, $v0, 0xC0
    lui         $at, 0x8007
    sw          $v1, -0x480C($at)
    addiu       $v1, $zero, 0x40
    bne         $v0, $v1, .L800AC4EC
    addiu       $a0, $zero, -0x2
    lui         $v1, 0x8008
    lw          $v1, -0x5EF8($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8008
    lw          $v1, -0x5EF0($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    j           func_800A7DFC
    sw          $v0, 0x14($v1)
.L800AC4EC:
    lui         $v1, 0x8008
    lw          $v1, -0x5EF8($v1)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a0
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8008
    lw          $v1, -0x5EF0($v1)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a0
    sw          $v0, 0x14($v1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, -0x5EE4($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    addiu       $v1, $zero, 0x40
    andi        $v0, $v0, 0xC0
    bne         $v0, $v1, .L800AC564
    addiu       $a0, $zero, -0x2
    lui         $v1, 0x8008
    lw          $v1, -0x5EF4($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8008
    lw          $v1, -0x5EEC($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    j           func_800A7EE8
    sw          $v0, 0x14($v1)
.L800AC564:
    lui         $v1, 0x8008
    lw          $v1, -0x5EF4($v1)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a0
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8008
    lw          $v1, -0x5EEC($v1)
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a0
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8007
    lhu         $v1, -0x4858($v1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, -0x5EE2($at)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800AC60C
    nop
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    andi        $v0, $v1, 0x20
    bnez        $v0, .L800AC5E8
    addiu       $v0, $zero, 0x3C
    andi        $v1, $v1, 0x1200
    addiu       $v0, $zero, 0x1200
    bne         $v1, $v0, .L800AC5E8
    addiu       $v0, $zero, 0x10E
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0xE
    bnez        $v0, .L800AC5E8
    addiu       $v0, $zero, 0x10E
    addiu       $v0, $zero, 0x276
.L800AC5E8:
    lui         $at, 0x8008
    sh          $v0, -0x5E9C($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0xB4
    lui         $v1, 0x8008
    lhu         $v1, -0x5E9C($v1)
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sh          $v1, -0x5E9C($at)
.L800AC60C:
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    bgez        $v0, .L800AC62C
    nop
    lui         $a0, 0x8007
    lw          $a0, -0x47AC($a0)
    jal         func_800174EC
    nop
.L800AC62C:
    lui         $a0, 0x8007
    lw          $a0, -0x477C($a0)
    lui         $a1, 0x8007
    lw          $a1, -0x4774($a1)
    jal         func_8000D834
    nop
    lui         $v0, 0x8008
    lhu         $v0, -0x5E98($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sh          $v0, -0x5E98($at)
    j           func_800A8000
    nop
.L800AC660:
    blez        $s0, .L800AC6D0
    nop
.L800AC668:
    lui         $v0, 0x8008
    lw          $v0, -0x5F04($v0)
    lw          $a0, 0x20($v0)
    jal         func_800A82B0
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5F04($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5EFC($a0)
    sw          $v0, 0x20($v1)
    lw          $a0, 0x1C($a0)
    jal         func_800A82B0
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5EFC($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    sw          $v0, 0x1C($v1)
    lw          $a0, 0x20($a0)
    jal         func_800A82B0
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5F00($v1)
    addiu       $s0, $s0, -0x1
    bgtz        $s0, .L800AC668
    sw          $v0, 0x20($v1)
.L800AC6D0:
    lui         $v0, 0x8008
    lw          $v0, -0x5F04($v0)
    lui         $v1, 0x8008
    lw          $v1, -0x5EFC($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    lw          $s0, 0x20($v0)
    lw          $v0, 0x1C($v1)
    lw          $v1, 0x20($a0)
    or          $s0, $s0, $v0
    or          $s0, $s0, $v1
    bnez        $s0, .L800AC724
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
    jal         func_8003190C
    ori         $a0, $zero, 0xDF0E
    lui         $at, 0x8008
    sh          $zero, -0x5EA2($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EA4($at)
.L800AC724:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AC1D4

.text
.align 2
.set noreorder
.globl func_800B2968
.ent func_800B2968
func_800B2968:
    slti        $v0, $v1, 0x4
    bnez        $v0, .L800B2A30
    addu        $v0, $a0, $zero
    lui         $v1, 0x8008
    lhu         $v1, 0x2D94($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0x4EE0($v0)
    bne         $v1, $v0, .L800B2A10
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x402C
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x5
    bnel        $v1, $v0, .L800B2A2C
    addiu       $a0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B2A08
    addiu       $v0, $zero, 0x2
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xF10
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v0, 0x4($v0)
    slti        $v0, $v0, 0x11
    beqz        $v0, .L800B29FC
    nop
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2574
    jal         func_8002E65C
    addu        $a0, $s0, $zero
.L800B29FC:
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $v0, $zero, 0x2
.L800B2A08:
    bne         $v1, $v0, .L800B2A2C
    addiu       $a0, $zero, 0x1
.L800B2A10:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2574
    jal         func_8002E65C
    nop
    addiu       $a0, $zero, 0x1
.L800B2A2C:
    addu        $v0, $a0, $zero
.L800B2A30:
    bnez        $v0, .L800B2B2C
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7F3C($a0)
    andi        $v0, $a0, 0x4
    beqz        $v0, .L800B2A6C
    addiu       $v0, $zero, -0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20B8
    jal         func_8002E65C
    nop
    j           func_800AE408
    nop
.L800B2A6C:
    lui         $v1, 0x8009
    lh          $v1, -0x7F3A($v1)
    beq         $v1, $v0, .L800B2A94
    andi        $v0, $a0, 0x10
    bnez        $v0, .L800B2A94
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800B2AB4
    andi        $v0, $a0, 0x8
.L800B2A94:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2100
    jal         func_8002E65C
    nop
    j           func_800AE408
    nop
.L800B2AB4:
    beqz        $v0, .L800B2AD8
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0xA0
    slti        $v0, $v0, 0x320
    xori        $v0, $v0, 0x1
    negu        $v0, $v0
    j           func_800AE3D8
    ori         $v0, $v0, 0xA
.L800B2AD8:
    lui         $a1, 0x8008
    lw          $a1, 0x793C($a1)
    lui         $v0, 0x320
    beq         $a1, $v0, .L800B2AFC
    addiu       $v0, $zero, -0x1
    sll         $a0, $s3, 16
    sra         $a0, $a0, 16
    jal         func_800B932C
    sra         $a1, $a1, 16
.L800B2AFC:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    sll         $a1, $s5, 16
    sra         $a1, $a1, 16
    sll         $a2, $v0, 16
    sra         $a2, $a2, 16
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $a3, $s3, 16
    sra         $a3, $a3, 16
    jal         func_800AB074
    sw          $v0, 0x10($sp)
.L800B2B2C:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x8
    jal         func_800AE680
    nop
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x468C
    addiu       $a0, $v1, -0xC
    jal         func_8001AEA8
    sw          $v0, 0x0($v1)
    addiu       $a0, $zero, 0xA0
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4674
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    addiu       $a0, $zero, 0xA8
    addu        $a1, $zero, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463A($at)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x2
    lui         $at, 0x8007
    sh          $v0, -0x4638($at)
    jal         func_800DD6EC
    nop
    lw          $v0, 0x4($s2)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L800B2BD0
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x5280($a0)
    j           func_800AE4B8
    andi        $v1, $a0, 0xC0
.L800B2BD0:
    lui         $a0, 0x8008
    lhu         $a0, 0x57B2($a0)
    andi        $v1, $a0, 0xC0
    addiu       $v0, $zero, 0x40
    bnel        $v1, $v0, .L800B2C08
    andi        $a0, $a0, 0xFF3F
    andi        $v0, $a0, 0xFF3F
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x7F10($at)
    sb          $zero, 0x21($v0)
    andi        $a0, $a0, 0xFF3F
.L800B2C08:
    sll         $a0, $a0, 16
    addiu       $v0, $zero, 0x1E
    lui         $at, 0x8009
    sh          $v0, -0x7F78($at)
    lui         $at, 0x8009
    sh          $zero, -0x4C90($at)
    jal         func_80030B54
    sra         $a0, $a0, 16
    lui         $v1, 0x8007
    lh          $v1, -0x4638($v1)
    sll         $v1, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $v1, 0x6DEC($at)
    lui         $at, 0x8009
    sw          $v0, -0x6B88($at)
    lui         $at, 0x8008
    sh          $zero, 0x78D8($at)
    lui         $at, 0x8008
    sh          $zero, 0x580C($at)
    sw          $zero, 0x20($v1)
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B2968

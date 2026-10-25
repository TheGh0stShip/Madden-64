.text
.align 2
.set noreorder
.globl func_800B71FC
.ent func_800B71FC
func_800B71FC:
    addu        $s3, $zero, $zero
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    jal         func_8000BEE8
    addiu       $a0, $zero, 0x2
    andi        $v0, $s4, 0xFFFF
    bnez        $v0, . + 4 + (0x7B << 2)
    nop
    lui         $s6, 0x8009
    addiu       $s6, $s6, -0x49E0
    lui         $fp, 0x8009
    addiu       $fp, $fp, -0x6A68
    jal         func_80030910
    nop
    jal         func_800B7C80
    nop
    lui         $v0, 0x8007
    lw          $v0, -0x564C($v0)
    bnez        $v0, .L800B7268
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5A20
    jal         func_800B2DF8
    nop
.L800B7268:
    lw          $a0, 0x0($s6)
    jal         func_800BF644
    nop
    lw          $a0, 0x4($s6)
    jal         func_800BF644
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    andi        $v0, $v0, 0xC0
    beqz        $v0, .L800B72A8
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800B7304
    addu        $s0, $zero, $zero
.L800B72A8:
    jal         func_80030DF0
    nop
    addu        $s0, $v0, $zero
    andi        $v0, $s0, 0x1000
    beqz        $v0, .L800B72C8
    nop
    jal         func_800B7D98
    addiu       $s4, $zero, 0x1
.L800B72C8:
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800B7354
    andi        $v0, $s0, 0xFF3F
    beqz        $v0, .L800B7354
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
    j           func_800B2C30
    nop
.L800B72F4:
    jal         func_800B7D98
    addiu       $s4, $zero, 0x1
    j           func_800B2C30
    nop
.L800B7304:
    andi        $s2, $s7, 0xFF
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x6B70
.L800B7310:
    lw          $a0, 0x0($s1)
    addiu       $a3, $zero, -0x1
    beq         $a0, $a3, .L800B7354
    sll         $v0, $a0, 1
    addu        $v0, $v0, $fp
    lh          $v0, 0x0($v0)
    bnel        $v0, $s2, .L800B7348
    addiu       $s0, $s0, 0x1
    sll         $a0, $a0, 16
    jal         func_80030B54
    sra         $a0, $a0, 16
    andi        $v0, $v0, 0x1000
    bnez        $v0, .L800B72F4
    addiu       $s0, $s0, 0x1
.L800B7348:
    slti        $v0, $s0, 0x4
    bnez        $v0, .L800B7310
    addiu       $s1, $s1, 0x4
.L800B7354:
    lui         $a1, 0x8009
    lh          $a1, -0x5080($a1)
    xori        $v0, $a1, 0x1
    sltiu       $v0, $v0, 0x1
    or          $v0, $s5, $v0
    beql        $v0, $zero, . + 4 + (0x16 << 2)
    andi        $s0, $s4, 0xFFFF
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x599C
    lhu         $v0, 0x0($a0)
    addu        $s3, $v1, $s3
    ori         $v1, $v0, 0x100
    slti        $v0, $s3, 0x79
    bnez        $v0, . + 4 + (0xB << 2)
    sh          $v1, 0x0($a0)
    addiu       $v0, $zero, 0x1
    bnel        $a1, $v0, . + 4 + (0x5 << 2)
    addu        $s3, $zero, $zero
.end func_800B71FC

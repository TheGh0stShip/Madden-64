.text
.align 2
.set noreorder
.globl func_800AEB2C
.ent func_800AEB2C
func_800AEB2C:
    lui         $a2, 0x8008
    lh          $a2, 0x78D8($a2)
    addu        $a0, $v0, $zero
    beq         $v0, $a2, .L800AEBB4
    addu        $a1, $a2, $zero
    subu        $v0, $a1, $a0
    sll         $v0, $v0, 16
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    sra         $v0, $v0, 31
    ori         $v0, $v0, 0x1
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addu        $v0, $a0, $v1
    lui         $at, 0x8008
    sh          $v0, 0x580C($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v0, $a2, $v0
    sll         $v1, $v1, 16
    xor         $v1, $v1, $v0
    bgez        $v1, .L800AEB90
    nop
    lui         $at, 0x8008
    sh          $a1, 0x580C($at)
.L800AEB90:
    lui         $v0, 0x8007
    lh          $v0, -0x4638($v0)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x6DEC($at)
    lui         $v0, 0x8008
    lh          $v0, 0x580C($v0)
    sw          $v0, 0x20($v1)
.L800AEBB4:
    lui         $v0, 0x8009
    lhu         $v0, -0x4C90($v0)
    andi        $v0, $v0, 0x80
    bnez        $v0, .L800AEE2C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x7F78($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x7F78($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L800AEDFC
    addu        $v1, $s1, $zero
    jal         func_800209AC
    addu        $s0, $zero, $zero
    addu        $a0, $v0, $zero
    lw          $v0, 0x4($a0)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L800AEC24
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x5280($v1)
    j           func_800AA50C
    andi        $v0, $v1, 0xC0
.L800AEC24:
    lui         $v1, 0x8008
    lh          $v1, 0x57B2($v1)
    andi        $v0, $v1, 0xC0
    bnel        $v0, $zero, .L800AECFC
    addiu       $a0, $zero, -0xC1
    lui         $v0, 0x8009
    lh          $v0, -0x7F78($v0)
    slti        $v0, $v0, -0x78
    beqz        $v0, .L800AED5C
    andi        $v0, $s0, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x7F50($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x7768($v0)
    beq         $v1, $v0, .L800AEC8C
    nop
    lw          $v0, 0x4($a0)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beq         $v1, $v0, .L800AECD8
    nop
    jal         func_800DD28C
    addiu       $a0, $zero, 0x4
    j           func_800AA5C0
    sll         $v0, $v0, 16
.L800AEC8C:
    lw          $v0, 0x4($a0)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lbu         $v0, 0x1E($v0)
    lh          $a0, 0x10($a0)
    xor         $v0, $v0, $v1
    beq         $a0, $v1, .L800AECC0
    sltu        $v0, $zero, $v0
    xori        $v0, $v0, 0x1
    beqz        $v0, .L800AECD8
    nop
    j           func_800AA5A4
    nop
.L800AECC0:
    beqz        $v0, .L800AECD8
    nop
    jal         func_800DD28C
    addiu       $a0, $zero, 0x4
    j           func_800AA5C0
    sll         $v0, $v0, 16
.L800AECD8:
    jal         func_800DD524
    addiu       $a0, $zero, 0x4
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    addiu       $v0, $zero, 0xFE
    beql        $v1, $v0, .L800AECF4
    addiu       $s0, $zero, 0x2
.L800AECF4:
    j           func_800AA634
    ori         $s0, $s0, 0x4
.L800AECFC:
    and         $a0, $v1, $a0
    sll         $a0, $a0, 16
    lui         $at, 0x8009
    sh          $zero, -0x7F78($at)
    jal         func_80030B54
    sra         $a0, $a0, 16
    lui         $v1, 0x8009
    lw          $v1, -0x6B88($v1)
    addu        $a0, $v0, $zero
    nor         $v1, $zero, $v1
    and         $v1, $a0, $v1
    andi        $v0, $v1, 0x800
    beqz        $v0, .L800AED3C
    andi        $v0, $v1, 0x400
    j           func_800AA620
    addiu       $s0, $zero, 0x1
.L800AED3C:
    bnel        $v0, $zero, .L800AED44
    addiu       $s0, $zero, 0x2
.L800AED44:
    andi        $v0, $v1, 0xC004
    bnel        $v0, $zero, .L800AED50
    ori         $s0, $s0, 0x4
.L800AED50:
    lui         $at, 0x8009
    sw          $a0, -0x6B88($at)
    andi        $v0, $s0, 0x1
.L800AED5C:
    beqz        $v0, .L800AED98
    addiu       $v0, $zero, 0xD
    lui         $v1, 0x8008
    lh          $v1, 0x78D8($v1)
    bne         $v1, $v0, .L800AED80
    addiu       $a0, $zero, 0x27
    addiu       $a1, $zero, 0x69
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
.L800AED80:
    lui         $at, 0x8009
    sh          $zero, -0x4C90($at)
    lui         $at, 0x8008
    sh          $zero, 0x78D8($at)
    j           func_800AA6BC
    andi        $v0, $s0, 0x4
.L800AED98:
    andi        $v0, $s0, 0x2
    beqz        $v0, .L800AEDE0
    andi        $v0, $s0, 0x4
    lui         $v0, 0x8008
    lh          $v0, 0x78D8($v0)
    bnez        $v0, .L800AEDC8
    addiu       $v0, $zero, 0x1
    addiu       $a0, $zero, 0x27
    addiu       $a1, $zero, 0x69
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
    addiu       $v0, $zero, 0x1
.L800AEDC8:
    lui         $at, 0x8009
    sh          $v0, -0x4C90($at)
    addiu       $v0, $zero, 0xD
    lui         $at, 0x8008
    sh          $v0, 0x78D8($at)
    andi        $v0, $s0, 0x4
.L800AEDE0:
    beqz        $v0, .L800AEDF8
    addiu       $a0, $zero, 0x28
    addiu       $a1, $zero, 0x69
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
    addiu       $s1, $zero, 0x1
.L800AEDF8:
    addu        $v1, $s1, $zero
.L800AEDFC:
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800AEE88
    addiu       $v1, $zero, 0x14
    lui         $v0, 0x8009
    lhu         $v0, -0x4C90($v0)
    lui         $at, 0x8009
    sh          $v1, -0x7F78($at)
    ori         $v0, $v0, 0x80
    lui         $at, 0x8009
    sh          $v0, -0x4C90($at)
    j           func_800AA764
    nop
.L800AEE2C:
    lui         $v0, 0x8009
    lhu         $v0, -0x7F78($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x7F78($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L800AEE88
    nop
    jal         func_800AE560
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x4C90($v0)
    andi        $v0, $v0, 0xFF7F
    bnez        $v0, .L800AEE80
    nop
    jal         func_8002062C
    nop
    j           func_800AA764
    nop
.L800AEE80:
    jal         func_80020938
    nop
.L800AEE88:
    lui         $at, 0x8008
    sh          $zero, -0x17F4($at)
    addu        $s1, $zero, $zero
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x6AD0
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x5818
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x2D94
    addiu       $s6, $s5, 0x214C
    addiu       $s4, $zero, 0x2D
    sll         $v0, $s1, 16
    sra         $v1, $v0, 16
    sltiu       $v0, $v1, 0x8
    beqz        $v0, . + 4 + (0x117 << 2)
    addiu       $v0, $s1, 0x1
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xEC0($at)
    jr          $v0
    nop
.end func_800AEB2C

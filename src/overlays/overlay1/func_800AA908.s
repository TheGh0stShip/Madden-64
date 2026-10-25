.text
.align 2
.set noreorder
.globl func_800AA908
.ent func_800AA908
func_800AA908:
    addu        $t0, $a0, $zero
    lw          $v0, 0x2C($t0)
    lw          $v1, 0xB0($t0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800AA928
    addu        $t6, $zero, $zero
    sw          $v1, 0x2C($t0)
    sw          $zero, 0x3C($t0)
.L800AA928:
    lw          $v0, 0x2C($t0)
    lw          $v1, 0xB4($t0)
    slt         $v0, $v1, $v0
    beqz        $v0, .L800AA944
    nop
    sw          $v1, 0x2C($t0)
    sw          $zero, 0x3C($t0)
.L800AA944:
    lw          $v0, 0x30($t0)
    lw          $v1, 0xB8($t0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800AA960
    nop
    sw          $v1, 0x30($t0)
    sw          $zero, 0x40($t0)
.L800AA960:
    lw          $v0, 0x30($t0)
    lw          $v1, 0xBC($t0)
    slt         $v0, $v1, $v0
    beqz        $v0, .L800AA97C
    nop
    sw          $v1, 0x30($t0)
    sw          $zero, 0x40($t0)
.L800AA97C:
    lw          $v1, 0x34($t0)
    lui         $v0, 0x13
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L800AA9A0
    addiu       $t4, $zero, 0x2
    lui         $v0, 0x14
    sw          $v0, 0x34($t0)
    sw          $zero, 0x44($t0)
.L800AA9A0:
    addiu       $t3, $t0, 0x34
    addiu       $t1, $t0, 0x24
    addiu       $a3, $t0, 0x44
    addiu       $t2, $t0, 0x50
    addiu       $t5, $t0, 0x58
.L800AA9B4:
    lw          $a1, 0x0($t3)
    lw          $v1, 0x0($t1)
    lh          $v0, 0x0($t5)
    lw          $a0, 0x0($a3)
    subu        $a1, $a1, $v1
    srav        $v0, $a1, $v0
    addu        $a0, $a0, $v0
    bgez        $a1, .L800AA9FC
    sw          $a0, 0x0($a3)
    lh          $v0, 0x0($t2)
    negu        $a2, $a1
    srav        $v1, $a2, $v0
    negu        $v0, $a0
    slt         $v0, $v0, $v1
    bnez        $v0, .L800AAA14
    nor         $v0, $zero, $v1
    j           func_800A62F0
    sw          $v0, 0x0($a3)
.L800AA9FC:
    lh          $v0, 0x0($t2)
    srav        $v1, $a1, $v0
    slt         $v0, $a0, $v1
    bnez        $v0, .L800AAA14
    addiu       $v0, $v1, 0x1
    sw          $v0, 0x0($a3)
.L800AAA14:
    lw          $v0, 0x0($t1)
    lw          $v1, 0x0($a3)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($t1)
    lw          $v1, 0x0($t3)
    subu        $v0, $v1, $v0
    xor         $v0, $a1, $v0
    bgtz        $v0, .L800AAA44
    addu        $a0, $t4, $zero
    addiu       $t6, $t6, 0x1
    sw          $v1, 0x0($t1)
    sw          $zero, 0x0($a3)
.L800AAA44:
    addiu       $t3, $t3, -0x4
    addiu       $t1, $t1, -0x4
    addiu       $a3, $a3, -0x4
    addiu       $t2, $t2, -0x2
    addiu       $t5, $t5, -0x2
    bnez        $a0, .L800AA9B4
    addiu       $t4, $t4, -0x1
    addiu       $t4, $zero, 0x2
    addiu       $a0, $t0, 0x70
    addiu       $t1, $t0, 0x60
    addiu       $a3, $t0, 0x68
    addiu       $t3, $t0, 0x78
    addiu       $t2, $t0, 0x80
.L800AAA78:
    lhu         $v0, 0x0($a3)
    andi        $v0, $v0, 0xFFF
    sh          $v0, 0x0($a3)
    lh          $v1, 0x0($t1)
    subu        $a1, $v0, $v1
    slti        $v0, $a1, 0x800
    bnez        $v0, .L800AAAA0
    slti        $v0, $a1, -0x7FF
    j           func_800A6384
    addiu       $a1, $a1, -0x1000
.L800AAAA0:
    bnel        $v0, $zero, .L800AAAA8
    addiu       $a1, $a1, 0x1000
.L800AAAA8:
    bgez        $a1, .L800AAAF0
    negu        $a2, $a1
    lhu         $v0, 0x0($a0)
    lh          $v1, 0x0($t2)
    addiu       $v0, $v0, -0x1
    srav        $v1, $a2, $v1
    subu        $v0, $v0, $v1
    sh          $v0, 0x0($a0)
    lh          $v1, 0x0($t3)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    negu        $v0, $v0
    srav        $v1, $a2, $v1
    slt         $v0, $v0, $v1
    bnez        $v0, .L800AAB28
    nor         $v0, $zero, $v1
    j           func_800A6404
    sh          $v0, 0x0($a0)
.L800AAAF0:
    lhu         $v0, 0x0($a0)
    lh          $v1, 0x0($t2)
    addiu       $v0, $v0, 0x1
    srav        $v1, $a1, $v1
    addu        $v0, $v0, $v1
    sh          $v0, 0x0($a0)
    lh          $v1, 0x0($t3)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srav        $v1, $a1, $v1
    slt         $v0, $v0, $v1
    bnez        $v0, .L800AAB28
    addiu       $v0, $v1, 0x1
    sh          $v0, 0x0($a0)
.L800AAB28:
    lhu         $v1, 0x0($t1)
    lhu         $v0, 0x0($a0)
    addu        $v1, $v1, $v0
    andi        $v1, $v1, 0xFFF
    sh          $v1, 0x0($t1)
    lh          $v0, 0x0($a3)
    subu        $v1, $v0, $v1
    slti        $v0, $v1, 0x800
    bnez        $v0, .L800AAB58
    slti        $v0, $v1, -0x7FF
    j           func_800A643C
    addiu       $v1, $v1, -0x1000
.L800AAB58:
    bnel        $v0, $zero, .L800AAB60
    addiu       $v1, $v1, 0x1000
.L800AAB60:
    xor         $v0, $a1, $v1
    bgtzl       $v0, .L800AAB80
    addiu       $a0, $a0, -0x2
    lhu         $v0, 0x0($a3)
    addiu       $t6, $t6, 0x1
    sh          $v0, 0x0($t1)
    sh          $zero, 0x0($a0)
    addiu       $a0, $a0, -0x2
.L800AAB80:
    addiu       $t1, $t1, -0x2
    addiu       $a3, $a3, -0x2
    addiu       $t3, $t3, -0x2
    addiu       $t2, $t2, -0x2
    addu        $v0, $t4, $zero
    bnez        $v0, .L800AAA78
    addiu       $t4, $t4, -0x1
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x6
    bne         $v0, $v1, .L800AABBC
    nop
    lhu         $v0, 0x84($t0)
    andi        $v0, $v0, 0xFFD7
    sh          $v0, 0x84($t0)
.L800AABBC:
    jr          $ra
    nop
.end func_800AA908

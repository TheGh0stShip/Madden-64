.text
.align 2
.set noreorder
.globl audio_bank_process
.ent audio_bank_process
audio_bank_process:
    addiu       $sp, $sp, -0x68
    sw          $s5, 0x54($sp)
    addu        $s5, $a0, $zero
    sw          $ra, 0x64($sp)
    sw          $fp, 0x60($sp)
    sw          $s7, 0x5C($sp)
    sw          $s6, 0x58($sp)
    sw          $s4, 0x50($sp)
    sw          $s3, 0x4C($sp)
    sw          $s2, 0x48($sp)
    sw          $s1, 0x44($sp)
    sw          $s0, 0x40($sp)
    sw          $a2, 0x14($sp)
    lw          $v0, 0x0($a2)
    lhu         $t0, 0x7A($sp)
    addu        $s2, $a1, $zero
    addu        $s4, $zero, $zero
    sh          $a3, 0x1E($sp)
    blez        $v0, .L8003DE74
    sh          $t0, 0x26($sp)
.L8003DE48:
    lw          $t0, 0x14($sp)
    andi        $v0, $s4, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t0
    sw          $zero, 0x4($v0)
    lw          $v1, 0x0($t0)
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L8003DE48
    nop
.L8003DE74:
    jal         func_8004DF94
    addu        $a0, $s5, $zero
    addu        $s3, $s5, $zero
    sh          $v0, 0x2E($sp)
    lhu         $v0, 0x2E($sp)
    lhu         $fp, 0x2E($sp)
    beqz        $v0, .L8003DEF8
    addu        $s4, $zero, $zero
    addiu       $s7, $zero, 0x7E
    ori         $s1, $zero, 0xFFC0
    addu        $s0, $v0, $zero
.L8003DEA0:
    lbu         $v0, 0x0($s3)
    bne         $v0, $s7, .L8003DEE4
    addiu       $s3, $s3, 0x1
    lbu         $v0, 0x0($s3)
    addu        $s6, $v0, $s1
    andi        $v0, $s6, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $a0, 0x0($v0)
    addiu       $s4, $s4, 0x1
    beqz        $a0, .L8003DEE4
    addiu       $s3, $s3, 0x1
    jal         func_8004DF94
    nop
    lhu         $t0, 0x2E($sp)
    addu        $t0, $t0, $v0
    sh          $t0, 0x2E($sp)
.L8003DEE4:
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $s0
    bnez        $v0, .L8003DEA0
    nop
.L8003DEF8:
    lhu         $t0, 0x2E($sp)
    addiu       $t0, $t0, 0x1
    sh          $t0, 0x2E($sp)
    lhu         $a1, 0x2E($sp)
    jal         func_80032E00
    addu        $a0, $zero, $zero
    sw          $v0, 0x34($sp)
    lw          $s7, 0x34($sp)
    addu        $s3, $s5, $zero
    andi        $v0, $fp, 0xFFFF
    beqz        $v0, .L8003DFD4
    addu        $s4, $zero, $zero
    addu        $fp, $v0, $zero
.L8003DF2C:
    lbu         $v0, 0x0($s3)
    addiu       $t0, $zero, 0x7E
    bne         $v0, $t0, .L8003DFC0
    addiu       $s3, $s3, 0x1
    subu        $v0, $s3, $s5
    addiu       $v0, $v0, -0x1
    addu        $s1, $v0, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L8003DF68
    addu        $a0, $s7, $zero
    addu        $a1, $s5, $zero
    andi        $s0, $s1, 0xFFFF
    jal         func_8004DF68
    addu        $a2, $s0, $zero
    addu        $s7, $s7, $s0
.L8003DF68:
    andi        $v0, $s1, 0xFFFF
    lbu         $v1, 0x0($s3)
    addiu       $v0, $v0, 0x2
    addu        $s5, $s5, $v0
    ori         $t0, $zero, 0xFFC0
    addu        $s6, $v1, $t0
    andi        $v0, $s6, 0xFFFF
    sll         $v0, $v0, 2
    addu        $s1, $v0, $s2
    lw          $a0, 0x0($s1)
    addiu       $s4, $s4, 0x1
    beqz        $a0, .L8003DFC0
    addiu       $s3, $s3, 0x1
    jal         func_8004DF94
    nop
    andi        $s0, $v0, 0xFFFF
    beqz        $s0, .L8003DFBC
    addu        $a0, $s7, $zero
    lw          $a1, 0x0($s1)
    jal         func_8004DF68
    addu        $a2, $s0, $zero
.L8003DFBC:
    addu        $s7, $s7, $s0
.L8003DFC0:
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $fp
    bnez        $v0, .L8003DF2C
    nop
.L8003DFD4:
    subu        $v0, $s3, $s5
    addu        $s1, $v0, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L8003DFFC
    addu        $a0, $s7, $zero
    addu        $a1, $s5, $zero
    andi        $s0, $s1, 0xFFFF
    jal         func_8004DF68
    addu        $a2, $s0, $zero
    addu        $s7, $s7, $s0
.L8003DFFC:
    sb          $zero, 0x0($s7)
    lw          $s5, 0x34($sp)
    lw          $a0, 0x34($sp)
    lw          $s3, 0x34($sp)
    lw          $s7, 0x34($sp)
    jal         func_8004DF94
    addu        $s6, $zero, $zero
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x2E($sp)
    lhu         $v0, 0x2E($sp)
    beqz        $v0, .L8003E1FC
    addu        $s4, $zero, $zero
    lhu         $t0, 0x1E($sp)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x3C($sp)
.L8003E03C:
    lbu         $a0, 0x0($s3)
    xori        $v0, $a0, 0x20
    sltiu       $v0, $v0, 0x1
    sltiu       $v1, $a0, 0x1
    or          $v0, $v0, $v1
    bnez        $v0, .L8003E064
    subu        $v0, $s3, $s5
    addiu       $t0, $zero, 0x7C
    bne         $a0, $t0, .L8003E1E4
    nop
.L8003E064:
    addu        $s1, $v0, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L8003E1E4
    addu        $fp, $zero, $zero
    addu        $a0, $zero, $zero
    andi        $s0, $s1, 0xFFFF
    jal         func_80032E00
    addiu       $a1, $s0, 0x1
    addu        $a0, $v0, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $s0, $zero
    lw          $t0, 0x14($sp)
    andi        $v0, $s6, 0xFFFF
    sll         $v0, $v0, 2
    addu        $s2, $v0, $t0
    jal         func_8004DF68
    sw          $a0, 0x4($s2)
    lw          $v0, 0x4($s2)
    addu        $v0, $v0, $s0
    sb          $zero, 0x0($v0)
    lhu         $t0, 0x26($sp)
    lw          $a1, 0x4($s2)
    sll         $a0, $t0, 16
    jal         func_80016A24
    sra         $a0, $a0, 16
    lw          $t0, 0x3C($sp)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $t0, $v0
    beqz        $v0, .L8003E128
    addu        $a0, $zero, $zero
    lw          $a1, 0x4($s2)
    subu        $s1, $s7, $s5
    jal         func_80032F3C
    addiu       $s6, $s6, 0x1
    addu        $a0, $zero, $zero
    andi        $s0, $s1, 0xFFFF
    jal         func_80032E00
    addiu       $a1, $s0, 0x1
    addu        $a0, $v0, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $s0, $zero
    jal         func_8004DF68
    sw          $a0, 0x4($s2)
    lw          $v0, 0x4($s2)
    addiu       $fp, $zero, 0x1
    addiu       $s5, $s7, 0x1
    addu        $v0, $v0, $s0
    sb          $zero, 0x0($v0)
.L8003E128:
    lbu         $a0, 0x0($s3)
    sltiu       $v1, $a0, 0x1
    xori        $v0, $a0, 0x7C
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8003E1BC
    sltu        $v0, $s5, $s3
    bnel        $v0, $zero, .L8003E164
    andi        $v0, $fp, 0xFFFF
    addiu       $t0, $zero, 0x7C
    bne         $a0, $t0, .L8003E1E4
    addiu       $v0, $s3, -0x1
    sltu        $v0, $s5, $v0
    beqz        $v0, .L8003E1E4
    andi        $v0, $fp, 0xFFFF
.L8003E164:
    beqz        $v0, .L8003E1AC
    subu        $s1, $s3, $s5
    addu        $a0, $zero, $zero
    andi        $s1, $s1, 0xFFFF
    jal         func_80032E00
    addiu       $a1, $s1, 0x1
    addu        $a0, $v0, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $s1, $zero
    lw          $t0, 0x14($sp)
    andi        $s0, $s6, 0xFFFF
    sll         $s0, $s0, 2
    addu        $s0, $s0, $t0
    jal         func_8004DF68
    sw          $a0, 0x4($s0)
    lw          $v0, 0x4($s0)
    addu        $v0, $v0, $s1
    sb          $zero, 0x0($v0)
.L8003E1AC:
    addu        $s7, $s3, $zero
    addiu       $s5, $s3, 0x1
    j .L8003E1E4
    addiu       $s6, $s6, 0x1
.L8003E1BC:
    andi        $v0, $fp, 0xFFFF
    bnez        $v0, .L8003E1E4
    andi        $v0, $s6, 0xFFFF
    lw          $t0, 0x14($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t0
    lw          $a1, 0x4($v0)
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addu        $s7, $s3, $zero
.L8003E1E4:
    lhu         $v1, 0x2E($sp)
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8003E03C
    addiu       $s3, $s3, 0x1
.L8003E1FC:
    lw          $a1, 0x34($sp)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x64($sp)
    lw          $fp, 0x60($sp)
    lw          $s7, 0x5C($sp)
    lw          $s6, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end audio_bank_process

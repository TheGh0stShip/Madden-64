.text
.align 2
.set noreorder
.globl gameplay_event_dispatch
.ent gameplay_event_dispatch
gameplay_event_dispatch:
    addiu       $sp, $sp, -0x70
    sw          $fp, 0x68($sp)
    addu        $fp, $a1, $zero
    sw          $s7, 0x64($sp)
    addu        $s7, $zero, $zero
    sw          $s4, 0x58($sp)
    addu        $s4, $zero, $zero
    sw          $s2, 0x50($sp)
    addu        $s2, $zero, $zero
    sw          $s5, 0x5C($sp)
    addu        $s5, $zero, $zero
    sh          $a0, 0x16($sp)
    addu        $a0, $zero, $zero
    sw          $ra, 0x6C($sp)
    sw          $s6, 0x60($sp)
    sw          $s3, 0x54($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    sh          $fp, 0x26($sp)
    sw          $zero, 0x2C($sp)
    sw          $zero, 0x34($sp)
    sh          $zero, 0x3E($sp)
    jal         func_800AD77C
    sw          $zero, 0x44($sp)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6D5C
    addu        $s6, $v0, $zero
    sb          $zero, 0x0($v0)
    sh          $zero, 0x1E($sp)
.L80026344:
    lhu         $a0, 0x1E($sp)
    jal         func_800C6010
    nop
    addu        $s3, $v0, $zero
    lbu         $v0, 0x0($s3)
    addiu       $v1, $v0, -0x2
    sltiu       $v0, $v1, 0x20
    beqz        $v0, .L80027114
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x10F8($at)
    jr          $v0
    nop
    lhu         $t1, 0x26($sp)
    negu        $s5, $s5
    negu        $t1, $t1
    j .L80027114
    sh          $t1, 0x26($sp)
    lhu         $s5, 0x4($s3)
    lw          $s3, 0xC($s3)
    addu        $s2, $zero, $zero
    addu        $s4, $zero, $zero
    sw          $s3, 0x34($sp)
    j .L80027114
    sh          $s5, 0x26($sp)
    lw          $s4, 0xC($s3)
    addiu       $a2, $zero, 0x3
    addiu       $a3, $zero, 0x1
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $s2, $zero, 0x5
    jal         func_80025794
    addu        $s7, $s4, $zero
    j .L80027114
    nop
    lw          $s4, 0xC($s3)
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x1D
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L8002641C
    addu        $a0, $s4, $zero
    addiu       $v0, $zero, 0x4
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $zero, 0x1($s6)
    addiu       $t1, $zero, 0xFF
    sb          $v0, 0x2($s6)
    sb          $t1, 0x3($s6)
.L8002641C:
    j .L80027114
    addiu       $s2, $zero, 0x1E
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    lw          $s4, 0xC($s3)
    bnez        $v0, .L80026448
    addiu       $a2, $zero, 0x17
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    j .L80026450
    addiu       $a2, $zero, 0x1A
.L80026448:
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
.L80026450:
    addiu       $a3, $zero, 0x1
    jal         func_80025794
    addiu       $s2, $zero, 0x28
    lhu         $s5, 0x4($s3)
    j .L80027114
    nop
    lw          $s4, 0xC($s3)
    lhu         $s5, 0x4($s3)
    j .L80027114
    addu        $s2, $zero, $zero
    beqz        $s4, .L80026588
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x22
    beq         $v1, $v0, .L80026554
    slti        $v0, $v1, 0x23
    beqz        $v0, .L800264AC
    addiu       $v0, $zero, 0xA
    beq         $v1, $v0, .L800264C0
    addiu       $v0, $zero, 0xE
    beq         $v1, $v0, .L800264E8
    sll         $s0, $s5, 16
    j .L80026574
    nop
.L800264AC:
    addiu       $v0, $zero, 0x25
    beq         $v1, $v0, .L8002652C
    ori         $v0, $zero, 0x8000
    bne         $v1, $v0, .L80026574
    nop
.L800264C0:
    lh          $a1, 0x4($s3)
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027A58
    sra         $a1, $v0, 16
    j .L80026574
    nop
.L800264E8:
    lh          $a1, 0x4($s3)
    sra         $s0, $s0, 16
    jal         func_800278D8
    addu        $a0, $s0, $zero
    addu        $a0, $s7, $zero
    sll         $v0, $v0, 16
    jal         func_80027908
    sra         $a1, $v0, 16
    lh          $a1, 0x4($s3)
    jal         func_800278D8
    addu        $a0, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027994
    sra         $a1, $v0, 16
    j .L80026574
    nop
.L8002652C:
    lh          $a1, 0x4($s3)
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027B34
    sra         $a1, $v0, 16
    j .L80026574
    nop
.L80026554:
    lh          $a1, 0x4($s3)
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027BB8
    sra         $a1, $v0, 16
.L80026574:
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0xC
    jal         func_80025794
    addiu       $a3, $zero, 0x1
.L80026588:
    addiu       $s2, $zero, 0x7FFF
    lhu         $s5, 0x4($s3)
    addiu       $t1, $zero, 0x1
    addiu       $v0, $zero, 0x5
    sh          $t1, 0x3E($sp)
    j .L80026608
    sw          $zero, 0x44($sp)
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x7
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0x3
    jal         func_80025944
    addiu       $a2, $zero, 0x1
    lw          $s4, 0xC($s3)
    addiu       $s2, $zero, 0x30
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x14
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addiu       $a0, $zero, 0x4
    addu        $a1, $zero, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $s7, $zero
    lhu         $s5, 0x4($s3)
    addiu       $t1, $zero, 0x2
    addiu       $v0, $zero, 0x6
    sh          $t1, 0x3E($sp)
.L80026608:
    sb          $v0, 0x0($s6)
    addiu       $v0, $zero, 0xFF
    sb          $zero, 0x1($s6)
    sb          $v0, 0x2($s6)
    j .L80027114
    sb          $v0, 0x3($s6)
    beqz        $s4, .L80026644
    nop
    lw          $v0, 0xC($s3)
    lbu         $a0, 0x1E($s4)
    lbu         $v0, 0x1E($v0)
    beq         $a0, $v0, .L80026668
    addiu       $a1, $zero, 0x3
    j .L80026660
    nop
.L80026644:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80026668
    addiu       $a1, $zero, 0x3
    lui         $a0, 0x8009
    lhu         $a0, -0x7920($a0)
.L80026660:
    jal         func_80025944
    addiu       $a2, $zero, 0x1
.L80026668:
    lhu         $s5, 0x4($s3)
    beqz        $s4, .L80026684
    addiu       $a0, $zero, 0x12
    lw          $a3, 0xC($s3)
    addu        $a1, $zero, $zero
    j .L800266DC
    addu        $a2, $s4, $zero
.L80026684:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800266A8
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    j .L800266B0
    nop
.L800266A8:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
.L800266B0:
    lw          $a3, 0xC($s3)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a2, 0x5040($at)
    addiu       $a0, $zero, 0x12
    addu        $a1, $zero, $zero
.L800266DC:
    jal         func_800AD5D0
    addiu       $s2, $zero, 0x16
    lw          $s4, 0xC($s3)
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x16
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lw          $t1, 0x44($sp)
    beqz        $t1, .L80027114
    addiu       $a2, $zero, 0x15
    lbu         $a0, 0x1E($t1)
    lbu         $a1, 0x1F($t1)
    j .L80026DF0
    nop
    lw          $s4, 0xC($s3)
    j .L80027114
    ori         $s2, $zero, 0x8000
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x4
    addiu       $a3, $zero, 0x1
    jal         func_80025794
    addiu       $s2, $zero, 0xE
    lw          $s4, 0xC($s3)
    j .L80027114
    nop
    lw          $s4, 0xC($s3)
    andi        $v1, $s2, 0xFFFF
    ori         $v0, $zero, 0x8000
    beql        $v1, $v0, .L80027114
    addiu       $s2, $zero, 0xA
    j .L80027114
    nop
    lh          $a0, 0x4($s3)
    sll         $v0, $s5, 16
    sra         $s1, $v0, 16
    jal         func_800278D8
    addu        $a1, $s1, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lhu         $v0, 0x4($s3)
    addiu       $v0, $v0, 0x31F
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x13F
    beqz        $v0, .L800267B0
    addiu       $a2, $zero, 0x1F
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
.L800267B0:
    addu        $s0, $s4, $zero
    lw          $s4, 0xC($s3)
    lh          $a0, 0x4($s3)
    addiu       $s2, $zero, 0x25
    jal         func_800278D8
    addu        $a1, $s1, $zero
    j .L80026854
    addiu       $a0, $zero, 0xD
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x1E
    bne         $v1, $v0, .L8002682C
    addu        $s0, $s4, $zero
    lh          $a0, 0x4($s3)
    sll         $a1, $s5, 16
    jal         func_800278D8
    sra         $a1, $a1, 16
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lhu         $v0, 0x4($s3)
    addiu       $v0, $v0, 0x31F
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x13F
    beqz        $v0, .L80026828
    addiu       $a2, $zero, 0x1F
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
.L80026828:
    addu        $s0, $s4, $zero
.L8002682C:
    lw          $s4, 0xC($s3)
    lbu         $v1, 0x1E($s0)
    lbu         $v0, 0x1E($s4)
    beq         $v1, $v0, .L80026874
    sll         $a1, $s5, 16
    lh          $a0, 0x4($s3)
    sra         $a1, $a1, 16
    jal         func_800278D8
    addiu       $s2, $zero, 0x22
    addiu       $a0, $zero, 0xE
.L80026854:
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    addu        $a2, $s0, $zero
    jal         func_800AD5D0
    addu        $a3, $s4, $zero
    lhu         $s5, 0x4($s3)
    j .L80027114
    nop
.L80026874:
    lhu         $t1, 0x26($sp)
    lh          $v1, 0x4($s3)
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, -0x140
    slt         $v0, $v0, $v1
    beqz        $v0, .L80026898
    addiu       $a0, $zero, 0x15
    addiu       $a0, $zero, 0x14
.L80026898:
    addu        $a1, $zero, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addiu       $s2, $zero, 0x32
    addiu       $t1, $zero, 0x3
    j .L80027114
    sh          $t1, 0x3E($sp)
    addu        $s2, $zero, $zero
    addiu       $a0, $zero, 0x9
    addu        $a1, $zero, $zero
    addu        $a2, $s7, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addu        $a0, $s7, $zero
    addiu       $v0, $zero, 0x2
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $zero, 0x1($s6)
    sb          $v0, 0x2($s6)
    addiu       $v0, $zero, 0xFF
    j .L80027114
    sb          $v0, 0x3($s6)
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L80026910
    sll         $a0, $s5, 16
    addiu       $a0, $zero, 0x6
    j .L80026CCC
    addu        $a1, $zero, $zero
.L80026910:
    lui         $a1, 0x8008
    lh          $a1, 0x5E5C($a1)
    jal         func_800278D8
    sra         $a0, $a0, 16
    addiu       $a0, $zero, 0x8
    sll         $s0, $v0, 16
    sra         $s0, $s0, 16
    addu        $a1, $s0, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addu        $a0, $s4, $zero
    addiu       $v0, $zero, 0x7
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $s0, 0x1($s6)
    sb          $v0, 0x2($s6)
    j .L80027114
    sb          $zero, 0x3($s6)
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L8002698C
    addu        $s2, $zero, $zero
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x1B
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addiu       $a0, $zero, 0x5
    j .L80026CCC
    addu        $a1, $zero, $zero
.L8002698C:
    lui         $a1, 0x8008
    lh          $a1, 0x5E5C($a1)
    sll         $s1, $s5, 16
    sra         $s1, $s1, 16
    jal         func_800278D8
    addu        $a0, $s1, $zero
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x18
    addiu       $a3, $zero, 0x1
    sll         $s0, $v0, 16
    jal         func_80025794
    sra         $s0, $s0, 16
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x28
    jal         func_80025794
    addu        $a3, $s0, $zero
    addiu       $a0, $zero, 0x7
    addu        $a1, $s0, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lui         $a1, 0x8008
    lh          $a1, 0x5E5C($a1)
    jal         func_800278D8
    addu        $a0, $s1, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x7
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    jal         func_8002950C
    sra         $a3, $v0, 24
    addu        $a0, $s4, $zero
    addiu       $v0, $zero, 0x7
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $s0, 0x1($s6)
    sb          $v0, 0x2($s6)
    addiu       $v0, $zero, 0x1
    j .L80027114
    sb          $v0, 0x3($s6)
    addiu       $a0, $zero, 0x11
    addu        $a1, $zero, $zero
    lw          $a2, 0xC($s3)
    addu        $a3, $zero, $zero
    jal         func_800AD5D0
    addu        $s2, $zero, $zero
    lh          $a1, 0x4($s3)
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027A58
    sra         $a1, $v0, 16
    j .L80027114
    nop
    lbu         $v0, 0x1($s3)
    addiu       $t1, $zero, 0xFF
    beq         $v0, $t1, .L80026C7C
    addiu       $v0, $zero, 0x3
    lw          $v0, 0xC($s3)
    beqz        $v0, .L80026AE8
    addiu       $a2, $zero, 0x10
    lbu         $a0, 0x1E($v0)
    lbu         $a1, 0x1F($v0)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lw          $t1, 0xC($s3)
    sw          $t1, 0x2C($sp)
.L80026AE8:
    beqz        $s4, .L80026F80
    xori        $v0, $s2, 0x8000
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    sltiu       $v0, $v0, 0x1
    nor         $v1, $zero, $v1
    sltu        $v1, $zero, $v1
    and         $v1, $v1, $v0
    beqz        $v1, .L80026F84
    andi        $v1, $s2, 0xFFFF
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L80026F88
    addiu       $v0, $zero, 0x25
    lhu         $t1, 0x26($sp)
    lh          $a1, 0x4($s3)
    sll         $a0, $t1, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    sll         $v0, $v0, 16
    bgez        $v0, .L80026F84
    andi        $v1, $s2, 0xFFFF
    lbu         $v0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $a0, 0x2DC0($at)
    jal         func_80022078
    nop
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L80026F84
    andi        $v1, $s2, 0xFFFF
    lw          $v0, 0xC($s3)
    lbu         $a0, 0x1E($v0)
    lbu         $a1, 0x1F($v0)
    addiu       $a2, $zero, 0x11
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x8
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addiu       $a0, $zero, 0x3
    lw          $a2, 0xC($s3)
    addu        $a1, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $s4, $zero
    lhu         $t1, 0x26($sp)
    addu        $a0, $zero, $zero
    subu        $s1, $fp, $t1
    sll         $s1, $s1, 16
    sra         $s1, $s1, 16
    jal         func_800B932C
    addu        $a1, $s1, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0x1
    addu        $s2, $v0, $zero
    sll         $s0, $s2, 16
    sra         $s0, $s0, 16
    jal         func_80025944
    addu        $a2, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addu        $a1, $zero, $zero
    jal         func_80025944
    addu        $a2, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xA
    jal         func_80025944
    addu        $a2, $s0, $zero
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x5
    jal         func_80025794
    addu        $a3, $s0, $zero
    addiu       $a0, $zero, 0x1
    addu        $a1, $s1, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addu        $a0, $s4, $zero
    addiu       $v0, $zero, 0x2
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $s2, 0x1($s6)
    sb          $v0, 0x2($s6)
    lw          $a0, 0xC($s3)
    jal         func_800297FC
    addiu       $s2, $zero, 0x7FFF
    j .L80026F80
    sb          $v0, 0x3($s6)
.L80026C7C:
    lw          $v1, 0x8($s3)
    beq         $v1, $v0, .L80027048
    addiu       $a0, $zero, 0xA
    lw          $s3, 0xC($s3)
    j .L80027114
    sw          $s3, 0x44($sp)
    lw          $v0, 0xC($s3)
    beqz        $v0, .L80026CAC
    addiu       $a0, $zero, 0xE
    addiu       $a1, $zero, 0x7FFF
    j .L80026FFC
    addu        $a2, $s4, $zero
.L80026CAC:
    lh          $a0, 0x4($s3)
    sll         $a1, $s5, 16
    sra         $a1, $a1, 16
    jal         func_800278D8
    addiu       $s2, $zero, 0x7FFF
    addiu       $a0, $zero, 0xE
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
.L80026CCC:
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    j .L80027114
    nop
    andi        $a1, $s2, 0xFFFF
    lhu         $a0, 0x3E($sp)
    xori        $v1, $a1, 0x30
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x2
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L80026D10
    addu        $a2, $s4, $zero
    addiu       $a0, $zero, 0x4
    j .L80027050
    addiu       $a1, $zero, 0x7FFF
.L80026D10:
    xori        $v1, $a1, 0x16
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x1
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    bnez        $v1, .L80027114
    nop
    lw          $v0, 0xC($s3)
    beqz        $v0, .L80026D40
    addu        $s2, $zero, $zero
    j .L80026FF4
    addiu       $a0, $zero, 0xD
.L80026D40:
    lh          $a1, 0x4($s3)
    sll         $v0, $s5, 16
    sra         $s0, $v0, 16
    slt         $v0, $s0, $a1
    beql        $v0, $zero, .L80026D7C
    addu        $a0, $a1, $zero
    jal         func_800278D8
    addu        $a0, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lh          $a1, 0x4($s3)
    j .L80026D9C
    addu        $a0, $s0, $zero
.L80026D7C:
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lh          $a0, 0x4($s3)
    addu        $a1, $s0, $zero
.L80026D9C:
    jal         func_800278D8
    nop
    addiu       $a0, $zero, 0xD
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, 0xD
    addiu       $a1, $zero, 0x7FFF
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lhu         $v0, 0x4($s3)
    addiu       $v0, $v0, 0x31F
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x13F
    beqz        $v0, .L80027114
    addiu       $a2, $zero, 0x1F
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
.L80026DF0:
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    j .L80027114
    nop
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L80026E58
    addiu       $v0, $zero, 0x1E
    lw          $v0, 0xC($s3)
    bnez        $v0, .L80026E58
    addiu       $v0, $zero, 0x1E
    addiu       $a0, $zero, 0x9
    addu        $a1, $zero, $zero
    addu        $a2, $s7, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addu        $a0, $s7, $zero
    addiu       $v0, $zero, 0x2
    sb          $v0, 0x0($s6)
    jal         func_800297FC
    sb          $zero, 0x1($s6)
    sb          $v0, 0x2($s6)
    addiu       $v0, $zero, 0xFF
    sb          $v0, 0x3($s6)
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x1E
.L80026E58:
    bne         $v1, $v0, .L80026F28
    andi        $v0, $s2, 0xFFFF
    lw          $v0, 0xC($s3)
    bnez        $v0, .L80026F28
    andi        $v0, $s2, 0xFFFF
    lh          $a1, 0x4($s3)
    sll         $v0, $s5, 16
    sra         $s0, $v0, 16
    slt         $v0, $s0, $a1
    beql        $v0, $zero, .L80026EA8
    addu        $a0, $a1, $zero
    jal         func_800278D8
    addu        $a0, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lh          $a1, 0x4($s3)
    j .L80026EC8
    addu        $a0, $s0, $zero
.L80026EA8:
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027C3C
    sra         $a1, $v0, 16
    lh          $a0, 0x4($s3)
    addu        $a1, $s0, $zero
.L80026EC8:
    jal         func_800278D8
    nop
    addiu       $a0, $zero, 0xD
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, 0xD
    addiu       $a1, $zero, 0x7FFE
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lhu         $v0, 0x4($s3)
    addiu       $v0, $v0, 0x31F
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x13F
    beqz        $v0, .L80026F24
    addiu       $a2, $zero, 0x1F
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
.L80026F24:
    andi        $v0, $s2, 0xFFFF
.L80026F28:
    xori        $v1, $v0, 0x7FFF
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x16
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80026F80
    addiu       $v0, $zero, 0x1
    lhu         $v1, 0x3E($sp)
    bnel        $v1, $v0, .L80026F84
    andi        $v1, $s2, 0xFFFF
    lw          $v0, 0xC($s3)
    bnel        $v0, $zero, .L80026F84
    andi        $v1, $s2, 0xFFFF
    beqz        $s4, .L80026F70
    addiu       $a0, $zero, 0x12
    addu        $a1, $zero, $zero
    j .L80026F78
    addu        $a2, $s4, $zero
.L80026F70:
    lw          $a2, 0x34($sp)
    addu        $a1, $zero, $zero
.L80026F78:
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
.L80026F80:
    andi        $v1, $s2, 0xFFFF
.L80026F84:
    addiu       $v0, $zero, 0x25
.L80026F88:
    bnel        $v1, $v0, .L80026FC8
    andi        $v1, $s2, 0xFFFF
    lh          $v0, 0x4($s3)
    slti        $v0, $v0, -0x320
    beql        $v0, $zero, .L80026FC8
    andi        $v1, $s2, 0xFFFF
    lui         $v0, 0x8008
    lh          $v0, 0x7AF0($v0)
    bltz        $v0, .L80026FC4
    addiu       $a0, $zero, 0xD
    addiu       $a1, $zero, 0x7FFF
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    addiu       $s2, $zero, 0x7FFF
.L80026FC4:
    andi        $v1, $s2, 0xFFFF
.L80026FC8:
    addiu       $v0, $zero, 0x22
    bne         $v1, $v0, .L80027114
    nop
    lh          $v0, 0x4($s3)
    slti        $v0, $v0, -0x320
    beqz        $v0, .L80027114
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AF0($v0)
    bltz        $v0, .L80027114
    addiu       $a0, $zero, 0xE
.L80026FF4:
    addiu       $a1, $zero, 0x7FFF
    addu        $a2, $zero, $zero
.L80026FFC:
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    j .L80027114
    addiu       $s2, $zero, 0x7FFF
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x5
    beq         $v1, $v0, .L8002702C
    addiu       $v0, $zero, 0x1E
    beq         $v1, $v0, .L80027060
    addiu       $a2, $zero, 0x20
    j .L80027114
    nop
.L8002702C:
    lw          $v0, 0xC($s3)
    lbu         $a0, 0x1E($v0)
    lbu         $a1, 0x1F($v0)
    addiu       $a2, $zero, 0x27
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addiu       $a0, $zero, 0xA
.L80027048:
    lw          $a2, 0xC($s3)
    addu        $a1, $zero, $zero
.L80027050:
    jal         func_800AD5D0
    addu        $a3, $s7, $zero
    j .L80027114
    nop
.L80027060:
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a3, $zero, 0x1
    addu        $s2, $zero, $zero
    jal         func_80025794
    addu        $s4, $zero, $zero
    j .L80027114
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800270C0
    addiu       $a2, $zero, 0x19
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0x1C
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addiu       $a0, $zero, 0x13
    lbu         $a1, 0x1E($s4)
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    j .L80027100
    addu        $s2, $zero, $zero
.L800270C0:
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800270F0
    addiu       $a0, $zero, 0x3A
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
    j .L80027100
    addu        $s2, $zero, $zero
.L800270F0:
    addiu       $a1, $zero, 0xE
    jal         func_80041DD4
    addiu       $a2, $zero, 0xB4
    addu        $s2, $zero, $zero
.L80027100:
    j .L80027114
    addu        $s4, $zero, $zero
    lhu         $t1, 0x16($sp)
    addiu       $t1, $t1, 0x1
    sh          $t1, 0x1E($sp)
.L80027114:
    lhu         $t1, 0x1E($sp)
    lhu         $v0, 0x16($sp)
    addiu       $t1, $t1, 0x1
    sh          $t1, 0x1E($sp)
    lhu         $v1, 0x1E($sp)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L80026344
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x25
    beq         $v1, $v0, .L800276B0
    slti        $v0, $v1, 0x26
    beqz        $v0, .L80027184
    addiu       $v0, $zero, 0xE
    beq         $v1, $v0, .L80027580
    slti        $v0, $v1, 0xF
    beqz        $v0, .L80027168
    addiu       $v0, $zero, 0xA
    beq         $v1, $v0, .L800271BC
    sll         $v0, $s5, 16
    j .L800278A4
    nop
.L80027168:
    addiu       $v0, $zero, 0x16
    beq         $v1, $v0, .L8002737C
    addiu       $v0, $zero, 0x22
    beq         $v1, $v0, .L80027778
    sll         $v0, $s5, 16
    j .L800278A4
    nop
.L80027184:
    addiu       $v0, $zero, 0x32
    beq         $v1, $v0, .L8002783C
    slti        $v0, $v1, 0x33
    beqz        $v0, .L800271A8
    addiu       $v0, $zero, 0x30
    beq         $v1, $v0, .L800272E4
    sll         $v0, $fp, 16
    j .L800278A4
    nop
.L800271A8:
    addiu       $v0, $zero, 0x7FFF
    beq         $v1, $v0, .L800278A4
    ori         $v0, $zero, 0x8000
    bne         $v1, $v0, .L800278A4
    sll         $v0, $s5, 16
.L800271BC:
    sra         $s1, $v0, 16
    addu        $a0, $s1, $zero
    sll         $v0, $fp, 16
    sra         $s0, $v0, 16
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027A58
    sra         $a1, $v0, 16
    slti        $v0, $s0, 0x320
    bnez        $v0, .L800272C4
    addiu       $a0, $zero, 0x1
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    addiu       $a2, $zero, 0xB
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lhu         $v1, 0x3E($sp)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80027224
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L80027240
    addu        $a0, $s1, $zero
    j .L80027258
    sll         $a0, $s5, 16
.L80027224:
    addu        $a0, $s1, $zero
    jal         func_800278D8
    addu        $a1, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    j .L80027274
    addiu       $a2, $zero, 0x5
.L80027240:
    jal         func_800278D8
    addu        $a1, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    j .L80027274
    addiu       $a2, $zero, 0x6
.L80027258:
    sra         $a0, $a0, 16
    sll         $a1, $fp, 16
    jal         func_800278D8
    sra         $a1, $a1, 16
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x1
.L80027274:
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    jal         func_8002950C
    sra         $a3, $v0, 24
    addiu       $a0, $zero, 0x1
.L800272C4:
    subu        $a1, $fp, $s5
    sll         $a1, $a1, 16
    lw          $a3, 0x2C($sp)
    sra         $a1, $a1, 16
    jal         func_800AD5D0
    addu        $a2, $s4, $zero
    j .L800278A4
    nop
.L800272E4:
    sra         $a1, $v0, 16
    slti        $v0, $a1, 0x320
    bnez        $v0, .L8002735C
    addiu       $a0, $zero, 0x1
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x6
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    jal         func_8002950C
    sra         $a3, $v0, 24
    addiu       $a0, $zero, 0x1
.L8002735C:
    subu        $a1, $fp, $s5
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    j .L800278A4
    nop
.L8002737C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800273A0
    nop
    lui         $s0, 0x8009
    lh          $s0, -0x7920($s0)
    j .L800273A8
    nop
.L800273A0:
    lui         $s0, 0x8009
    lh          $s0, -0x751C($s0)
.L800273A8:
    lhu         $t1, 0x3E($sp)
    bnez        $t1, .L80027408
    sll         $v0, $fp, 16
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v1, 0x2DC0($at)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800273F4
    addiu       $a0, $zero, 0x17
    addiu       $a0, $zero, 0x16
.L800273F4:
    addu        $a1, $zero, $zero
    addu        $a2, $s4, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    sll         $v0, $fp, 16
.L80027408:
    sra         $a1, $v0, 16
    slti        $v0, $a1, 0x320
    bnez        $v0, .L800278A4
    nop
    lhu         $t1, 0x3E($sp)
    beqz        $t1, .L80027484
    sll         $a0, $s5, 16
    jal         func_800278D8
    sra         $a0, $a0, 16
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x5
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L80027484:
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v1, 0x2DC0($at)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L80027520
    nop
    jal         func_800278D8
    sra         $a0, $a0, 16
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0xA
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L80027520:
    jal         func_800278D8
    sra         $a0, $a0, 16
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0xB
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L80027580:
    sll         $v0, $s5, 16
    sra         $s1, $v0, 16
    addu        $a0, $s1, $zero
    sll         $v0, $fp, 16
    sra         $s0, $v0, 16
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s7, $zero
    sll         $v0, $v0, 16
    jal         func_80027908
    sra         $a1, $v0, 16
    addu        $a0, $s1, $zero
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027994
    sra         $a1, $v0, 16
    addiu       $a0, $zero, 0x2
    subu        $a1, $fp, $s5
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a2, $s7, $zero
    jal         func_800AD5D0
    addu        $a3, $s4, $zero
    slti        $v0, $s0, 0x320
    bnez        $v0, .L800278A4
    addiu       $a2, $zero, 0xF
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    lbu         $a0, 0x1E($s7)
    lbu         $a1, 0x1F($s7)
    addiu       $a2, $zero, 0x6
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addu        $a0, $s1, $zero
    jal         func_800278D8
    addu        $a1, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a2, $zero, 0x2
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0x1860
    lbu         $a3, 0x1E($s7)
    lbu         $a1, 0x1F($s7)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t0
    sll         $a1, $a1, 1
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v1, $a3, 5
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a3
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t0
    addu        $a1, $a1, $v1
    lbu         $a1, 0x1($a1)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L800276B0:
    sll         $v0, $s5, 16
    sra         $s1, $v0, 16
    addu        $a0, $s1, $zero
    sll         $v0, $fp, 16
    sra         $s0, $v0, 16
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027B34
    sra         $a1, $v0, 16
    addiu       $a0, $zero, 0xD
    subu        $a1, $fp, $s5
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $s4, $zero
    slti        $v0, $s0, 0x320
    bnez        $v0, .L800278A4
    addiu       $a2, $zero, 0x26
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addu        $a0, $s1, $zero
    jal         func_800278D8
    addu        $a1, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x4
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L80027778:
    sra         $s1, $v0, 16
    addu        $a0, $s1, $zero
    sll         $v0, $fp, 16
    sra         $s0, $v0, 16
    jal         func_800278D8
    addu        $a1, $s0, $zero
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 16
    jal         func_80027BB8
    sra         $a1, $v0, 16
    addiu       $a0, $zero, 0xE
    subu        $a1, $fp, $s5
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $s4, $zero
    slti        $v0, $s0, 0x320
    bnez        $v0, .L800278A4
    addiu       $a2, $zero, 0x23
    lbu         $a0, 0x1E($s4)
    lbu         $a1, 0x1F($s4)
    jal         func_80025794
    addiu       $a3, $zero, 0x1
    addu        $a0, $s1, $zero
    jal         func_800278D8
    addu        $a1, $s0, $zero
    lbu         $a0, 0x1E($s4)
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0x3
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lbu         $a0, 0x1F($s4)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v1
    lbu         $a0, 0x1($a0)
    sll         $v0, $v0, 24
    j .L8002789C
    sra         $a3, $v0, 24
.L8002783C:
    sll         $v0, $fp, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x320
    bnez        $v0, .L800278A4
    addiu       $a1, $zero, 0xFF
    lbu         $v1, 0x1E($s4)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x1860
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lbu         $v1, 0x1F($s4)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $v0
    lbu         $a0, 0x1($v1)
    addiu       $a2, $zero, 0xC
    addiu       $a3, $zero, -0x1
.L8002789C:
    jal         func_8002950C
    nop
.L800278A4:
    lw          $ra, 0x6C($sp)
    lw          $fp, 0x68($sp)
    lw          $s7, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end gameplay_event_dispatch

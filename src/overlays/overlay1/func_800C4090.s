.text
.align 2
.set noreorder
.globl func_800C4090
.ent func_800C4090
func_800C4090:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x2C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x30($sp)
    sw          $s0, 0x28($sp)
    lw          $s0, 0x10($s1)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lui         $at, 0x8008
    sw          $s0, 0x76CC($at)
    bne         $s0, $v0, .L800C4124
    lui         $v0, 0x6
    ori         $v0, $v0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
    jal         func_800A6580
    nop
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $v0, $v1, .L800C40F4
    addiu       $v1, $zero, 0x40
    lbu         $v0, 0x21($s0)
    andi        $v0, $v0, 0xC0
    beq         $v0, $v1, .L800C412C
    nop
.L800C40F4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800C4114
    addiu       $v0, $zero, 0x13
    lbu         $v1, 0x64($s0)
    bne         $v1, $v0, .L800C412C
    nop
.L800C4114:
    lbu         $v0, 0x1B($s0)
    bnez        $v0, .L800C4124
    addiu       $v0, $zero, 0x2D
    addiu       $v0, $zero, 0x2C
.L800C4124:
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C412C:
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L800C4160
    nop
    lw          $v0, 0x24($s0)
    lw          $v1, 0x2C($v0)
    lw          $v0, 0x30($v0)
    or          $v1, $v1, $v0
    beqz        $v1, .L800C4160
    nop
    lw          $v0, 0x2C($s0)
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C4160:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x24($s0)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0xA8($s0)
    lw          $v0, 0x20($v1)
    addu        $a0, $s0, $zero
    jal         func_80020B78
    sw          $v0, 0xAC($s0)
    jal         func_8002117C
    addu        $a0, $s0, $zero
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800C41B0
    nop
    lh          $v0, 0x48($s0)
    bnez        $v0, .L800C41E0
    nop
    lh          $v0, 0x4A($s0)
    j           func_800BFAA0
    addu        $v1, $v0, $zero
.L800C41B0:
    lh          $v0, 0x4C($s0)
    bnez        $v0, .L800C41E0
    nop
    lh          $v0, 0x4A($s0)
    addu        $v1, $v0, $zero
    slti        $v0, $v0, 0x7000
    beqz        $v0, .L800C41E0
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $v0, $v1, $v0
    sh          $v0, 0x4A($s0)
.L800C41E0:
    jal         func_800E199C
    addu        $a0, $s0, $zero
    lw          $v0, 0x24($s0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    addu        $a0, $s1, $zero
    sh          $zero, 0x32($s0)
    jal         func_800B8C90
    sh          $zero, 0x3E($v0)
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L800C4378
    addiu       $v0, $zero, 0x6
    jal         func_800B98F4
    addu        $a0, $s1, $zero
    lw          $v0, 0x14($s1)
    lui         $v1, 0x1
    and         $v0, $v0, $v1
    bnez        $v0, .L800C4258
    nop
    lh          $v0, 0x4A($s0)
    slti        $v0, $v0, 0xA
    beqz        $v0, .L800C4248
    lui         $v0, 0xF
    ori         $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C4248:
    lui         $a1, 0x8008
    lw          $a1, 0x7B60($a1)
    jal         func_800C0C8C
    addu        $a0, $s0, $zero
.L800C4258:
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x2E
    beq         $v1, $v0, .L800C42CC
    sltiu       $v0, $v1, 0x2F
    beqz        $v0, .L800C4298
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800C42CC
    sltiu       $v0, $v1, 0x2
    bnez        $v0, .L800C45E0
    sltiu       $v0, $v1, 0xB
    beqz        $v0, .L800C45E0
    sltiu       $v0, $v1, 0x9
    beqz        $v0, .L800C42CC
    nop
    j           func_800BFEBC
    nop
.L800C4298:
    lui         $v0, 0x6
    beq         $v1, $v0, .L800C42CC
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800C42C0
    lui         $v0, 0x6
    addiu       $v0, $zero, 0x39
    beq         $v1, $v0, .L800C42CC
    nop
    j           func_800BFEBC
    nop
.L800C42C0:
    ori         $v0, $v0, 0x8
    bne         $v1, $v0, .L800C45E0
    nop
.L800C42CC:
    lw          $a0, 0x24($s0)
    lw          $v1, 0xA8($s0)
    lw          $v0, 0xAC($s0)
    lw          $a1, 0x1C($a0)
    lw          $a0, 0x20($a0)
    subu        $v1, $v1, $a1
    subu        $v0, $v0, $a0
    sra         $t6, $v1, 8
    sra         $t7, $v1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    sra         $t6, $v0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    jal         func_8002E99C
    addu        $a0, $v1, $a0
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $a1, 0x2
    ori         $a1, $a1, 0x3A75
    .word       0x00650018  # mult        $v1, $a1
    .word       0x00002812  # mflo        $a1
    jal         func_8002E7A0
    addu        $a0, $v0, $zero
    lui         $v1, 0x1
    subu        $a1, $v1, $v0
    bgez        $a1, .L800C4358
    sra         $a1, $a1, 14
    j           func_800BFC40
    addu        $a1, $zero, $zero
.L800C4358:
    slti        $v0, $a1, 0x3
    beql        $v0, $zero, .L800C4364
    addiu       $a1, $zero, 0x2
.L800C4364:
    lw          $a0, 0x24($s0)
    jal         func_800340A0
    nop
    j           func_800BFEBC
    nop
.L800C4378:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    bne         $v1, $v0, .L800C4390
    nop
    jal         func_800B98F4
    addu        $a0, $s1, $zero
.L800C4390:
    lw          $v0, 0x24($s1)
    bnez        $v0, .L800C45E0
    lui         $v1, 0x2
    lw          $v0, 0x14($s1)
    and         $v0, $v0, $v1
    bnez        $v0, .L800C45E0
    nop
    lbu         $a1, 0x2D($s0)
    lw          $a0, 0x2C($s0)
    slti        $v0, $a1, 0x2E
    beqz        $v0, .L800C43CC
    addu        $v1, $zero, $zero
    slti        $v0, $a1, 0x2B
    xori        $v0, $v0, 0x1
    sll         $v1, $v0, 1
.L800C43CC:
    bnez        $v1, .L800C4438
    addiu       $v0, $zero, 0x1
    addiu       $v0, $zero, 0x35
    beq         $a0, $v0, .L800C4430
    sltiu       $v0, $a0, 0x36
    beqz        $v0, .L800C4400
    addiu       $v0, $zero, 0x13
    beq         $a0, $v0, .L800C4430
    addiu       $v0, $zero, 0x2A
    beq         $a0, $v0, .L800C4434
    addiu       $v1, $zero, 0x1
    j           func_800BFD10
    addu        $v1, $zero, $zero
.L800C4400:
    addiu       $v0, $zero, 0x3A
    beq         $a0, $v0, .L800C4430
    sltiu       $v0, $a0, 0x3B
    beqz        $v0, .L800C4424
    addiu       $v0, $zero, 0x38
    beq         $a0, $v0, .L800C4434
    addiu       $v1, $zero, 0x1
    j           func_800BFD10
    addu        $v1, $zero, $zero
.L800C4424:
    addiu       $v0, $zero, 0x302
    bne         $a0, $v0, .L800C4434
    addu        $v1, $zero, $zero
.L800C4430:
    addiu       $v1, $zero, 0x2
.L800C4434:
    addiu       $v0, $zero, 0x1
.L800C4438:
    beq         $v1, $v0, .L800C4458
    slti        $v0, $v1, 0x2
    beqz        $v0, .L800C45E0
    nop
    beqz        $v1, .L800C4464
    nop
    j           func_800BFEBC
    nop
.L800C4458:
    addu        $a0, $s0, $zero
    j           func_800BFEB4
    addiu       $a1, $zero, 0x13
.L800C4464:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beq         $s0, $v0, .L800C4554
    lui         $v1, 0x2E
    lhu         $v0, 0x28($s0)
    ori         $v1, $v1, 0x3
    lui         $at, 0x8008
    sw          $v1, 0x7B60($at)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800C44A4
    addiu       $v0, $zero, 0x1E
    lbu         $v1, 0x64($s0)
    bne         $v1, $v0, .L800C44A4
    addiu       $v0, $zero, 0x3A
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C44A4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800C44F4
    nop
    lbu         $v1, 0x64($s0)
    addiu       $v0, $v1, -0x2B
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C44EC
    addiu       $v0, $zero, 0x3A
    andi        $v0, $v1, 0xFF
    xori        $v1, $v0, 0x2D
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x19
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800C44F4
    addiu       $v0, $zero, 0x3A
.L800C44EC:
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C44F4:
    lh          $v0, 0x4A($s0)
    slti        $v0, $v0, 0xA
    beqz        $v0, .L800C4510
    lui         $v0, 0xF
    ori         $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
.L800C4510:
    lw          $v1, 0x2C($s0)
    lui         $a1, 0x8008
    lw          $a1, 0x7B60($a1)
    beq         $v1, $a1, .L800C45E0
    lui         $v0, 0x2E
    ori         $v0, $v0, 0x3
    bne         $a1, $v0, .L800C45D8
    addu        $a0, $s0, $zero
    srl         $v0, $v1, 16
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x2E
    beq         $v0, $v1, .L800C45E0
    nop
    jal         func_800C0D00
    addiu       $a1, $zero, 0x2E
    j           func_800BFEBC
    nop
.L800C4554:
    lui         $a0, 0x8008
    lw          $a0, 0x7B60($a0)
    addiu       $v0, $a0, -0x2C
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C4584
    xori        $v1, $a0, 0x19
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0xC
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800C45C0
    lui         $v0, 0x2F
.L800C4584:
    lw          $v0, 0x2C($s0)
    xori        $v1, $v0, 0x60
    sltu        $v1, $zero, $v1
    xori        $v0, $v0, 0x5F
    sltu        $v0, $zero, $v0
    or          $v1, $v1, $v0
    beqz        $v1, .L800C45E0
    nop
    lbu         $v0, 0x1B($s0)
    bnez        $v0, .L800C45B8
    addu        $a0, $s0, $zero
    j           func_800BFEB4
    addiu       $a1, $zero, 0x60
.L800C45B8:
    j           func_800BFEB4
    addiu       $a1, $zero, 0x5F
.L800C45C0:
    lw          $v1, 0x2C($s0)
    ori         $v0, $v0, 0x29
    beq         $v1, $v0, .L800C45E0
    addu        $a0, $s0, $zero
    lui         $a1, 0x2F
    ori         $a1, $a1, 0x29
.L800C45D8:
    jal         func_800C0BBC
    nop
.L800C45E0:
    lw          $v1, 0x24($s0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x20
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lhu         $v0, 0x30($s0)
    sll         $v1, $v1, 1
    subu        $v0, $v0, $v1
    sh          $v0, 0x30($s0)
    sll         $v0, $v0, 16
    bltzl       $v0, .L800C4614
    sh          $zero, 0x30($s0)
.L800C4614:
    lh          $v0, 0x30($s0)
    slti        $v0, $v0, 0x51
    bnez        $v0, .L800C4628
    addiu       $v0, $zero, 0x50
    sh          $v0, 0x30($s0)
.L800C4628:
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    bne         $v1, $s0, .L800C4664
    nop
    lw          $v0, 0x24($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x24($v1)
    lw          $v0, 0x20($v0)
    jal         func_800B9820
    sw          $v0, 0x20($a0)
    jal         func_800C2368
    nop
.L800C4664:
    lui         $at, 0x8008
    sw          $zero, 0x76CC($at)
    lw          $ra, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800C4090

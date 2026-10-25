.text
.align 2
.set noreorder
.globl runtime_input_process
.ent runtime_input_process
runtime_input_process:
    addiu       $sp, $sp, -0x48
    sw          $s7, 0x3C($sp)
    lui         $s7, 0x8009
    addiu       $s7, $s7, -0x6C98
    sw          $fp, 0x40($sp)
    lui         $fp, 0x8009
    addiu       $fp, $fp, -0x4D78
    sw          $s5, 0x34($sp)
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x49A0
    sw          $s4, 0x30($sp)
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x6F60
    sw          $s6, 0x38($sp)
    addiu       $s6, $zero, -0xF
    sw          $ra, 0x44($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
.L800320D8:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0xA80
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x6184($v1)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x79E0($at)
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    beqz        $v1, .L80032120
    nop
    jalr        $v1
    nop
.L80032120:
    lui         $v0, 0x8008
    lw          $v0, 0x502C($v0)
    bne         $v0, $s7, .L800320D8
    nop
    lui         $v0, 0x8007
    lw          $v0, 0x2320($v0)
    bnez        $v0, .L800320D8
    nop
    lui         $v0, 0x8007
    lw          $v0, 0x2324($v0)
    beqz        $v0, .L80032160
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8007
    sw          $v0, 0x2320($at)
    j .L800320D8
    nop
.L80032160:
    addu        $a0, $fp, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x6A54
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x5
    addu        $a1, $fp, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x6DA8($v1)
    addu        $v0, $v1, $zero
    beqz        $v0, .L80032438
    addiu       $v1, $v1, -0x1
    addu        $s3, $v1, $zero
.L8003219C:
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lb          $s1, 0x6DE4($at)
    sll         $v0, $s1, 2
    addu        $s2, $v0, $s5
    lw          $a0, 0x0($s2)
    andi        $v0, $a0, 0x1
    beqz        $v0, .L80032430
    addu        $v0, $s3, $zero
    andi        $v0, $a0, 0x4
    beqz        $v0, .L8003228C
    addiu       $v0, $zero, -0x5
    and         $a1, $a0, $v0
    sw          $a1, 0x0($s2)
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lb          $v1, -0x6D2C($at)
    beqz        $v1, .L80032238
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v0, 0x2300($at)
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6D68($at)
    lw          $v1, 0x0($s2)
    andi        $v0, $v1, 0x2
    bnez        $v0, .L80032298
    ori         $v0, $v1, 0xA
    sw          $v0, 0x0($s2)
    sll         $a0, $s1, 1
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 3
    jal         func_80048320
    addu        $a0, $a0, $s4
    j .L8003227C
    nop
.L80032238:
    andi        $v0, $a0, 0x8
    beqz        $v0, .L80032430
    addu        $v0, $s3, $zero
    and         $v0, $a1, $s6
    sw          $v0, 0x0($s2)
    sll         $s0, $s1, 1
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 3
    addu        $s0, $s0, $s4
    jal         func_800481B8
    addu        $a0, $s0, $zero
    jal         func_800481B8
    addu        $a0, $s0, $zero
    jal         func_800481B8
    addu        $a0, $s0, $zero
.L8003227C:
    bnel        $v0, $zero, .L8003242C
    sw          $zero, 0x0($s2)
    j .L80032430
    addu        $v0, $s3, $zero
.L8003228C:
    andi        $v0, $a0, 0x2
    beqz        $v0, .L80032430
    addu        $v0, $s3, $zero
.L80032298:
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lb          $v0, -0x6A2C($at)
    bltz        $v0, .L800323D8
    addu        $v1, $v0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800322CC
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6A2C($at)
.L800322CC:
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lb          $v0, -0x6D68($at)
    beqz        $v0, .L8003242C
    addu        $v1, $v0, $zero
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6D68($at)
    sll         $v0, $v0, 24
    bnel        $v0, $zero, .L80032430
    addu        $v0, $s3, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lb          $v1, -0x6D2C($at)
    beqz        $v1, .L800323C0
    sll         $v0, $s1, 2
    addu        $s0, $v0, $s5
    lw          $v0, 0x0($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L80032370
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v0, 0x2301($at)
    sll         $a0, $s1, 1
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6D68($at)
    lw          $v1, 0x0($s0)
    addu        $a0, $a0, $s4
    addiu       $v0, $zero, -0x9
    and         $v1, $v1, $v0
    jal         func_800481B8
    sw          $v1, 0x0($s0)
    j .L800323B0
    nop
.L80032370:
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v0, 0x2300($at)
    sll         $a0, $s1, 1
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $s1
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6D68($at)
    lw          $v0, 0x0($s0)
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s4
    ori         $v0, $v0, 0x8
    jal         func_80048320
    sw          $v0, 0x0($s0)
.L800323B0:
    bnel        $v0, $zero, .L8003242C
    sw          $zero, 0x0($s0)
    j .L80032430
    addu        $v0, $s3, $zero
.L800323C0:
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sb          $v0, -0x6A2C($at)
    j .L80032430
    addu        $v0, $s3, $zero
.L800323D8:
    sll         $s0, $s1, 1
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 3
    addu        $s0, $s0, $s4
    jal         func_800481B8
    addu        $a0, $s0, $zero
    jal         func_800481B8
    addu        $a0, $s0, $zero
    jal         func_800481B8
    addu        $a0, $s0, $zero
    beqz        $v0, .L80032418
    sll         $v0, $s1, 2
    addu        $v0, $v0, $s5
    sw          $zero, 0x0($v0)
.L80032418:
    sll         $v1, $s1, 2
    addu        $v1, $v1, $s5
    lw          $v0, 0x0($v1)
    and         $v0, $v0, $s6
    sw          $v0, 0x0($v1)
.L8003242C:
    addu        $v0, $s3, $zero
.L80032430:
    bnez        $v0, .L8003219C
    addiu       $s3, $s3, -0x1
.L80032438:
    addiu       $a0, $zero, 0x5
    addu        $a1, $s7, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, 0x2320($at)
    jal         func_8004F258
    addu        $a0, $s7, $zero
    j .L800320D8
    nop
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end runtime_input_process

.text
.align 2
.set noreorder
.globl func_800B817C
.ent func_800B817C
func_800B817C:
    addiu       $sp, $sp, -0x38
    lui         $a1, 0x1
    ori         $a1, $a1, 0x5D70
    sw          $s5, 0x24($sp)
    addu        $s5, $zero, $zero
    sw          $s6, 0x28($sp)
    lui         $s6, 0x8008
    addiu       $s6, $s6, 0x5040
    sw          $s4, 0x20($sp)
    lui         $s4, 0xF
    ori         $s4, $s4, 0xFFFF
    andi        $a0, $a0, 0xFFFF
    sll         $v1, $a0, 4
    subu        $v1, $v1, $a0
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    sll         $v0, $v1, 4
    addiu       $v0, $v0, 0x2540
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    sw          $ra, 0x34($sp)
    sw          $fp, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    addu        $fp, $a0, $v0
    addu        $s7, $a0, $v1
    andi        $s3, $s5, 0xFFFF
.L800B81F4:
    sll         $s0, $s3, 2
    addu        $s0, $s0, $s6
    lw          $a0, 0x0($s0)
    jal         func_800B5DC0
    addu        $a1, $zero, $zero
    sll         $s2, $s3, 3
    addu        $s1, $s2, $fp
    lw          $v1, 0x0($s1)
    sll         $v0, $v0, 20
    and         $v1, $v1, $s4
    or          $v1, $v1, $v0
    sra         $v0, $v0, 20
    sw          $v1, 0x0($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5190($at)
    lw          $a0, 0x0($s0)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lw          $a0, 0x0($s1)
    lui         $v1, 0xFFF0
    ori         $v1, $v1, 0xFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    and         $a0, $a0, $v1
    andi        $v1, $v0, 0xFFF
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    sll         $v0, $v0, 20
    sra         $v0, $v0, 20
    sw          $a0, 0x0($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5192($at)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x24($v0)
    lh          $v1, 0x24($v0)
    sll         $v0, $v1, 24
    sra         $v0, $v0, 24
    sb          $v1, 0x3($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5194($at)
    lw          $a0, 0x0($s0)
    jal         func_800B5E38
    addu        $s3, $s7, $s3
    sb          $v0, 0x0($s3)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x24($v0)
    lw          $v1, 0x4($s1)
    lw          $v0, 0x18($v0)
    and         $v1, $v1, $s4
    sll         $v0, $v0, 20
    or          $v1, $v1, $v0
    sw          $v1, 0x4($s1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x24($v0)
    lw          $v0, 0x8($v0)
    lhu         $v0, 0x14($v0)
    addiu       $s5, $s5, 0x1
    srl         $v0, $v0, 8
    sh          $v0, 0x6($s1)
    andi        $v0, $s5, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800B81F4
    andi        $s3, $s5, 0xFFFF
    addu        $s5, $zero, $zero
    lui         $s6, 0x8008
    addiu       $s6, $s6, 0x5098
    lui         $s4, 0xF
    ori         $s4, $s4, 0xFFFF
    andi        $s3, $s5, 0xFFFF
.L800B8314:
    sll         $s1, $s3, 2
    addu        $s1, $s1, $s6
    lw          $a0, 0x0($s1)
    jal         func_800B5DC0
    addu        $a1, $zero, $zero
    sll         $s0, $s3, 3
    addu        $s0, $s0, $fp
    lw          $v1, 0x58($s0)
    sll         $v0, $v0, 20
    addiu       $s2, $s3, 0xB
    sll         $s2, $s2, 3
    and         $v1, $v1, $s4
    or          $v1, $v1, $v0
    sra         $v0, $v0, 20
    sw          $v1, 0x58($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5190($at)
    lw          $a0, 0x0($s1)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lw          $a0, 0x58($s0)
    lui         $v1, 0xFFF0
    ori         $v1, $v1, 0xFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    and         $a0, $a0, $v1
    andi        $v1, $v0, 0xFFF
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    sll         $v0, $v0, 20
    sra         $v0, $v0, 20
    sw          $a0, 0x58($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5192($at)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x24($v0)
    lh          $v1, 0x24($v0)
    sll         $v0, $v1, 24
    sra         $v0, $v0, 24
    sb          $v1, 0x5B($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s2
    sh          $v0, 0x5194($at)
    lw          $a0, 0x0($s1)
    jal         func_800B5E38
    addu        $s3, $s3, $s7
    sb          $v0, 0xB($s3)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x24($v0)
    lw          $v1, 0x5C($s0)
    lw          $v0, 0x18($v0)
    and         $v1, $v1, $s4
    sll         $v0, $v0, 20
    or          $v1, $v1, $v0
    sw          $v1, 0x5C($s0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x24($v0)
    lw          $v0, 0x8($v0)
    lhu         $v0, 0x14($v0)
    addiu       $s5, $s5, 0x1
    srl         $v0, $v0, 8
    sh          $v0, 0x5E($s0)
    andi        $v0, $s5, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800B8314
    andi        $s3, $s5, 0xFFFF
    addu        $s5, $zero, $zero
    lui         $s6, 0xF
    ori         $s6, $s6, 0xFFFF
    andi        $s2, $s5, 0xFFFF
.L800B8434:
    sll         $s0, $s2, 1
    addu        $s0, $s0, $s2
    sll         $s0, $s0, 2
    subu        $s0, $s0, $s2
    sll         $s0, $s0, 4
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x7138
    addu        $s4, $s0, $s4
    addu        $a0, $s4, $zero
    jal         func_800B5DC0
    addu        $a1, $zero, $zero
    sll         $s1, $s2, 3
    addu        $s1, $s1, $fp
    lw          $v1, 0xB0($s1)
    addu        $a0, $s4, $zero
    sll         $v0, $v0, 20
    addiu       $s3, $s2, 0x16
    sll         $s3, $s3, 3
    and         $v1, $v1, $s6
    or          $v1, $v1, $v0
    sra         $v0, $v0, 20
    sw          $v1, 0xB0($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    sh          $v0, 0x5190($at)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lw          $a0, 0xB0($s1)
    lui         $v1, 0xFFF0
    ori         $v1, $v1, 0xFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    and         $a0, $a0, $v1
    andi        $v1, $v0, 0xFFF
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    sll         $v0, $v0, 20
    sra         $v0, $v0, 20
    sw          $a0, 0xB0($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    sh          $v0, 0x5192($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $v0, 0x715C($at)
    lh          $v1, 0x24($v0)
    sll         $v0, $v1, 24
    sra         $v0, $v0, 24
    sb          $v1, 0xB3($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    sh          $v0, 0x5194($at)
    jal         func_800B5E38
    addu        $a0, $s4, $zero
    addu        $s2, $s2, $s7
    sb          $v0, 0x16($s2)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $v0, 0x715C($at)
    lw          $v1, 0xB4($s1)
    lw          $v0, 0x18($v0)
    and         $v1, $v1, $s6
    sll         $v0, $v0, 20
    or          $v1, $v1, $v0
    sw          $v1, 0xB4($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $v0, 0x715C($at)
    lw          $v0, 0x8($v0)
    lhu         $v0, 0x14($v0)
    addiu       $s5, $s5, 0x1
    srl         $v0, $v0, 8
    sh          $v0, 0xB6($s1)
    andi        $v0, $s5, 0xFFFF
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L800B8434
    andi        $s2, $s5, 0xFFFF
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B817C

.text
.align 2
.set noreorder
.globl func_800B859C
.ent func_800B859C
func_800B859C:
    addiu       $sp, $sp, -0x38
    lui         $a1, 0x1
    ori         $a1, $a1, 0x661C
    sw          $s4, 0x20($sp)
    addu        $s4, $zero, $zero
    sw          $s7, 0x2C($sp)
    lui         $s7, 0x8008
    addiu       $s7, $s7, 0x5040
    andi        $a0, $a0, 0xFFFF
    sll         $v1, $a0, 4
    subu        $v1, $v1, $a0
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    sll         $v0, $v1, 3
    addiu       $v0, $v0, 0x6AA0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    sw          $ra, 0x30($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    addu        $s6, $a0, $v0
    addu        $s5, $a0, $v1
.L800B8604:
    andi        $s2, $s4, 0xFFFF
    sll         $s0, $s2, 2
    addu        $v0, $s0, $s7
    lw          $s3, 0x0($v0)
    addu        $a1, $zero, $zero
    jal         func_800B5DC0
    addu        $a0, $s3, $zero
    addu        $s0, $s0, $s6
    lw          $v1, 0x0($s0)
    lui         $a2, 0x7FF
    ori         $a2, $a2, 0xFFFF
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x1
    sll         $s1, $s2, 3
    and         $v1, $v1, $a2
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lh          $a2, 0x5190($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v0, $v0, $a2
    sll         $v0, $v0, 27
    or          $v1, $v1, $v0
    jal         func_800B5DC0
    sw          $v1, 0x0($s0)
    lw          $v1, 0x0($s0)
    lui         $a0, 0xF83F
    ori         $a0, $a0, 0xFFFF
    lui         $a3, 0xFFC1
    sll         $v0, $v0, 16
    and         $v1, $v1, $a0
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lh          $a0, 0x5192($at)
    sra         $v0, $v0, 16
    ori         $a3, $a3, 0xFFFF
    subu        $v0, $v0, $a0
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 22
    or          $v1, $v1, $v0
    sw          $v1, 0x0($s0)
    lw          $v0, 0x24($s3)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lh          $a2, 0x5194($at)
    lh          $v0, 0x24($v0)
    addu        $a0, $s3, $zero
    and         $v1, $v1, $a3
    subu        $v0, $v0, $a2
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 17
    or          $v1, $v1, $v0
    jal         func_800B5DC0
    sw          $v1, 0x0($s0)
    addu        $a0, $s3, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $v0, 0x5190($at)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $v0, 0x5192($at)
    lw          $v0, 0x24($s3)
    lh          $v0, 0x24($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $v0, 0x5194($at)
    jal         func_800B5E38
    addu        $a0, $s3, $zero
    addu        $s2, $s5, $s2
    sb          $v0, 0x0($s2)
    lw          $v0, 0x24($s3)
    lw          $a0, 0x0($s0)
    lui         $v1, 0xFFFE
    lw          $v0, 0x18($v0)
    ori         $v1, $v1, 0x7F
    and         $a0, $a0, $v1
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 7
    or          $a0, $a0, $v0
    sw          $a0, 0x0($s0)
    lw          $v0, 0x24($s3)
    lw          $v0, 0x8($v0)
    addiu       $s4, $s4, 0x1
    lhu         $v1, 0x14($v0)
    addiu       $v0, $zero, -0x80
    and         $a0, $a0, $v0
    andi        $v0, $s4, 0xFFFF
    sltiu       $v0, $v0, 0xB
    srl         $v1, $v1, 8
    andi        $v1, $v1, 0x7F
    or          $a0, $a0, $v1
    bnez        $v0, .L800B8604
    sw          $a0, 0x0($s0)
    addu        $s4, $zero, $zero
    lui         $s7, 0x8008
    addiu       $s7, $s7, 0x5098
.L800B8790:
    andi        $s2, $s4, 0xFFFF
    sll         $s1, $s2, 2
    addu        $v0, $s1, $s7
    lw          $s3, 0x0($v0)
    addu        $a1, $zero, $zero
    jal         func_800B5DC0
    addu        $a0, $s3, $zero
    addu        $s1, $s1, $s6
    lw          $a2, 0x2C($s1)
    lui         $v1, 0x7FF
    ori         $v1, $v1, 0xFFFF
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x1
    addiu       $s0, $s2, 0xB
    sll         $s0, $s0, 3
    and         $a2, $a2, $v1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v1, 0x5190($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 27
    or          $a2, $a2, $v0
    jal         func_800B5DC0
    sw          $a2, 0x2C($s1)
    lw          $v1, 0x2C($s1)
    lui         $a0, 0xF83F
    ori         $a0, $a0, 0xFFFF
    lui         $a3, 0xFFC1
    sll         $v0, $v0, 16
    and         $v1, $v1, $a0
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a0, 0x5192($at)
    sra         $v0, $v0, 16
    ori         $a3, $a3, 0xFFFF
    subu        $v0, $v0, $a0
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 22
    or          $v1, $v1, $v0
    sw          $v1, 0x2C($s1)
    lw          $v0, 0x24($s3)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a2, 0x5194($at)
    lh          $v0, 0x24($v0)
    addu        $a0, $s3, $zero
    and         $v1, $v1, $a3
    subu        $v0, $v0, $a2
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 17
    or          $v1, $v1, $v0
    jal         func_800B5DC0
    sw          $v1, 0x2C($s1)
    addu        $a0, $s3, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5190($at)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5192($at)
    lw          $v0, 0x24($s3)
    lh          $v0, 0x24($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5194($at)
    jal         func_800B5E38
    addu        $a0, $s3, $zero
    addu        $s2, $s2, $s5
    sb          $v0, 0xB($s2)
    lw          $v0, 0x24($s3)
    lw          $a0, 0x2C($s1)
    lui         $v1, 0xFFFE
    lw          $v0, 0x18($v0)
    ori         $v1, $v1, 0x7F
    and         $a0, $a0, $v1
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 7
    or          $a0, $a0, $v0
    sw          $a0, 0x2C($s1)
    lw          $v0, 0x24($s3)
    lw          $v0, 0x8($v0)
    addiu       $s4, $s4, 0x1
    lhu         $v1, 0x14($v0)
    addiu       $v0, $zero, -0x80
    and         $a0, $a0, $v0
    andi        $v0, $s4, 0xFFFF
    sltiu       $v0, $v0, 0xB
    srl         $v1, $v1, 8
    andi        $v1, $v1, 0x7F
    or          $a0, $a0, $v1
    bnez        $v0, .L800B8790
    sw          $a0, 0x2C($s1)
    addu        $s4, $zero, $zero
.L800B8918:
    andi        $s2, $s4, 0xFFFF
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    sll         $v0, $v0, 4
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x7138
    addu        $s3, $v0, $v1
    addu        $a0, $s3, $zero
    jal         func_800B5DC0
    addu        $a1, $zero, $zero
    sll         $s1, $s2, 2
    addu        $s1, $s1, $s6
    lw          $a2, 0x58($s1)
    lui         $v1, 0x7FF
    ori         $v1, $v1, 0xFFFF
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x1
    addiu       $s0, $s2, 0x16
    sll         $s0, $s0, 3
    and         $a2, $a2, $v1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v1, 0x5190($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 27
    or          $a2, $a2, $v0
    jal         func_800B5DC0
    sw          $a2, 0x58($s1)
    lw          $v1, 0x58($s1)
    lui         $a0, 0xF83F
    ori         $a0, $a0, 0xFFFF
    lui         $a3, 0xFFC1
    sll         $v0, $v0, 16
    and         $v1, $v1, $a0
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a0, 0x5192($at)
    sra         $v0, $v0, 16
    ori         $a3, $a3, 0xFFFF
    subu        $v0, $v0, $a0
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 22
    or          $v1, $v1, $v0
    sw          $v1, 0x58($s1)
    lw          $v0, 0x24($s3)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a2, 0x5194($at)
    lh          $v0, 0x24($v0)
    addu        $a0, $s3, $zero
    and         $v1, $v1, $a3
    subu        $v0, $v0, $a2
    andi        $v0, $v0, 0x1F
    sll         $v0, $v0, 17
    or          $v1, $v1, $v0
    jal         func_800B5DC0
    sw          $v1, 0x58($s1)
    addu        $a0, $s3, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5190($at)
    jal         func_800B5DC0
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5192($at)
    lw          $v0, 0x24($s3)
    lh          $v0, 0x24($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0x5194($at)
    jal         func_800B5E38
    addu        $a0, $s3, $zero
    addu        $s2, $s2, $s5
    sb          $v0, 0x16($s2)
    lw          $v0, 0x24($s3)
    lw          $a0, 0x58($s1)
    lui         $v1, 0xFFFE
    lw          $v0, 0x18($v0)
    ori         $v1, $v1, 0x7F
    and         $a0, $a0, $v1
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 7
    or          $a0, $a0, $v0
    sw          $a0, 0x58($s1)
    lw          $v0, 0x24($s3)
    lw          $v0, 0x8($v0)
    addiu       $s4, $s4, 0x1
    lhu         $v1, 0x14($v0)
    addiu       $v0, $zero, -0x80
    and         $a0, $a0, $v0
    andi        $v0, $s4, 0xFFFF
    sltiu       $v0, $v0, 0x4
    srl         $v1, $v1, 8
    andi        $v1, $v1, 0x7F
    or          $a0, $a0, $v1
    bnez        $v0, .L800B8918
    sw          $a0, 0x58($s1)
    lw          $ra, 0x30($sp)
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
.end func_800B859C

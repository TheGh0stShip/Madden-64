.text
.align 2
.set noreorder
.globl audio_sequence_channel_configure
.ent audio_sequence_channel_configure
audio_sequence_channel_configure:
    addiu       $sp, $sp, -0x38
    sw          $s7, 0x2C($sp)
    addu        $s7, $a0, $zero
    sw          $fp, 0x30($sp)
    addu        $fp, $a1, $zero
    sw          $s6, 0x28($sp)
    addu        $s6, $a2, $zero
    sw          $s4, 0x20($sp)
    andi        $s4, $s7, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5040
    sll         $v0, $s4, 1
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sw          $s5, 0x24($sp)
    andi        $s5, $fp, 0xFFFF
    sw          $s0, 0x10($sp)
    sll         $s0, $s5, 2
    addu        $s0, $s0, $v0
    sw          $ra, 0x34($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v1, 0x0($s0)
    andi        $s2, $s6, 0xFFFF
    sll         $s3, $s2, 2
    addu        $s3, $s3, $s2
    sll         $s3, $s3, 3
    sll         $s1, $s4, 5
    addu        $s1, $s1, $s4
    sll         $s1, $s1, 2
    addu        $s1, $s1, $s4
    sll         $s1, $s1, 2
    addu        $s1, $s1, $s4
    sll         $s1, $s1, 2
    subu        $s1, $s1, $s4
    sll         $s1, $s1, 2
    addu        $s3, $s3, $s1
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0xD78($at)
    sb          $v0, 0x1C($v1)
    lw          $v1, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0xD79($at)
    sb          $v0, 0x8($v1)
    lw          $v1, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0xD79($at)
    lw          $v1, 0x24($v1)
    addiu       $v0, $v0, 0x46
    sh          $v0, 0x3C($v1)
    lw          $v1, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0xD7A($at)
    sb          $v0, 0x9($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x2
    lw          $v1, 0x0($s0)
    sb          $v0, 0xA($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x3
    lw          $v1, 0x0($s0)
    sh          $v0, 0xC($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x4
    lw          $v1, 0x0($s0)
    sb          $v0, 0xE($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x5
    lw          $v1, 0x0($s0)
    sb          $v0, 0xF($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x6
    lw          $v1, 0x0($s0)
    sb          $v0, 0x10($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x7
    lw          $v1, 0x0($s0)
    sb          $v0, 0x11($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x8
    lw          $v1, 0x0($s0)
    sb          $v0, 0x12($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xE
    lw          $v1, 0x0($s0)
    sb          $v0, 0x13($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xF
    lw          $v1, 0x0($s0)
    sb          $v0, 0x14($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x9
    lw          $v1, 0x0($s0)
    sb          $v0, 0x15($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xA
    lw          $v1, 0x0($s0)
    sb          $v0, 0x16($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xB
    lw          $v1, 0x0($s0)
    sb          $v0, 0x17($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xC
    lw          $v1, 0x0($s0)
    sb          $v0, 0x18($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0xD
    lw          $v1, 0x0($s0)
    sb          $v0, 0x19($v1)
    lw          $a0, 0x0($s0)
    addu        $a1, $s2, $zero
    jal         func_8003BD68
    addiu       $a2, $zero, 0x10
    lw          $v1, 0x0($s0)
    addu        $a0, $s4, $zero
    sb          $v0, 0x1A($v1)
    lw          $v1, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0xD8A($at)
    addu        $a1, $s5, $zero
    addu        $a2, $s2, $zero
    sb          $v0, 0x1B($v1)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x1860
    sll         $v0, $a1, 1
    addu        $s1, $s1, $v1
    addu        $v0, $v0, $s1
    jal         func_8003B8FC
    sh          $s6, 0x0($v0)
    lw          $s0, 0x0($s0)
    lbu         $v1, 0x20($s0)
    lbu         $v0, 0x1C($s0)
    bne         $v1, $v0, .L8003BC94
    slti        $v0, $v1, 0xA
    beqz        $v0, .L8003BC94
    slti        $v0, $v1, 0x5
    bnez        $v0, .L8003BC94
    nop
    lw          $a0, 0x24($s0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x4830
    jal         func_800B96C0
    nop
.L8003BC94:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x1E
    andi        $a0, $s7, 0xFFFF
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5040
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $a1
    andi        $a0, $fp, 0xFFFF
    sll         $a0, $a0, 2
    addu        $s0, $a0, $v1
    lw          $a1, 0x0($s0)
    lbu         $v1, 0x14($a1)
    andi        $v0, $v0, 0xFFFF
    addu        $v1, $v1, $v0
    addiu       $v1, $v1, -0xF
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    slti        $v0, $v1, 0x100
    beql        $v0, $zero, .L8003BCF8
    addiu       $v1, $zero, 0xFF
.L8003BCF8:
    addiu       $a0, $zero, 0x1E
    jal         func_80031A1C
    sb          $v1, 0x14($a1)
    lw          $a0, 0x0($s0)
    lbu         $v1, 0x18($a0)
    andi        $v0, $v0, 0xFFFF
    addu        $v1, $v1, $v0
    addiu       $v1, $v1, -0xF
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    slti        $v0, $v1, 0x100
    beql        $v0, $zero, .L8003BD30
    addiu       $v1, $zero, 0xFF
.L8003BD30:
    sb          $v1, 0x18($a0)
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
.end audio_sequence_channel_configure

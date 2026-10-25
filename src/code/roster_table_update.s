.text
.align 2
.set noreorder
.globl roster_table_update
.ent roster_table_update
roster_table_update:
    addiu       $sp, $sp, -0x38
    sw          $fp, 0x30($sp)
    addu        $fp, $a1, $zero
    sw          $s7, 0x2C($sp)
    addu        $s7, $a2, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sw          $s4, 0x20($sp)
    andi        $s4, $fp, 0xFFFF
    sw          $s3, 0x1C($sp)
    andi        $s3, $a0, 0xFFFF
    sll         $v0, $s3, 5
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sw          $s1, 0x14($sp)
    sll         $s1, $v0, 2
    sw          $s6, 0x28($sp)
    addu        $s6, $s1, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    sw          $s2, 0x18($sp)
    addu        $s2, $s1, $v0
    sw          $ra, 0x34($sp)
    sw          $s5, 0x24($sp)
.L80039F7C:
    lhu         $v0, 0x0($s2)
    ori         $t0, $zero, 0xFFFF
    bnel        $v0, $t0, .L8003A188
    addiu       $s6, $s6, 0x28
    jal         func_8003AA28
    addu        $a0, $s4, $zero
    addu        $s5, $v0, $zero
    andi        $v0, $s7, 0xFFFF
    beqz        $v0, .L80039FD8
    nop
    jal         func_80037258
    nop
    addu        $a0, $s4, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a1, 0xC90($at)
    andi        $a2, $s0, 0xFFFF
    jal         func_80029C98
    addu        $s0, $v0, $zero
    jal         func_80037290
    addu        $a0, $s0, $zero
    j .L8003A0B8
    sh          $fp, 0x0($s2)
.L80039FD8:
    jal         func_80028224
    nop
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x1
    bnel        $v0, $v1, .L8003A0B8
    sh          $fp, 0x0($s2)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a0, 0xC90($at)
    jal         func_80028A58
    nop
    addu        $a0, $zero, $zero
    addiu       $a2, $zero, 0xC
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    subu        $v1, $v1, $v0
    addu        $v1, $v1, $s0
    sll         $v0, $v1, 1
    lui         $a1, 0x8007
    lw          $a1, -0x4624($a1)
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a3, $zero, $zero
    addu        $s0, $a1, $v0
    jal         func_80033308
    addu        $a1, $s0, $zero
    lbu         $v0, 0xE($s5)
    andi        $v1, $v0, 0x3F
    sltiu       $v0, $v1, 0xA
    beql        $v0, $zero, .L8003A088
    sltiu       $v0, $v1, 0x15
    bnez        $v1, .L8003A074
    lui         $v1, 0x3FFF
    lw          $v0, 0x0($s0)
    ori         $v1, $v1, 0xFFFF
    j .L8003A0B0
    and         $v0, $v0, $v1
.L8003A074:
    lw          $v0, 0x0($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j .L8003A0AC
    lui         $v1, 0x4000
.L8003A088:
    beqz        $v0, .L8003A0A4
    lui         $v1, 0x3FFF
    lw          $v0, 0x0($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j .L8003A0AC
    lui         $v1, 0x8000
.L8003A0A4:
    lw          $v0, 0x0($s0)
    lui         $v1, 0xC000
.L8003A0AC:
    or          $v0, $v0, $v1
.L8003A0B0:
    sw          $v0, 0x0($s0)
    sh          $fp, 0x0($s2)
.L8003A0B8:
    lbu         $v0, 0xE($s5)
    lui         $at, 0x8008
    addu        $at, $at, $s6
    sb          $v0, 0xD78($at)
    jal         func_80039ACC
    addu        $a0, $s3, $zero
    andi        $v0, $s7, 0xFFFF
    beqz        $v0, .L8003A19C
    addiu       $v0, $zero, 0x1
    jal         func_80028224
    addu        $s1, $zero, $zero
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L8003A178
    nop
.L8003A0F4:
    jal         func_8003A21C
    andi        $a0, $s1, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    beq         $v0, $s4, .L8003A110
    addu        $s0, $s1, $zero
    j .L8003A0F4
    addiu       $s1, $s1, 0x1
.L8003A110:
    jal         func_8003A21C
    andi        $a0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    ori         $t0, $zero, 0xFFFF
    beql        $v0, $t0, .L8003A130
    addiu       $s0, $s0, -0x1
    j .L8003A110
    addiu       $s0, $s0, 0x1
.L8003A130:
    beq         $s0, $s1, .L8003A178
    subu        $v0, $s0, $s1
    sll         $a2, $v0, 1
    addu        $a2, $a2, $v0
    sll         $a2, $a2, 2
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    addiu       $v0, $s1, 0x672
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addiu       $v0, $s1, 0x673
    sll         $a1, $v0, 1
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    addu        $a0, $v1, $a0
    jal         func_8002E17C
    addu        $a1, $v1, $a1
.L8003A178:
    jal         func_8003A2C8
    andi        $a0, $fp, 0xFFFF
    j .L8003A19C
    addiu       $v0, $zero, 0x1
.L8003A188:
    addiu       $s0, $s0, 0x1
    sltiu       $v0, $s0, 0x37
    bnez        $v0, .L80039F7C
    addiu       $s2, $s2, 0x2
    addu        $v0, $zero, $zero
.L8003A19C:
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
.end roster_table_update

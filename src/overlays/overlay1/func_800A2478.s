.text
.align 2
.set noreorder
.globl func_800A2478
.ent func_800A2478
func_800A2478:
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x400
    bnez        $v0, .L800A2498
    addiu       $a0, $zero, 0x28
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
.L800A2498:
    lui         $v1, 0x8008
    lw          $v1, 0x78E0($v1)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6C58
    lui         $a1, 0x170
    slt         $v0, $a1, $v1
    beqz        $v0, .L800A24BC
    sw          $v1, 0x0($a0)
    sw          $a1, 0x0($a0)
.L800A24BC:
    lw          $v0, 0x0($a0)
    lui         $a1, 0xFE90
    slt         $v0, $v0, $a1
    bnel        $v0, $zero, .L800A24D0
    sw          $a1, 0x0($a0)
.L800A24D0:
    lui         $v0, 0x8008
    lw          $v0, 0x78E4($v0)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x7F50
    sh          $fp, 0x0($s0)
    lui         $at, 0x8009
    sw          $v1, -0x7F4C($at)
    lui         $at, 0x8009
    sh          $s5, -0x7F3C($at)
    lui         $at, 0x8009
    sh          $s7, -0x7F3A($at)
    lui         $at, 0x8009
    sw          $v0, -0x6C54($at)
    lui         $at, 0x8009
    sw          $v0, -0x7F48($at)
    jal         func_8001FD08
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A2668
    addiu       $v0, $zero, 0x1
    lhu         $t0, 0x2E($sp)
    addu        $v1, $t0, $zero
    bne         $v1, $v0, .L800A2668
    lui         $v1, 0x80
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v1, $v1, 0x1
    and         $v0, $v0, $v1
    bnez        $v0, .L800A262C
    nop
    lh          $v0, 0x0($s0)
    bnez        $v0, .L800A262C
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L800A262C
    nop
    lw          $t0, 0x3C($sp)
    beqz        $t0, .L800A25D4
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800A25D4
    lui         $v1, 0xC0
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F48($a0)
    addu        $v0, $v0, $v1
    slt         $v0, $v0, $a0
    beqz        $v0, .L800A25D4
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x19
    beqz        $v0, .L800A25D4
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lw          $a0, 0x3C($sp)
    addiu       $v0, $v0, 0xC
    jal         func_800E2308
    andi        $a1, $v0, 0xFF
.L800A25D4:
    lw          $t0, 0x44($sp)
    beqz        $t0, .L800A262C
    lui         $a0, 0xFFB0
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x7F48($v1)
    addu        $v0, $v0, $a0
    slt         $v1, $v1, $v0
    beqz        $v1, .L800A262C
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x3C
    beqz        $v0, .L800A262C
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0xC
    lw          $a0, 0x44($sp)
    jal         func_800E2308
    andi        $a1, $v0, 0xFF
.L800A262C:
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    bnez        $v0, .L800A264C
    nop
    jal         func_8009E0CC
    nop
    j           func_8009DF3C
    nop
.L800A264C:
    jal         func_8009C9E8
    nop
    addiu       $a0, $zero, 0x19
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    jal         func_800A29E8
    nop
.L800A2668:
    lw          $ra, 0x74($sp)
    lw          $fp, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end func_800A2478

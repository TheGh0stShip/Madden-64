.text
.align 2
.set noreorder
.globl menu_screen_update
.ent menu_screen_update
menu_screen_update:
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    addiu       $sp, $sp, -0x48
    sw          $s2, 0x30($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s1, 0x2C($sp)
    bnez        $v0, .L80021050
    sw          $s0, 0x28($sp)
    lui         $a0, 0x8008
    lw          $a0, 0xC10($a0)
    andi        $v0, $a0, 0x4000
    beqz        $v0, .L80021050
    nop
    lw          $v0, 0x24($s2)
    lw          $v1, 0x20($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    subu        $v1, $v1, $v0
    lui         $v0, 0x50
    slt         $v0, $v0, $v1
    beqz        $v0, .L80021050
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x78EC($v0)
    bne         $s2, $v0, .L80021050
    addiu       $v0, $zero, 0x3
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    bne         $v1, $v0, .L80021050
    lui         $v0, 0x4
    and         $v0, $a0, $v0
    bnez        $v0, .L80021050
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bnez        $v0, .L80021050
    lui         $v0, 0x7FFF
    lui         $a0, 0x8008
    lw          $a0, 0x7A70($a0)
    ori         $v0, $v0, 0xFFFF
    beq         $a0, $v0, .L80021050
    nop
    lh          $v0, 0x32($s2)
    beqz        $v0, .L80021050
    nop
    lw          $v0, 0x24($s2)
    lw          $s1, 0x38($s2)
    lw          $v1, 0x1C($v0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    subu        $v1, $a0, $v1
    sw          $v1, 0x10($sp)
    lw          $a0, 0x24($s2)
    lui         $a2, 0x8008
    lw          $a2, 0x7A74($a2)
    lui         $v0, 0x8008
    lhu         $v0, 0xC08($v0)
    lw          $a0, 0x20($a0)
    addu        $v0, $v0, $a1
    lui         $at, 0x8008
    sh          $v0, 0xC08($at)
    subu        $v0, $a2, $a0
    bgez        $v1, .L80020C8C
    sw          $v0, 0x14($sp)
    negu        $v1, $v1
.L80020C8C:
    addu        $a2, $v0, $zero
    bltzl       $a2, .L80020C98
    negu        $a2, $a2
.L80020C98:
    slt         $v0, $v1, $a2
    beqz        $v0, .L80020CB4
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    j .L80020CC4
    addu        $s4, $a2, $v0
.L80020CB4:
    srl         $v0, $a2, 31
    addu        $v0, $a2, $v0
    sra         $v0, $v0, 1
    addu        $s4, $v1, $v0
.L80020CC4:
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    lw          $v1, 0x24($s1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A70($a0)
    lw          $v1, 0x1C($v1)
    subu        $a0, $a0, $v1
    sw          $a0, 0x10($sp)
    lw          $v1, 0x24($s1)
    lui         $a1, 0x8008
    lw          $a1, 0x7A74($a1)
    lw          $v1, 0x20($v1)
    sll         $v0, $v0, 16
    sra         $s5, $v0, 16
    subu        $a1, $a1, $v1
    bgez        $a0, .L80020D0C
    sw          $a1, 0x14($sp)
    negu        $a0, $a0
.L80020D0C:
    bltzl       $a1, .L80020D14
    negu        $a1, $a1
.L80020D14:
    slt         $v0, $a0, $a1
    beqz        $v0, .L80020D30
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j .L80020D40
    addu        $s3, $a1, $v0
.L80020D30:
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    addu        $s3, $a0, $v0
.L80020D40:
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x17
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $s4
    bnez        $v0, .L80020EE4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $a1, 0x24($s2)
    lw          $a3, 0x20($v0)
    lw          $a2, 0x20($a1)
    slt         $v0, $a3, $a2
    beqz        $v0, .L80021050
    addiu       $v0, $zero, 0x1F
    lbu         $v1, 0x64($s1)
    bne         $v1, $v0, .L80020DC0
    addiu       $a0, $zero, 0x5
    lw          $v0, 0x24($s1)
    lw          $a2, 0x20($v0)
    addiu       $a0, $zero, 0x4
    jal         func_8001FA68
    addu        $a1, $s1, $zero
    lh          $v0, 0x30($s2)
    blez        $v0, .L80021050
    addiu       $v0, $zero, 0x1A
    sb          $v0, 0x20($sp)
    addu        $a0, $s2, $zero
    jal         func_800E1A84
    addiu       $a1, $sp, 0x20
    j .L80021050
    nop
.L80020DC0:
    bne         $v1, $a0, .L80020DEC
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x6CB2($v0)
    slti        $v0, $v0, 0x4
    bnez        $v0, .L80021050
    addiu       $a0, $zero, 0x4
    lw          $v0, 0x24($s1)
    lw          $a2, 0x20($v0)
    j .L80020F1C
    nop
.L80020DEC:
    lbu         $v0, 0x64($s2)
    bne         $v0, $a0, .L80020E1C
    slt         $v0, $s3, $s4
    beqz        $v0, .L80021050
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x6CB2($v0)
    slti        $v0, $v0, 0xD
    bnez        $v0, .L80021050
    addiu       $a0, $zero, 0x5
    j .L80020ED4
    nop
.L80020E1C:
    lh          $v0, 0x30($s2)
    slti        $v0, $v0, 0x1F
    bnez        $v0, .L80021050
    nop
    lh          $v0, 0x3C($s1)
    lh          $v1, 0x3C($s2)
    subu        $v0, $v0, $v1
    andi        $a0, $v0, 0xFFF
    slti        $v0, $a0, 0x800
    bnez        $v0, .L80020E54
    slti        $v0, $a0, 0x87
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
    slti        $v0, $a0, 0x87
.L80020E54:
    beqz        $v0, .L80021050
    addiu       $a0, $sp, 0x10
    lw          $v1, 0x24($s1)
    lw          $v0, 0x1C($a1)
    lw          $v1, 0x1C($v1)
    subu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0x24($s2)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x20($v0)
    lw          $v1, 0x20($v1)
    subu        $v0, $v0, $v1
    jal         func_800B9208
    sw          $v0, 0x14($sp)
    lh          $v1, 0x3C($s1)
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    subu        $v1, $v1, $a0
    andi        $a0, $v1, 0xFFF
    slti        $v0, $a0, 0x800
    bnez        $v0, .L80020EB8
    slti        $v0, $a0, 0x400
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
    slti        $v0, $a0, 0x400
.L80020EB8:
    bnez        $v0, .L80020F04
    addiu       $a0, $zero, 0x5
    lw          $v0, 0x24($s2)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
.L80020ED4:
    jal         func_8001FA68
    addu        $a1, $s2, $zero
    j .L80021050
    nop
.L80020EE4:
    lbu         $v0, 0x64($s1)
    xori        $v1, $v0, 0x1F
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x5
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80020F2C
    nop
.L80020F04:
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    addiu       $a0, $zero, 0x4
.L80020F1C:
    jal         func_8001FA68
    addu        $a1, $s1, $zero
    j .L80021050
    nop
.L80020F2C:
    lui         $s0, 0x8008
    lh          $s0, 0xC08($s0)
    jal         func_8001FA38
    addiu       $a0, $zero, 0x4
    lui         $a0, 0x5555
    ori         $a0, $a0, 0x5556
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    .word       0x00640018  # mult        $v1, $a0
    sra         $v0, $v0, 31
    addiu       $v1, $zero, 0x6
    .word       0x00004010  # mfhi        $t0
    subu        $v0, $t0, $v0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $v1, $v1, $v0
    slt         $s0, $s0, $v1
    bnez        $s0, .L80021050
    nop
    lh          $v0, 0x3C($s2)
    subu        $v0, $v0, $s5
    andi        $a0, $v0, 0xFFF
    slti        $v0, $a0, 0x800
    bnez        $v0, .L80020F94
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
.L80020F94:
    lbu         $v0, 0x21($s2)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L80020FC0
    addiu       $v1, $zero, 0x31C
    lhu         $v0, 0x28($s2)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80020FBC
    addu        $v1, $zero, $zero
    j .L80020FC4
    addiu       $v0, $zero, 0x18E
.L80020FBC:
    addiu       $v1, $zero, 0x31C
.L80020FC0:
    addiu       $v0, $zero, 0x38E
.L80020FC4:
    slt         $v0, $v0, $a0
    beqz        $v0, .L80020FF4
    slt         $v0, $s4, $s3
    beqz        $v0, .L80021048
    addiu       $a0, $zero, 0x5
    lw          $v0, 0x24($s2)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    j .L80021040
    addu        $a1, $s2, $zero
.L80020FF4:
    lh          $v0, 0x3C($s1)
    subu        $v0, $v0, $s5
    andi        $a0, $v0, 0xFFF
    slti        $v0, $a0, 0x800
    bnez        $v0, .L80021018
    slt         $v0, $v1, $a0
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
    slt         $v0, $v1, $a0
.L80021018:
    beqz        $v0, .L80021048
    slt         $v0, $s3, $s4
    beqz        $v0, .L80021048
    addiu       $a0, $zero, 0x4
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    addu        $a1, $s1, $zero
.L80021040:
    jal         func_8001FA68
    nop
.L80021048:
    lui         $at, 0x8008
    sh          $zero, 0xC08($at)
.L80021050:
    lw          $ra, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end menu_screen_update

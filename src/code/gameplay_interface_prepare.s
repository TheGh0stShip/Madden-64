.text
.align 2
.set noreorder
.globl gameplay_interface_prepare
.ent gameplay_interface_prepare
gameplay_interface_prepare:
    addiu       $sp, $sp, -0x50
    sw          $s7, 0x44($sp)
    addu        $s7, $zero, $zero
    sw          $s5, 0x3C($sp)
    addu        $s5, $zero, $zero
    sw          $s4, 0x38($sp)
    addu        $s4, $zero, $zero
    sw          $s6, 0x40($sp)
    addu        $s6, $zero, $zero
    sw          $s3, 0x34($sp)
    addu        $s3, $zero, $zero
    sw          $ra, 0x48($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    andi        $v0, $s3, 0xFFFF
.L8002B494:
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
    lh          $v0, 0x2CA8($at)
    blez        $v0, .L8002B554
    addu        $s1, $zero, $zero
    addu        $s2, $v1, $zero
    andi        $v0, $s1, 0xFFFF
.L8002B4D4:
    sll         $v0, $v0, 2
    addu        $s0, $v0, $s2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a0, 0x2CAB($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a1, 0x2CAC($at)
    jal         func_8002C1F4
    nop
    addu        $a0, $v0, $zero
    andi        $v1, $a0, 0xFFFF
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $v1
    beqz        $v0, .L8002B534
    nop
    addu        $s4, $a0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $s6, 0x2CAB($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $s7, 0x2CAA($at)
    addu        $s5, $s3, $zero
.L8002B534:
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lh          $v1, 0x2CA8($at)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L8002B4D4
    andi        $v0, $s1, 0xFFFF
.L8002B554:
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L8002B494
    andi        $v0, $s3, 0xFFFF
    jal         func_80031A1C
    addiu       $a0, $zero, 0xC8
    andi        $a0, $s4, 0xFFFF
    beqz        $a0, .L8002B5BC
    andi        $v0, $v0, 0xFFFF
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    sltu        $v0, $v0, $a0
    sltiu       $v1, $v1, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8002B5BC
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x2F98
    sw          $v0, 0x10($sp)
    andi        $v0, $s5, 0xFFFF
    sw          $v0, 0x14($sp)
    sw          $s6, 0x18($sp)
    sw          $s7, 0x1C($sp)
    jal         func_800AE924
    sh          $zero, 0x20($sp)
.L8002B5BC:
    lw          $ra, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end gameplay_interface_prepare

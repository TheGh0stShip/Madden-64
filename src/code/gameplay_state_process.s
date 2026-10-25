.text
.align 2
.set noreorder
.globl gameplay_state_process
.ent gameplay_state_process
gameplay_state_process:
    addiu       $sp, $sp, -0x30
    addu        $v1, $a0, $zero
    sll         $v0, $v1, 16
    sw          $s0, 0x10($sp)
    sra         $s0, $v0, 16
    addu        $a0, $s0, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $v1, $zero
    sw          $ra, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    jal         func_80022C44
    sw          $s1, 0x14($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L80022E4C
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $s3, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lh          $s2, 0x2DC0($at)
    addiu       $v0, $zero, 0x5
    bne         $s2, $v0, .L80022D18
    addu        $s1, $zero, $zero
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $s3
    sb          $v0, 0x16E3($at)
    andi        $s0, $s5, 0xFFFF
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x5
    jal         func_80022E74
    addiu       $a2, $zero, 0x5
    addu        $a0, $s0, $zero
    andi        $a1, $v0, 0xFFFF
    addiu       $a2, $zero, 0x5
    jal         func_8002212C
    addiu       $a3, $zero, 0x5
    addu        $s1, $zero, $zero
.L80022D18:
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x16A7
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    addu        $v1, $s3, $v1
    addu        $s4, $v0, $v1
.L80022D38:
    addu        $s0, $zero, $zero
    andi        $a0, $s5, 0xFFFF
    andi        $a1, $s2, 0xFFFF
    jal         func_80022E74
    andi        $a2, $s1, 0xFFFF
    sll         $v1, $s2, 2
    addu        $v1, $v1, $s2
    sll         $v1, $v1, 3
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $a0, 0x2DF6($at)
    andi        $a1, $v0, 0xFFFF
    lbu         $a2, 0x0($s4)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    addu        $v1, $v1, $s1
    sll         $v1, $v1, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD78($at)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v1, -0x5528($at)
    andi        $a0, $a0, 0x3F
    andi        $v0, $v0, 0x3F
    bne         $a0, $v0, .L80022E0C
    slt         $v0, $a1, $a2
    bnel        $v0, $zero, .L80022E18
    addiu       $s0, $zero, 0x1
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v0, $v0, $s3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x29
    bnez        $v0, .L80022E1C
    slti        $v0, $v1, 0x17
    j .L80022E1C
    addiu       $s0, $zero, 0x1
.L80022E0C:
    bne         $a0, $v1, .L80022E1C
    slti        $v0, $v1, 0x17
    addiu       $s0, $zero, 0x1
.L80022E18:
    slti        $v0, $v1, 0x17
.L80022E1C:
    negu        $v0, $v0
    and         $s0, $s0, $v0
    beql        $s0, $zero, .L80022E40
    addiu       $s1, $s1, 0x1
    andi        $a0, $s5, 0xFFFF
    andi        $a2, $s2, 0xFFFF
    jal         func_8002212C
    andi        $a3, $s1, 0xFFFF
    addiu       $s1, $s1, 0x1
.L80022E40:
    slti        $v0, $s1, 0xB
    bnez        $v0, .L80022D38
    addiu       $s4, $s4, 0x1
.L80022E4C:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end gameplay_state_process

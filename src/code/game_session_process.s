.text
.align 2
.set noreorder
.globl game_session_process
.ent game_session_process
game_session_process:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    addu        $s5, $zero, $zero
    sw          $s3, 0x1C($sp)
    andi        $s3, $a0, 0xFFFF
    sll         $v0, $s3, 5
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sw          $s6, 0x28($sp)
    sll         $s6, $v0, 2
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    addu        $s1, $zero, $zero
.L80021F24:
    addu        $v1, $s6, $s3
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s3
    sll         $v1, $v1, 2
    andi        $a0, $s5, 0xFFFF
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x16A7
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $a1
    addu        $v1, $v0, $v1
    addiu       $a0, $zero, 0xFF
    andi        $v0, $s1, 0xFFFF
.L80021F60:
    addu        $v0, $v1, $v0
    sb          $a0, 0x0($v0)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L80021F60
    andi        $v0, $s1, 0xFFFF
    andi        $s0, $s5, 0xFFFF
    addiu       $v0, $zero, 0x5
    bne         $s0, $v0, .L80021FB4
    addu        $s1, $zero, $zero
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x5
    jal         func_80022E74
    addiu       $a2, $zero, 0x5
    addu        $a0, $s3, $zero
    andi        $a1, $v0, 0xFFFF
    addiu       $a2, $zero, 0x5
    jal         func_8002212C
    addiu       $a3, $zero, 0x5
    addu        $s1, $zero, $zero
.L80021FB4:
    addu        $v0, $s6, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $s2, $s0, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x16A7
    sll         $v1, $s2, 1
    addu        $v1, $v1, $s2
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s2
    addu        $v0, $v0, $a0
    addu        $s4, $v1, $v0
    andi        $s0, $s1, 0xFFFF
.L80021FEC:
    addu        $v0, $s4, $s0
    lbu         $v1, 0x0($v0)
    addiu       $v0, $zero, 0xFF
    bnel        $v1, $v0, .L80022028
    addiu       $s1, $s1, 0x1
    addu        $a0, $s3, $zero
    addu        $a1, $s2, $zero
    jal         func_80022E74
    addu        $a2, $s0, $zero
    addu        $a0, $s3, $zero
    andi        $a1, $v0, 0xFFFF
    addu        $a2, $s2, $zero
    jal         func_8002212C
    addu        $a3, $s0, $zero
    addiu       $s1, $s1, 0x1
.L80022028:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnel        $v0, $zero, .L80021FEC
    andi        $s0, $s1, 0xFFFF
    addiu       $s5, $s5, 0x1
    andi        $v0, $s5, 0xFFFF
    sltiu       $v0, $v0, 0x28
    bnez        $v0, .L80021F24
    addu        $s1, $zero, $zero
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end game_session_process

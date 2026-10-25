.text
.align 2
.set noreorder
.globl roster_team_update
.ent roster_team_update
roster_team_update:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    addu        $s5, $a0, $zero
    sw          $s6, 0x28($sp)
    addu        $s6, $a1, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    andi        $v1, $s5, 0xFFFF
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    sw          $s2, 0x18($sp)
    andi        $s2, $s6, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sll         $a0, $s2, 1
    addu        $v0, $v0, $v1
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $v0
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
.L80039D74:
    jal         func_8003A21C
    andi        $a0, $s0, 0xFFFF
    lhu         $v1, 0x0($s1)
    andi        $v0, $v0, 0xFFFF
    beq         $v0, $v1, .L80039D94
    nop
    j .L80039D74
    addiu       $s0, $s0, 0x1
.L80039D94:
    jal         func_80037258
    nop
    lhu         $a0, 0x0($s1)
    addiu       $a1, $zero, 0xFF
    andi        $a2, $s0, 0xFFFF
    addu        $s1, $s2, $zero
    jal         func_80029C98
    addu        $s0, $v0, $zero
    jal         func_80037290
    addu        $a0, $s0, $zero
    slti        $v0, $s1, 0x36
    beqz        $v0, .L80039E6C
    andi        $v1, $s5, 0xFFFF
    sll         $a0, $s1, 2
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 3
    addiu       $s4, $a0, 0x28
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $s0, $v0, 2
    addu        $s3, $a0, $s0
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFE
    sll         $v0, $s1, 1
    addu        $s2, $v0, $v1
.L80039E10:
    addu        $v0, $s2, $s0
    lhu         $a0, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beql        $a0, $v0, .L80039E58
    addiu       $s4, $s4, 0x28
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a1, 0xC90($at)
    jal         func_80029C98
    andi        $a2, $s1, 0xFFFF
    addu        $v0, $s4, $s0
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    sb          $v0, 0xD78($at)
    addiu       $s4, $s4, 0x28
.L80039E58:
    addiu       $s3, $s3, 0x28
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x36
    bnez        $v0, .L80039E10
    addiu       $s2, $s2, 0x2
.L80039E6C:
    andi        $s1, $s5, 0xFFFF
    sll         $s0, $s1, 5
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    subu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    addu        $v0, $s0, $v0
    andi        $v1, $s6, 0xFFFF
    sll         $a1, $v1, 1
    addu        $a0, $v0, $a1
    addiu       $a1, $a1, 0x2
    addu        $a1, $v0, $a1
    addiu       $a2, $zero, 0x36
    subu        $a2, $a2, $v1
    jal         func_8002E17C
    sll         $a2, $a2, 1
    ori         $v0, $zero, 0xFFFF
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $v0, 0xD68($at)
    jal         func_80039ACC
    addu        $a0, $s1, $zero
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
.end roster_team_update

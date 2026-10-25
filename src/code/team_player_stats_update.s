.text
.align 2
.set noreorder
.globl team_player_stats_update
.ent team_player_stats_update
team_player_stats_update:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    addu        $s5, $a1, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $a0, 0xFFFF
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sw          $s2, 0x18($sp)
    sll         $s2, $v0, 2
    andi        $v1, $s5, 0xFFFF
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    sll         $v1, $v1, 1
    addu        $v0, $s2, $v0
    addu        $v1, $v1, $v0
    sw          $ra, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s1, 0x14($sp)
    lhu         $v1, 0x0($v1)
    ori         $v0, $zero, 0xFFFF
    bne         $v1, $v0, .L8002C664
    addu        $s1, $s3, $zero
    j .L8002C738
    addiu       $v0, $zero, -0x8000
.L8002C664:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x105C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    addu        $s4, $v0, $zero
    addiu       $v0, $s3, -0x21
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x6
    bnez        $v0, .L8002C738
    addu        $v0, $zero, $zero
    andi        $s1, $s1, 0xFFFF
    bnez        $s1, .L8002C6E8
    nop
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1400
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    addu        $a0, $s0, $zero
    jal         func_80028A58
    addu        $s0, $v0, $zero
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $s0, $s0, $v1
    lbu         $v0, 0x7FE($s0)
    lbu         $v1, 0x7FF($s0)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sll         $v1, $v1, 24
    sra         $v1, $v1, 24
    j .L8002C730
    addu        $v0, $v0, $v1
.L8002C6E8:
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lbu         $a0, 0xC90($at)
    jal         func_80028A58
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    subu        $v1, $v1, $v0
    addu        $v1, $s5, $v1
    andi        $v1, $v1, 0xFFFF
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 2
    addu        $a0, $s4, $a0
    jal         func_800282C8
    addu        $a1, $s1, $zero
.L8002C730:
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
.L8002C738:
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
.end team_player_stats_update

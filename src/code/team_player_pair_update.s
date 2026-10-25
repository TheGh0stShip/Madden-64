.text
.align 2
.set noreorder
.globl team_player_pair_update
.ent team_player_pair_update
team_player_pair_update:
    addiu       $sp, $sp, -0x28
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
    sll         $v0, $v0, 2
    sw          $s2, 0x18($sp)
    andi        $s2, $a1, 0xFFFF
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0xCFC
    sll         $v1, $s2, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    lhu         $v1, 0x0($v1)
    ori         $v0, $zero, 0xFFFF
    bne         $v1, $v0, .L8002C8E4
    addu        $s3, $a2, $zero
    j .L8002C990
    ori         $v0, $zero, 0x8000
.L8002C8E4:
    addu        $a0, $s0, $zero
    addu        $a1, $s2, $zero
    jal         func_8002C5E4
    andi        $a2, $a3, 0xFFFF
    sll         $v0, $v0, 16
    sra         $s1, $v0, 16
    beqz        $s1, .L8002C98C
    addu        $a0, $s0, $zero
    addu        $a1, $s2, $zero
    jal         func_8002C5E4
    andi        $a2, $s3, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $a0, $v0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 1
    div         $zero, $a0, $s1
    bnez        $s1, .L8002C934
    nop
    break       7
.L8002C934:
    addiu       $at, $zero, -0x1
    bne         $s1, $at, .L8002C94C
    lui         $at, 0x8000
    bne         $a0, $at, .L8002C94C
    nop
    break       6
.L8002C94C:
    mflo        $a0
    lui         $v0, 0x6666
    ori         $v0, $v0, 0x6667
    mult        $a0, $v0
    sra         $v1, $a0, 31
    mfhi        $t0
    sra         $v0, $t0, 2
    subu        $v0, $v0, $v1
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    subu        $a0, $a0, $v1
    andi        $a0, $a0, 0xFFFF
    sll         $v0, $v0, 16
    j .L8002C990
    or          $v0, $v0, $a0
.L8002C98C:
    addu        $v0, $zero, $zero
.L8002C990:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end team_player_pair_update

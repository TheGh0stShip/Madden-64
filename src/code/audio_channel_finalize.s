.text
.align 2
.set noreorder
.globl audio_channel_finalize
.ent audio_channel_finalize
audio_channel_finalize:
    lui         $v1, 0x8009
    lw          $v1, -0x49B0($v1)
    addiu       $sp, $sp, -0x40
    sw          $ra, 0x38($sp)
    sw          $s1, 0x34($sp)
    sw          $s0, 0x30($sp)
    sll         $v0, $v1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x4CB8($at)
    xori        $v1, $v1, 0x1
    sw          $v0, 0x14($a0)
    sll         $v0, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x4F60($at)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4CB8
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0x4F60
    beqz        $v0, .L8003D690
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 3
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x7A10
    addu        $a0, $a0, $v0
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8009
    lw          $v0, -0x49B0($v0)
    xori        $v0, $v0, 0x1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $zero, 0x0($v0)
.L8003D690:
    lui         $v0, 0x8009
    lw          $v0, -0x49B0($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a0, 0x0($v0)
    jal         func_80046CF8
    addiu       $a1, $zero, 0x1000
    lui         $v0, 0x8009
    lw          $v0, -0x49B0($v0)
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B38
    lui         $a3, 0x8008
    lw          $a3, -0x17F8($a3)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $t0, 0x0($v0)
    addu        $a0, $v1, $a0
    addiu       $v0, $zero, 0xFF6
    sw          $v0, 0x14($sp)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x7A10
    addu        $v1, $v1, $v0
    sw          $v1, 0x18($sp)
    jal         func_8004BDB8
    sw          $t0, 0x10($sp)
    lui         $a0, 0x8009
    lw          $a0, -0x49B0($a0)
    addiu       $v1, $zero, 0x1
    sll         $v0, $a0, 2
    addu        $v0, $v0, $s1
    xori        $a0, $a0, 0x1
    sw          $v1, 0x0($v0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $s0
    lw          $a1, 0x0($v0)
    lui         $at, 0x8009
    sw          $a0, -0x49B0($at)
    lbu         $v1, 0xFED($a1)
    andi        $v0, $v1, 0x1
    bnez        $v0, .L8003D74C
    ori         $v0, $v1, 0x2
    sb          $v0, 0xFED($a1)
.L8003D74C:
    lui         $v0, 0x8008
    lw          $v0, -0x17F8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x4CBC($v1)
    addiu       $v0, $v0, 0xFF6
    addiu       $v1, $v1, -0xFF6
    lui         $at, 0x8008
    sw          $v0, -0x17F8($at)
    lui         $at, 0x8009
    sw          $v1, -0x4CBC($at)
    lw          $ra, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end audio_channel_finalize

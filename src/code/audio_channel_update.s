.text
.align 2
.set noreorder
.globl audio_channel_update
.ent audio_channel_update
audio_channel_update:
    lui         $v0, 0x8007
    lw          $v0, 0x3508($v0)
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    beqz        $v0, .L8003D5DC
    sw          $s1, 0x14($sp)
    lui         $s1, 0x8007
    lw          $s1, 0x34F8($s1)
    addiu       $v0, $zero, -0x1
    bne         $s1, $v0, .L8003D5DC
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x5D42($a0)
    lui         $at, 0x8007
    sw          $s0, 0x34F8($at)
    lui         $at, 0x8008
    sw          $zero, 0x6CB8($at)
    jal         func_80035610
    addu        $a1, $s0, $zero
    lui         $a0, 0x8008
    lhu         $a0, 0x5D42($a0)
    addiu       $v0, $v0, 0x4
    lui         $at, 0x8008
    sw          $v0, -0x17F8($at)
    jal         func_800355D8
    addu        $a1, $s0, $zero
    lui         $v1, 0x8006
    lw          $v1, 0x4A00($v1)
    lw          $a0, 0x14($v1)
    lw          $v1, 0xF8($a0)
    addiu       $v0, $v0, -0x4
    lui         $at, 0x8009
    sw          $v0, -0x4CBC($at)
    lui         $at, 0x8009
    sw          $zero, -0x49B0($at)
    andi        $v1, $v1, 0x5
    beqz        $v1, .L8003D520
    addiu       $a0, $a0, 0xE0
    lui         $at, 0x8007
    sw          $s1, 0x34F8($at)
    j .L8003D5DC
    nop
.L8003D520:
    addu        $s1, $a0, $zero
    lui         $at, 0x8008
    sw          $s1, 0x7B6C($at)
    addiu       $s4, $zero, 0x1
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x4F64
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x4864
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x79F8
.L8003D548:
    addu        $a0, $s0, $zero
    addu        $a1, $s2, $zero
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    sw          $zero, 0x0($s3)
    addiu       $s3, $s3, -0x4
    addiu       $s2, $s2, -0x4
    addiu       $s0, $s0, -0x18
    addu        $v0, $s4, $zero
    bnez        $v0, .L8003D548
    addiu       $s4, $s4, -0x1
    jal         func_8003D600
    addu        $a0, $s1, $zero
    jal         func_8003D600
    addu        $a0, $s1, $zero
    lui         $v0, 0x8007
    lw          $v0, 0x3508($v0)
    sll         $v0, $v0, 1
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x4($s1)
    lw          $v0, 0x4($s1)
    sw          $v0, 0x0($s1)
    lui         $v0, 0x8009
    lw          $v0, -0x4CB8($v0)
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8009
    lw          $v0, -0x4CB4($v0)
    sw          $v0, 0x14($s1)
    sw          $zero, 0xC($s1)
    lw          $v0, 0xC($s1)
    sw          $v0, 0x8($s1)
    lui         $v0, 0x8004
    addiu       $v0, $v0, -0x2A00
    sw          $v0, 0x1C($s1)
    lw          $v0, 0x18($s1)
    ori         $v0, $v0, 0x6
    sw          $v0, 0x18($s1)
.L8003D5DC:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_channel_update

.text
.align 2
.set noreorder
.globl audio_sequence_finalize
.ent audio_sequence_finalize
audio_sequence_finalize:
    lui         $v1, 0x8007
    lh          $v1, 0x40C8($v1)
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a1, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a2, $zero
    sw          $s3, 0x1C($sp)
    addiu       $s3, $zero, 0xB
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    bne         $v1, $v0, .L8003FB24
    sw          $s0, 0x10($sp)
    jal         func_80024694
    addu        $s0, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x40C4($a0)
    lhu         $v0, 0x0($a0)
    beqz        $v0, .L8003FB14
    andi        $s6, $s1, 0xFFFF
    andi        $s4, $s4, 0xFFFF
    andi        $v0, $s0, 0xFFFF
.L8003FAAC:
    sll         $s1, $v0, 2
    addu        $v0, $a0, $s1
    lhu         $a0, 0x2($v0)
    jal         func_80024B90
    nop
    andi        $v0, $v0, 0xFF
    bne         $s6, $v0, .L8003FAF4
    andi        $v0, $s2, 0xFFFF
    bnel        $v0, $s4, .L8003FAF4
    addiu       $s2, $s2, 0x1
    lui         $v0, 0x8007
    lw          $v0, 0x40C4($v0)
    andi        $a1, $s5, 0xFFFF
    addiu       $a0, $s1, 0x2
    jal         func_8003FF30
    addu        $a0, $v0, $a0
    addu        $s3, $v0, $zero
    addiu       $s2, $s2, 0x1
.L8003FAF4:
    lui         $a0, 0x8007
    lw          $a0, 0x40C4($a0)
    lhu         $v1, 0x0($a0)
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8003FAAC
    andi        $v0, $s0, 0xFFFF
.L8003FB14:
    jal         func_80024E9C
    nop
    j .L8003FBCC
    addu        $v0, $s3, $zero
.L8003FB24:
    addu        $s0, $zero, $zero
    andi        $v0, $s1, 0xFFFF
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $s1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x2D84
    addu        $s6, $s1, $v0
    andi        $v0, $s0, 0xFFFF
.L8003FB60:
    sll         $a1, $v0, 2
    addu        $a0, $a1, $s1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lhu         $v1, 0x2D84($at)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L8003FBB4
    addiu       $v0, $zero, 0x80
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x2D87($at)
    beq         $v1, $v0, .L8003FBB4
    andi        $v1, $s2, 0xFFFF
    andi        $v0, $s4, 0xFFFF
    bnel        $v1, $v0, .L8003FBB4
    addiu       $s2, $s2, 0x1
    addu        $a0, $s6, $a1
    jal         func_8003FF30
    andi        $a1, $s5, 0xFFFF
    addu        $s3, $v0, $zero
    addiu       $s2, $s2, 0x1
.L8003FBB4:
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L8003FB60
    andi        $v0, $s0, 0xFFFF
    addu        $v0, $s3, $zero
.L8003FBCC:
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
.end audio_sequence_finalize

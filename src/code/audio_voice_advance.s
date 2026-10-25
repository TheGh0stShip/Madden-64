.text
.align 2
.set noreorder
.globl audio_voice_advance
.ent audio_voice_advance
audio_voice_advance:
    addiu       $sp, $sp, -0x38
    sw          $s7, 0x2C($sp)
    addu        $s7, $a0, $zero
    sw          $s4, 0x20($sp)
    addiu       $s4, $zero, -0x1
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $ra, 0x30($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $s5, 0x2DC0($at)
    addu        $s1, $zero, $zero
    addiu       $s3, $zero, 0x3
    andi        $s2, $s5, 0xFFFF
    addu        $a0, $s2, $zero
.L80037F80:
    andi        $s0, $s1, 0xFFFF
    jal         func_8003C6B4
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bne         $v0, $s3, .L80037FB8
    addiu       $v0, $s1, 0x1
    addu        $a0, $s2, $zero
    jal         func_8003C708
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bnez        $v0, .L80037FB8
    addiu       $v0, $s1, 0x1
    j .L80037FD0
    addu        $s4, $s1, $zero
.L80037FB8:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, .L80037F80
    addu        $a0, $s2, $zero
.L80037FD0:
    sll         $v0, $s4, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L800380A4
    addiu       $s3, $zero, -0x1
    addu        $s1, $zero, $zero
    andi        $s2, $s5, 0xFFFF
    addiu       $s6, $zero, 0x3
    addiu       $s5, $zero, 0x1
    addu        $a0, $s2, $zero
.L80037FF8:
    andi        $s0, $s1, 0xFFFF
    jal         func_8003C6B4
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bne         $v0, $s6, .L80038030
    addiu       $v0, $s1, 0x1
    addu        $a0, $s2, $zero
    jal         func_8003C708
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bne         $v0, $s5, .L80038030
    addiu       $v0, $s1, 0x1
    j .L80038048
    addu        $s3, $s1, $zero
.L80038030:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, .L80037FF8
    addu        $a0, $s2, $zero
.L80038048:
    sll         $v0, $s3, 16
    sra         $a1, $v0, 16
    addiu       $v0, $zero, -0x1
    beq         $a1, $v0, .L800380A4
    sll         $v0, $s7, 16
    sra         $v0, $v0, 16
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $a0
    sll         $v0, $s4, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $v1
    lw          $a0, 0x0($v0)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $v1
    lw          $a1, 0x0($v0)
    jal         func_800E1CF4
    nop
.L800380A4:
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end audio_voice_advance

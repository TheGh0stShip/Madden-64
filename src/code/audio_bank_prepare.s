.text
.align 2
.set noreorder
.globl audio_bank_prepare
.ent audio_bank_prepare
audio_bank_prepare:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    ori         $v1, $zero, 0xFFFF
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    andi        $v0, $s0, 0xFFFF
.L8003E9D8:
    addiu       $s0, $s0, 0x1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2D84($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x4ED0($at)
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L8003E9D8
    andi        $v0, $s0, 0xFFFF
    lui         $v1, 0x8007
    lh          $v1, 0x40C8($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8003EB08
    nop
    jal         func_80024694
    addu        $s0, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x40C4($a0)
    lhu         $v0, 0x0($a0)
    beqz        $v0, .L8003EB00
    andi        $v0, $s0, 0xFFFF
    addiu       $s3, $zero, -0x1
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0xC90
    addiu       $s4, $s2, 0x4240
.L8003EA48:
    sll         $s1, $v0, 2
    addu        $v0, $a0, $s1
    lhu         $a0, 0x2($v0)
    jal         func_80024B90
    nop
    lbu         $v1, 0x0($s2)
    andi        $a0, $v0, 0xFF
    bne         $a0, $v1, .L8003EAA0
    nop
    jal         func_8003FE94
    addu        $a0, $zero, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    beq         $v0, $s3, .L8003EAE0
    sll         $v0, $v0, 2
    lui         $v1, 0x8007
    lw          $v1, 0x40C4($v1)
    addiu       $a1, $s2, 0x20F4
    addu        $a1, $v0, $a1
    addiu       $a0, $s1, 0x2
    j .L8003EAD8
    addu        $a0, $v1, $a0
.L8003EAA0:
    lbu         $v0, 0x214C($s2)
    bne         $a0, $v0, .L8003EAE0
    nop
    jal         func_8003FE94
    addiu       $a0, $zero, 0x1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    beq         $v0, $s3, .L8003EAE0
    sll         $a1, $v0, 2
    lui         $a0, 0x8007
    lw          $a0, 0x40C4($a0)
    addu        $a1, $a1, $s4
    addiu       $v0, $s1, 0x2
    addu        $a0, $a0, $v0
.L8003EAD8:
    jal         func_8003FF14
    nop
.L8003EAE0:
    lui         $a0, 0x8007
    lw          $a0, 0x40C4($a0)
    lhu         $v1, 0x0($a0)
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8003EA48
    andi        $v0, $s0, 0xFFFF
.L8003EB00:
    jal         func_80024E9C
    nop
.L8003EB08:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_bank_prepare

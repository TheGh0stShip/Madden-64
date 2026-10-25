.text
.align 2
.set noreorder
.globl audio_sequence_prepare
.ent audio_sequence_prepare
audio_sequence_prepare:
    lui         $v0, 0x8007
    lh          $v0, 0x40CA($v0)
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $s0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    beqz        $v0, .L8003ED44
    sw          $ra, 0x1C($sp)
    jal         func_8003FE94
    andi        $a0, $s1, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L8003ED44
    andi        $v0, $s2, 0xFFFF
    sll         $a0, $v0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a0, $a0, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $s0, 0xD89($at)
    addiu       $v0, $zero, 0xFF
    addu        $v1, $s0, $zero
    beq         $v1, $v0, .L8003ED44
    addiu       $a0, $zero, 0x12C
    jal         func_80031A1C
    negu        $s0, $s0
    addiu       $v0, $v0, 0xC8
    addu        $s0, $s0, $v0
    jal         func_80031A1C
    andi        $a0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x145
    beqz        $v0, .L8003ED4C
    nop
.L8003ED44:
    j .L8003EDF4
    addu        $v0, $zero, $zero
.L8003ED4C:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x63
    addu        $s0, $v0, $zero
    sll         $v0, $s0, 16
    bltz        $v0, .L8003ED90
    addiu       $a0, $zero, 0x6
.L8003ED64:
    addiu       $v0, $a0, -0x1
    sll         $v1, $v0, 16
    sra         $v1, $v1, 16
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v1, 0x40BC($at)
    subu        $v1, $s0, $v1
    addu        $s0, $v1, $zero
    sll         $v1, $v1, 16
    bgez        $v1, .L8003ED64
    addu        $a0, $v0, $zero
.L8003ED90:
    sll         $s0, $a0, 16
    sra         $s0, $s0, 14
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $a0, 0x40A5($at)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $v0, 0x40A4($at)
    subu        $a0, $a0, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    sll         $a0, $s1, 16
    sra         $a0, $a0, 16
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $a2, 0x40A4($at)
    andi        $s0, $s2, 0xFFFF
    addu        $a1, $s0, $zero
    addu        $a2, $a2, $v0
    jal         func_8003F060
    andi        $a2, $a2, 0xFFFF
    andi        $a0, $s1, 0xFFFF
    jal         func_80022738
    addu        $a1, $s0, $zero
    addiu       $v0, $zero, 0x1
.L8003EDF4:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end audio_sequence_prepare

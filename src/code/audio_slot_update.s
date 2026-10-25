.text
.align 2
.set noreorder
.globl audio_slot_update
.ent audio_slot_update
audio_slot_update:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sw          $s4, 0x20($sp)
    lui         $s4, 0x8007
    addiu       $s4, $s4, -0x461C
    sw          $s5, 0x24($sp)
    addiu       $s5, $s4, 0x2
    sw          $s3, 0x1C($sp)
    ori         $s3, $zero, 0xFFFF
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x40
    sw          $s1, 0x14($sp)
    addiu       $s1, $zero, 0x80
    sw          $ra, 0x28($sp)
    sll         $v0, $s0, 16
.L8003F38C:
    sra         $v0, $v0, 15
    addu        $v1, $v0, $s4
    addu        $v0, $v0, $s5
    lh          $a0, 0x0($v1)
    lh          $a1, 0x0($v0)
    addu        $a2, $zero, $zero
    jal         func_8003E510
    addu        $a3, $zero, $zero
    addu        $a1, $zero, $zero
    sll         $v0, $a1, 16
.L8003F3B4:
    sra         $a0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lhu         $v0, 0x2D84($at)
    beq         $v0, $s3, .L8003F41C
    sll         $v0, $a1, 16
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x2D87($at)
    andi        $v0, $v1, 0xE0
    bne         $v0, $s2, .L8003F41C
    sll         $v0, $a1, 16
    andi        $v0, $v1, 0x1F
    addiu       $v0, $v0, -0x1
    bnez        $v0, .L8003F408
    addu        $v1, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $s1, 0x2D87($at)
    j .L8003F41C
    sll         $v0, $a1, 16
.L8003F408:
    ori         $v0, $v1, 0x40
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x2D87($at)
    sll         $v0, $a1, 16
.L8003F41C:
    sra         $a0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lhu         $v0, 0x4ED0($at)
    beq         $v0, $s3, .L8003F484
    addiu       $v0, $a1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x4ED3($at)
    andi        $v0, $v1, 0xE0
    bne         $v0, $s2, .L8003F484
    addiu       $v0, $a1, 0x1
    andi        $v0, $v1, 0x1F
    addiu       $v0, $v0, -0x1
    bnez        $v0, .L8003F470
    addu        $v1, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $s1, 0x4ED3($at)
    j .L8003F484
    addiu       $v0, $a1, 0x1
.L8003F470:
    ori         $v0, $v1, 0x40
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x4ED3($at)
    addiu       $v0, $a1, 0x1
.L8003F484:
    addu        $a1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L8003F3B4
    sll         $v0, $a1, 16
    jal         func_8003EBC8
    nop
    addiu       $v0, $s0, 0x2
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x1E
    bnez        $v0, .L8003F38C
    sll         $v0, $s0, 16
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
.end audio_slot_update

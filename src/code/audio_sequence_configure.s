.text
.align 2
.set noreorder
.globl audio_sequence_configure
.ent audio_sequence_configure
audio_sequence_configure:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s2, 0x18($sp)
    ori         $s2, $zero, 0xFFFF
    sw          $s4, 0x20($sp)
    addiu       $s4, $zero, 0xE0
    sw          $s3, 0x1C($sp)
    addiu       $s3, $zero, 0x20
    sw          $ra, 0x24($sp)
    sw          $s0, 0x10($sp)
    sll         $v0, $s1, 16
.L8003F518:
    sra         $s0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v0, 0x2D84($at)
    beql        $v0, $s2, .L8003F5C4
    sll         $v0, $s1, 16
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x2D87($at)
    bne         $v1, $s4, .L8003F584
    andi        $v0, $v1, 0xE0
    jal         func_80031A1C
    addiu       $a0, $zero, 0x50
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x2D86($at)
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0x2E
    slt         $v1, $v1, $v0
    beqz        $v1, .L8003F5C4
    sll         $v0, $s1, 16
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x2D84
    jal         func_8003F230
    addu        $a0, $s0, $a0
    j .L8003F5C4
    sll         $v0, $s1, 16
.L8003F584:
    bne         $v0, $s3, .L8003F5C4
    sll         $v0, $s1, 16
    andi        $v0, $v1, 0x1F
    addiu       $v0, $v0, -0x1
    bnez        $v0, .L8003F5B0
    addu        $v1, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $s2, 0x2D84($at)
    j .L8003F5C4
    sll         $v0, $s1, 16
.L8003F5B0:
    ori         $v0, $v1, 0x20
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $v0, 0x2D87($at)
    sll         $v0, $s1, 16
.L8003F5C4:
    sra         $s0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v0, 0x4ED0($at)
    beql        $v0, $s2, .L8003F670
    addiu       $v0, $s1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x4ED3($at)
    bne         $v1, $s4, .L8003F630
    andi        $v0, $v1, 0xE0
    jal         func_80031A1C
    addiu       $a0, $zero, 0x50
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x4ED2($at)
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0x2E
    slt         $v1, $v1, $v0
    beqz        $v1, .L8003F670
    addiu       $v0, $s1, 0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x4ED0
    jal         func_8003F230
    addu        $a0, $s0, $a0
    j .L8003F670
    addiu       $v0, $s1, 0x1
.L8003F630:
    bne         $v0, $s3, .L8003F670
    addiu       $v0, $s1, 0x1
    andi        $v0, $v1, 0x1F
    addiu       $v0, $v0, -0x1
    bnez        $v0, .L8003F65C
    addu        $v1, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $s2, 0x4ED0($at)
    j .L8003F670
    addiu       $v0, $s1, 0x1
.L8003F65C:
    ori         $v0, $v1, 0x20
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $v0, 0x4ED3($at)
    addiu       $v0, $s1, 0x1
.L8003F670:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L8003F518
    sll         $v0, $s1, 16
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_sequence_configure

.text
.align 2
.set noreorder
.globl menu_player_update
.ent menu_player_update
menu_player_update:
    addiu       $sp, $sp, -0x38
    sw          $s3, 0x24($sp)
    addu        $s3, $a1, $zero
    sw          $s4, 0x28($sp)
    addu        $s4, $a2, $zero
    sw          $s5, 0x2C($sp)
    addu        $s5, $a3, $zero
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    addiu       $a0, $zero, 0x3
    sw          $ra, 0x30($sp)
    sw          $s1, 0x1C($sp)
    jal         func_8001FA38
    sw          $s0, 0x18($sp)
    addiu       $a0, $zero, 0xD
    sll         $v0, $v0, 16
    jal         func_8001FA50
    sra         $a1, $v0, 16
    jal         func_8001FA38
    addiu       $a0, $zero, 0x2
    addiu       $a0, $zero, 0xE
    sll         $v0, $v0, 16
    jal         func_8001FA50
    sra         $a1, $v0, 16
    jal         func_8001FA38
    addiu       $a0, $zero, 0x1
    addiu       $a0, $zero, 0xF
    sll         $v0, $v0, 16
    jal         func_8001FA50
    sra         $a1, $v0, 16
    andi        $s1, $s2, 0xFFFF
    jal         func_8001FA38
    addu        $a0, $s1, $zero
    addiu       $v1, $zero, 0x8
    subu        $v0, $v1, $v0
    sll         $v0, $v0, 16
    sra         $s0, $v0, 16
    beq         $s0, $v1, .L8001FC40
    addu        $v0, $zero, $zero
    jal         func_8001FA38
    addu        $a0, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addiu       $a0, $zero, 0x64
    subu        $a0, $a0, $v1
    .word       0x00900018  # mult        $a0, $s0
    .word       0x00002012  # mflo        $a0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    sll         $v1, $s1, 1
    addu        $v1, $v1, $s1
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v1, -0x6129($at)
    .word       0x02030018  # mult        $s0, $v1
    .word       0x00001812  # mflo        $v1
    andi        $v0, $v0, 0xFFFF
    slt         $v1, $v1, $v0
    bnel        $v1, $zero, .L8001FC40
    addu        $v0, $zero, $zero
    lui         $a0, 0x8008
    lh          $a0, 0x7A80($a0)
    bgtz        $a0, .L8001FC3C
    addu        $a1, $a0, $zero
    sll         $v0, $a0, 2
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $s3, -0x58BC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $s4, -0x58B8($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $s5, -0x58B4($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x58B0($at)
    sll         $v1, $s1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lw          $a0, -0x6178($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $s2, -0x58C0($at)
    addiu       $v1, $a1, 0x1
    lui         $at, 0x8008
    sh          $v1, 0x7A80($at)
    jal         func_800A18B4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L8001FC2C
    nop
    lui         $v1, 0x8009
    lbu         $v1, -0x750D($v1)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beq         $v1, $v0, .L8001FC2C
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L8001FC2C
    nop
    jal         func_800293CC
    nop
.L8001FC2C:
    lui         $at, 0x8009
    sh          $zero, -0x6B08($at)
    j .L8001FC40
    addiu       $v0, $zero, 0x1
.L8001FC3C:
    addu        $v0, $zero, $zero
.L8001FC40:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end menu_player_update

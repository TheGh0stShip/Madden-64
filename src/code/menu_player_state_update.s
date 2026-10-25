.text
.align 2
.set noreorder
.globl menu_player_state_update
.ent menu_player_state_update
menu_player_state_update:
    lui         $v0, 0x8008
    lh          $v0, 0x7A80($v0)
    addiu       $sp, $sp, -0x58
    sw          $ra, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    lui         $at, 0x8008
    sh          $zero, 0x7114($at)
    blez        $v0, .L800201A0
    addu        $v0, $zero, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x6B08($v0)
    bnez        $v0, .L800201A0
    addu        $v0, $zero, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x7F4C($v1)
    lui         $a0, 0x8009
    lw          $a0, -0x7F48($a0)
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    lui         $a1, 0x8009
    lhu         $a1, -0x7F3A($a1)
    lui         $a2, 0x8009
    lhu         $a2, -0x58C0($a2)
    addiu       $a3, $zero, 0x1
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7768
    lui         $at, 0x8009
    sh          $a3, -0x6B08($at)
    sh          $zero, 0x0($s0)
    lui         $at, 0x8008
    sw          $v1, 0x776C($at)
    lui         $at, 0x8008
    sw          $a0, 0x7770($at)
    sh          $v0, 0x14($s0)
    lui         $at, 0x8008
    sh          $a1, 0x777E($at)
    andi        $a1, $v0, 0xFFE3
    addiu       $v0, $zero, 0x12
    bne         $a2, $v0, .L8001FE40
    sh          $a1, 0x14($s0)
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0x4F34
    lw          $a0, 0x0($s1)
    lui         $v1, 0x8009
    lw          $v1, -0x58B8($v1)
    lui         $v0, 0xFEC0
    addu        $v0, $a0, $v0
    slt         $v0, $v0, $v1
    beqz        $v0, .L8001FE28
    lui         $v0, 0xFE20
    lui         $at, 0x8008
    sh          $a3, 0x7114($at)
    jal         func_8002E7A0
    lui         $a1, 0x50
    sra         $v0, $v0, 16
    andi        $v0, $v0, 0x1
    bnez        $v0, .L8001FE18
    addiu       $v1, $zero, -0x1
    lw          $v0, 0x0($s1)
    lui         $at, 0x8008
    sh          $v1, 0x777E($at)
    lui         $v1, 0x50
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
    j .L8002007C
    addiu       $a0, $zero, 0x19
.L8001FE18:
    lhu         $v0, 0x14($s0)
    ori         $v0, $v0, 0x8
    j .L80020078
    sh          $v0, 0x14($s0)
.L8001FE28:
    addu        $v0, $a0, $v0
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
    ori         $v0, $a1, 0x8
    j .L80020078
    sh          $v0, 0x14($s0)
.L8001FE40:
    lui         $v0, 0x8009
    lh          $v0, -0x58B0($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    bne         $v0, $v1, .L8001FFC8
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8001FE74
    nop
    jal         func_8001FC68
    nop
.L8001FE74:
    lui         $v0, 0x8009
    lw          $v0, -0x58BC($v0)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L8001FF58
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    bne         $v1, $v0, .L8001FEA8
    nop
    jal         func_8001FC68
    nop
.L8001FEA8:
    lui         $a0, 0x8009
    lw          $a0, -0x58B8($a0)
    lui         $v0, 0xFCE0
    slt         $v0, $a0, $v0
    beqz        $v0, .L8001FED4
    addiu       $v1, $zero, -0x2
    lhu         $v0, 0x14($s0)
    sh          $v1, 0x0($s0)
    ori         $v0, $v0, 0x10
    j .L80020070
    sh          $v0, 0x14($s0)
.L8001FED4:
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    slt         $v0, $v1, $a0
    beqz        $v0, .L8001FF14
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x7770($a1)
    slt         $v0, $a1, $a0
    bnez        $v0, .L8001FF0C
    slt         $v0, $a1, $v1
    lui         $at, 0x8008
    sw          $a0, 0x7770($at)
    j .L8001FF1C
    nop
.L8001FF0C:
    beqz        $v0, .L8001FF1C
    nop
.L8001FF14:
    lui         $at, 0x8008
    sw          $v1, 0x7770($at)
.L8001FF1C:
    lui         $v1, 0x8008
    lw          $v1, 0x7770($v1)
    lui         $v0, 0xFCE0
    slt         $v0, $v0, $v1
    bnez        $v0, .L80020070
    addiu       $v1, $zero, -0x2
    lui         $v0, 0x8008
    lhu         $v0, 0x777C($v0)
    lui         $at, 0x8008
    sh          $v1, 0x7768($at)
    ori         $v0, $v0, 0x10
    lui         $at, 0x8008
    sh          $v0, 0x777C($at)
    j .L80020070
    nop
.L8001FF58:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    bne         $v1, $v0, .L8001FFA8
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    blez        $v0, .L8001FF80
    addu        $v1, $v0, $zero
    j .L8001FF8C
    sh          $v1, 0x0($s0)
.L8001FF80:
    lhu         $v0, 0x14($s0)
    ori         $v0, $v0, 0x8
    sh          $v0, 0x14($s0)
.L8001FF8C:
    lui         $v1, 0x8009
    lw          $v1, -0x58B8($v1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    lui         $at, 0x8008
    sw          $v1, 0x4F34($at)
.L8001FFA8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x10
    or          $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    j .L80020070
    nop
.L8001FFC8:
    lui         $v0, 0x8009
    lw          $v0, -0x58BC($v0)
    lbu         $v0, 0x1E($v0)
    beq         $v0, $v1, .L8001FFE4
    ori         $v0, $a1, 0x2
    j .L80020070
    sh          $v0, 0x14($s0)
.L8001FFE4:
    lui         $a1, 0x8008
    lw          $a1, 0x4F34($a1)
    lui         $a0, 0x8009
    lw          $a0, -0x58B8($a0)
    lui         $at, 0x8008
    sh          $a3, 0x7114($at)
    negu        $a2, $a1
    slt         $v0, $a0, $a2
    bnez        $v0, .L80020028
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x58E0($v1)
    slt         $v0, $v1, $a0
    beqz        $v0, .L80020038
    slt         $v0, $v1, $a2
    beqz        $v0, .L8002003C
    negu        $v0, $v1
.L80020028:
    lui         $at, 0x8008
    sw          $a1, 0x7770($at)
    j .L80020044
    nop
.L80020038:
    negu        $v0, $a0
.L8002003C:
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
.L80020044:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x777C
    lhu         $v0, 0x0($a0)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    ori         $v0, $v0, 0x2
    sh          $v0, 0x0($a0)
    lui         $v0, 0x10
    or          $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
.L80020070:
    jal         func_800201B8
    nop
.L80020078:
    addiu       $a0, $zero, 0x19
.L8002007C:
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L800200A8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x5048($at)
    j .L800200B0
    nop
.L800200A8:
    lui         $at, 0x8009
    sb          $zero, -0x5048($at)
.L800200B0:
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    jal         func_8009C9E8
    nop
    addiu       $a0, $zero, 0x19
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x58C0
    lhu         $a1, 0x0($s0)
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, -0x612A($at)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L8002010C
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lh          $v1, 0x7114($v1)
    bnel        $v1, $v0, .L8002014C
    addiu       $s0, $sp, 0x28
.L8002010C:
    jal         func_8002062C
    nop
    lhu         $v1, 0x0($s0)
    lui         $a1, 0x8009
    lw          $a1, -0x58BC($a1)
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x3A08
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0xAF
    sh          $v0, 0x20($sp)
    sw          $v1, 0x14($sp)
    j .L80020194
    sw          $a1, 0x18($sp)
.L8002014C:
    lui         $v1, 0x8009
    lw          $v1, -0x58BC($v1)
    addu        $a0, $s0, $zero
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x3A08
    sw          $v0, 0x28($sp)
    addiu       $v0, $zero, 0x3
    sw          $v0, 0x34($sp)
    addiu       $v0, $zero, 0xAF
    sw          $a1, 0x2C($sp)
    sh          $v0, 0x38($sp)
    jal         func_800AE924
    sw          $v1, 0x30($sp)
    addu        $a0, $s0, $zero
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x1218
    sw          $v0, 0x28($sp)
    sh          $zero, 0x38($sp)
.L80020194:
    jal         func_800AE924
    nop
    addiu       $v0, $zero, 0x1
.L800201A0:
    lw          $ra, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end menu_player_state_update

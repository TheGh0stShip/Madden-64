.text
.align 2
.set noreorder
.globl game_mode_initialize
.ent game_mode_initialize
game_mode_initialize:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    sh          $zero, 0x7A80($at)
    jal         func_8009E0CC
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x1F
    beqz        $v0, .L800214E4
    addiu       $a0, $zero, 0x19
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x4
    bnez        $v0, .L800214E4
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x76DC($a0)
    xori        $v1, $a0, 0x2
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x4
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    bnez        $v1, .L80021450
    addiu       $v0, $zero, 0x5
    bne         $a0, $v0, .L800214E4
    addiu       $a0, $zero, 0x19
.L80021450:
    lui         $v0, 0x8009
    lw          $v0, -0x58BC($v0)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    bne         $v1, $v0, .L800214E4
    addiu       $a0, $zero, 0x19
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D96($at)
    bnez        $v0, .L800214E4
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lb          $v1, -0x5048($v1)
    bne         $v1, $v0, .L800214E4
    nop
    jal         func_8009BCB0
    nop
    jal         func_8009BD04
    addiu       $a0, $zero, 0x2
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0xFFEF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    addiu       $a0, $zero, 0x19
.L800214E4:
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end game_mode_initialize

.text
.align 2
.set noreorder
.globl func_800A22FC
.ent func_800A22FC
func_800A22FC:
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    jal         func_8009C9E8
    addu        $s7, $zero, $zero
    addiu       $a0, $zero, 0x19
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    lui         $v0, 0x300
    lui         $at, 0x8008
    sw          $v0, 0x78E4($at)
    lui         $at, 0x8008
    sw          $zero, 0x78E0($at)
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A23DC
    addiu       $a0, $zero, 0x2
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a2, 0xC90($at)
    addiu       $a1, $zero, 0xF
    addu        $a3, $zero, $zero
    jal         func_800B7DD8
    sw          $zero, 0x10($sp)
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    beqz        $a0, .L800A23DC
    addiu       $a1, $sp, 0x18
    addiu       $v0, $zero, 0x1
    sb          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x8
    jal         func_800E1A84
    sb          $v0, 0x19($sp)
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    addiu       $a1, $sp, 0x18
    addiu       $v0, $zero, 0x25
    sb          $v0, 0x18($sp)
    jal         func_800E1BAC
    sb          $zero, 0x19($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x6B04($v0)
    addiu       $v0, $v0, 0x3C
    lui         $at, 0x8009
    sh          $v0, -0x6B04($at)
.L800A23DC:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x78E4
    lw          $v0, 0x0($a0)
    lui         $v1, 0xFCE0
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A2448
    addiu       $v0, $zero, -0x1
    lui         $v0, 0x8008
    lh          $v0, 0x7AF0($v0)
    bgezl       $v0, .L800A2424
    addiu       $s7, $zero, 0x1
    jal         menu_sound_play
    addiu       $a0, $zero, 0x1
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    ori         $s5, $s5, 0x10
    j           func_8009DD20
    addiu       $fp, $zero, -0x2
.L800A2424:
    lui         $v0, 0xFE20
    lui         $at, 0x8008
    sw          $zero, 0x78E0($at)
    sw          $v0, 0x0($a0)
    lui         $at, 0x8008
    sh          $s7, 0x7AF0($at)
    j           func_8009DD2C
    ori         $s5, $s5, 0x8
    addiu       $v0, $zero, -0x1
.L800A2448:
    lui         $at, 0x8008
    sh          $v0, 0x7AF0($at)
    sll         $a0, $s7, 16
    sra         $a0, $a0, 16
    sll         $a1, $s5, 16
.end func_800A22FC

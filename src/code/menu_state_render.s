.text
.align 2
.set noreorder
.globl menu_state_render
.ent menu_state_render
menu_state_render:
    lui         $v1, 0x8008
    lhu         $v1, 0x7768($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x776C($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7770($a1)
    lui         $a2, 0x8008
    lhu         $a2, 0x777C($a2)
    lui         $a3, 0x8008
    lhu         $a3, 0x777E($a3)
    lui         $t0, 0x8009
    lw          $t0, -0x58BC($t0)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x7944($at)
    lui         $v0, 0x8009
    lbu         $v0, -0x750D($v0)
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    lui         $at, 0x8009
    sh          $v1, -0x7F50($at)
    lui         $at, 0x8009
    sw          $a0, -0x7F4C($at)
    lui         $at, 0x8009
    sw          $a1, -0x7F48($at)
    lui         $at, 0x8009
    sh          $a2, -0x7F3C($at)
    lui         $at, 0x8009
    sh          $a3, -0x7F3A($at)
    lbu         $v1, 0x1E($t0)
    bne         $v1, $v0, .L800206D0
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x4FA4($v1)
    sll         $v0, $v1, 16
    blez        $v0, .L800206E8
    addu        $s1, $v1, $zero
    j .L800206E8
    negu        $s1, $v1
.L800206D0:
    lui         $v1, 0x8009
    lw          $v1, -0x4FA4($v1)
    sll         $v0, $v1, 16
    bgez        $v0, .L800206E8
    addu        $s1, $v1, $zero
    negu        $s1, $v1
.L800206E8:
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x58C0
    lhu         $v0, 0x0($s0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v1, -0x612A($at)
    andi        $v0, $v1, 0x2
    beqz        $v0, .L80020764
    andi        $v0, $v1, 0x4
    jal         func_80025AB8
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x58BC($a0)
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8009
    sb          $v0, -0x6D5C($at)
    lui         $at, 0x8009
    sb          $s1, -0x6D5B($at)
    jal         func_800297FC
    nop
    lhu         $v1, 0x0($s0)
    j .L800208B0
    nop
.L80020764:
    beqz        $v0, .L8002086C
    nop
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
    lh          $v0, 0x2CA8($at)
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    blez        $v0, .L8002086C
    addu        $a1, $zero, $zero
    addiu       $a3, $zero, 0x26
    addiu       $a2, $zero, 0xFF
    sll         $v0, $v1, 16
.L800207C0:
    sra         $v0, $v0, 16
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a0, 0x2CAB($at)
    addiu       $v0, $a0, -0x24
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80020810
    nop
    bne         $a0, $a3, .L8002081C
    nop
.L80020810:
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $a2, 0x2CAB($at)
.L8002081C:
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
    lh          $v0, 0x2CA8($at)
    addiu       $a1, $a1, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    slt         $v0, $a1, $v0
    bnez        $v0, .L800207C0
    sll         $v0, $v1, 16
.L8002086C:
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x6D5C
    lbu         $v0, 0x0($s0)
    beqz        $v0, .L80020888
    ori         $v0, $v0, 0x80
    jal         func_80029858
    sb          $v0, 0x0($s0)
.L80020888:
    lui         $a0, 0x8009
    lw          $a0, -0x58BC($a0)
    addiu       $v0, $zero, 0x9
    sb          $v0, 0x0($s0)
    lui         $at, 0x8009
    sb          $s1, -0x6D5B($at)
    jal         func_800297FC
    nop
    lui         $v1, 0x8009
    lhu         $v1, -0x58C0($v1)
.L800208B0:
    lui         $at, 0x8009
    sb          $v0, -0x6D5A($at)
    lui         $at, 0x8009
    sb          $v1, -0x6D59($at)
    lui         $v0, 0x8009
    lw          $v0, -0x58BC($v0)
    lbu         $a0, 0x1E($v0)
    addiu       $a1, $zero, 0x8
    jal         func_80025944
    addiu       $a2, $zero, 0x1
    lui         $v1, 0x8009
    lw          $v1, -0x4FA4($v1)
    sll         $v0, $v1, 16
    bgez        $v0, .L800208F0
    addu        $a2, $v1, $zero
    negu        $a2, $v1
.L800208F0:
    sll         $v0, $a2, 16
    blezl       $v0, .L800208FC
    addiu       $a2, $zero, 0x1
.L800208FC:
    lui         $v0, 0x8009
    lw          $v0, -0x58BC($v0)
    addiu       $a1, $zero, 0x9
    lbu         $a0, 0x1E($v0)
    sll         $a2, $a2, 16
    jal         func_80025944
    sra         $a2, $a2, 16
    jal         func_800213E4
    nop
    lw          $ra, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end menu_state_render

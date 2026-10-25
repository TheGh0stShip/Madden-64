.text
.align 2
.set noreorder
.globl menu_state_process
.ent menu_state_process
menu_state_process:
    lui         $v0, 0x8007
    lh          $v0, -0x6D4E($v0)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x18($sp)
    bnez        $v0, .L8001F114
    sw          $s0, 0x10($sp)
    sll         $v0, $s1, 5
    subu        $v0, $v0, $s1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, -0x7B08($at)
    addiu       $v1, $v1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, -0x7B08($at)
.L8001F114:
    sll         $v0, $s1, 5
    subu        $v0, $v0, $s1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s1
    sll         $a1, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v1, -0x7B0C($at)
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lbu         $v0, -0x7B08($at)
    lw          $v1, 0x0($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $s0, 0x0($v0)
    bnez        $s0, .L8001F178
    nop
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lw          $v0, -0x7B0C($at)
    lui         $at, 0x8008
    addu        $at, $at, $a1
    sb          $zero, -0x7B08($at)
    lw          $v0, 0x0($v0)
    lw          $s0, 0x0($v0)
.L8001F178:
    lui         $at, 0x8008
    addu        $at, $at, $a1
    sw          $zero, -0x7A54($at)
    andi        $v0, $s0, 0xFF00
    sltiu       $v0, $v0, 0x201
    bnez        $v0, .L8001F22C
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x6DD8($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    beq         $v1, $v0, .L8001F1C4
    nop
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7B04
    addu        $a0, $a1, $a0
    lui         $a1, 0x6
    j .L8001F23C
    ori         $a1, $a1, 0x45
.L8001F1C4:
    jal         func_800353B0
    nop
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L8001F244
    nop
.L8001F1E8:
    jal         func_80035380
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFF
    beqz        $v0, .L8001F1E8
    sll         $a0, $s1, 5
    subu        $a0, $a0, $s1
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s1
    sll         $a0, $a0, 3
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x7B04
    addu        $a0, $a0, $v0
    addu        $a1, $s0, $zero
    jal         func_80035064
    addu        $a2, $zero, $zero
    j .L8001F244
    nop
.L8001F22C:
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7B04
    addu        $a0, $a1, $a0
    addu        $a1, $s0, $zero
.L8001F23C:
    jal         func_80034388
    nop
.L8001F244:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end menu_state_process

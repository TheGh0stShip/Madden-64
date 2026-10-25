.text
.align 2
.set noreorder
.globl game_mode_update
.ent game_mode_update
game_mode_update:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    beqz        $v0, .L800213D0
    sw          $ra, 0x14($sp)
    jal         func_8001FA38
    addiu       $a0, $zero, 0x9
    addiu       $v0, $v0, 0x5
    jal         func_80031A1C
    andi        $a0, $v0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L800213D0
    nop
    lw          $v1, 0x24($s0)
    lw          $v0, 0x1C($v1)
    bgez        $v0, .L8002126C
    addu        $a0, $v0, $zero
    negu        $a0, $a0
.L8002126C:
    lui         $v0, 0x50
    slt         $v0, $v0, $a0
    bnez        $v0, .L800213D0
    nop
    lw          $v0, 0x20($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800213D0
    nop
    jal         func_800C9090
    addu        $a0, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a2, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5112
.L800212AC:
    sll         $v0, $a2, 16
    sra         $v0, $v0, 15
    addu        $v0, $v0, $a1
    lh          $v1, 0x0($v0)
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, .L800212AC
    addu        $a0, $a0, $v1
    slti        $v0, $a0, -0x8
    beqz        $v0, .L800213D0
    addiu       $a2, $zero, 0x1
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x7A70
    lw          $t1, 0x0($a3)
    lbu         $v0, 0x1E($s0)
    lui         $t2, 0x60
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $t0, $v1, $a0
    sll         $v0, $a2, 16
.L8002131C:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t0
    lw          $v0, 0x0($v0)
    lw          $a1, 0x24($v0)
    lw          $v0, 0x1C($a1)
    subu        $a0, $t1, $v0
    bltzl       $a0, .L8002133C
    negu        $a0, $a0
.L8002133C:
    lw          $v1, 0x4($a3)
    lw          $v0, 0x20($a1)
    subu        $v1, $v1, $v0
    bltzl       $v1, .L80021350
    negu        $v1, $v1
.L80021350:
    slt         $v0, $a0, $v1
    beqz        $v0, .L8002136C
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j .L8002137C
    addu        $a0, $v1, $v0
.L8002136C:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $a0, $a0, $v0
.L8002137C:
    slt         $v0, $t2, $a0
    beqz        $v0, .L800213A0
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x6
    bnez        $v0, .L8002131C
    sll         $v0, $a2, 16
.L800213A0:
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x6
    bne         $v0, $v1, .L800213D0
    addiu       $a0, $zero, 0x9
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    jal         func_8001FA68
    addu        $a1, $s0, $zero
.L800213D0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end game_mode_update

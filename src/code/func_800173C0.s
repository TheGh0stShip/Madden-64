.text
.align 2
.set noreorder
.globl func_800173C0
.ent func_800173C0
func_800173C0:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $v1, 0x30($s0)
    andi        $v0, $v1, 0x20
    bnez        $v0, .L800174B4
    andi        $v0, $v1, 0x100
    beqz        $v0, .L80017438
    nop
    lw          $a0, 0x28($s0)
    jal         func_8001A8A8
    nop
    lw          $a1, 0x28($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $v0, 0x30($s0)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L80017438
    nop
    lw          $a1, 0x20($s0)
    beqz        $a1, .L80017424
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L80017424:
    lw          $a1, 0x24($s0)
    beqz        $a1, .L80017438
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L80017438:
    lw          $v0, 0x30($s0)
    andi        $v0, $v0, 0x80
    bnez        $v0, .L80017454
    nop
    lw          $a1, 0x4($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L80017454:
    lw          $a1, 0x40($s0)
    beqz        $a1, .L80017470
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x44($s0)
    sw          $zero, 0x40($s0)
.L80017470:
    lw          $a1, 0x0($s0)
    beqz        $a1, .L80017488
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x0($s0)
.L80017488:
    lw          $v1, 0x30($s0)
    andi        $v0, $v1, 0x4
    bnez        $v0, .L800174B4
    andi        $v0, $v1, 0x4008
    bnez        $v0, .L800174B4
    nop
    lw          $a1, 0x8($s0)
    beqz        $a1, .L800174B4
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L800174B4:
    lw          $v0, 0x30($s0)
    andi        $v0, $v0, 0x400
    beqz        $v0, .L800174D8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x5900($a0)
    lw          $a1, 0x20($s0)
    jal         func_800332C8
    nop
.L800174D8:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800173C0

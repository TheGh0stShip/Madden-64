.text
.align 2
.set noreorder
.globl func_800AA490
.ent func_800AA490
func_800AA490:
    addu        $t1, $a0, $zero
    lw          $v0, 0x0($t1)
    lw          $v1, 0x10($sp)
    lw          $a0, 0x0($a1)
    subu        $t0, $a2, $v0
    srav        $v1, $t0, $v1
    addu        $a0, $a0, $v1
    bgez        $t0, .L800AA4D4
    sw          $a0, 0x0($a1)
    negu        $v0, $t0
    srav        $a3, $v0, $a3
    negu        $v0, $a0
    slt         $v0, $v0, $a3
    bnez        $v0, .L800AA4E8
    nor         $v0, $zero, $a3
    j           func_800A5DC4
    sw          $v0, 0x0($a1)
.L800AA4D4:
    srav        $a3, $t0, $a3
    slt         $v0, $a0, $a3
    bnez        $v0, .L800AA4E8
    addiu       $v0, $a3, 0x1
    sw          $v0, 0x0($a1)
.L800AA4E8:
    lw          $v0, 0x0($t1)
    lw          $v1, 0x0($a1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($t1)
    subu        $v0, $a2, $v0
    xor         $v0, $t0, $v0
    bgtz        $v0, .L800AA514
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x1
    sw          $a2, 0x0($t1)
    sw          $zero, 0x0($a1)
.L800AA514:
    jr          $ra
    nop
.end func_800AA490

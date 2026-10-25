.text
.align 2
.set noreorder
.globl func_800C2368
.ent func_800C2368
func_800C2368:
    lui         $v0, 0x8009
    lbu         $v0, -0x503A($v0)
    beqz        $v0, .L800C23FC
    sll         $v1, $a0, 1
    lui         $v0, 0x8009
    lw          $v0, -0x6B70($v0)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s5
    lh          $v1, 0x0($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    beq         $v1, $v0, .L800C23FC
    sll         $v1, $a0, 1
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    beq         $v0, $s4, .L800C2400
    addu        $v1, $v1, $a0
    lui         $v1, 0x8009
    lbu         $v1, -0x6AE6($v1)
    beqz        $v1, .L800C23F8
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s2
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $s0, 0x0($v1)
    lw          $a1, 0x24($s0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
    j           func_800BDD2C
    nop
.L800C23F8:
    sll         $v1, $a0, 1
.L800C23FC:
    addu        $v1, $v1, $a0
.L800C2400:
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DB4($at)
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lh          $v0, 0x0($v0)
    sll         $v1, $v1, 3
    addu        $v1, $v1, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $s0, 0x0($v0)
    lh          $a1, 0x2($s1)
    jal         func_800BDD70
    addu        $a0, $s0, $zero
    addiu       $s1, $s1, 0x4
    lw          $v0, 0x0($s1)
    bne         $v0, $s4, . + 4 + (-0x44 << 2)
    sll         $v0, $v0, 1
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C2368

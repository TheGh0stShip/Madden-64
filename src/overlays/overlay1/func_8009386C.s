.text
.align 2
.set noreorder
.globl func_8009386C
.ent func_8009386C
func_8009386C:
    lw          $v1, 0x0($v1)
    bnez        $a0, .L800938A8
    lui         $a0, 0xFFE8
    lw          $v1, 0x24($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x4F30($v0)
    lw          $v1, 0x1C($v1)
    addu        $v0, $v0, $a0
    slt         $v1, $v1, $v0
    beqz        $v1, .L800938DC
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x49E8($at)
    j           func_8008F1B0
    nop
.L800938A8:
    lw          $v1, 0x24($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x4F30($v0)
    lw          $a0, 0x1C($v1)
    lui         $v1, 0x18
    addu        $v0, $v0, $v1
    slt         $v0, $v0, $a0
    beqz        $v0, .L800938DC
    nop
    lui         $at, 0x8009
    sb          $zero, -0x49E8($at)
    jal         func_800D62A8
    nop
.L800938DC:
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    beqz        $v0, .L80093A0C
    addu        $s2, $zero, $zero
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0x5040
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x78A8
    lui         $s3, 0x8007
    addiu       $s3, $s3, 0x2720
.L80093908:
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $s0, $s2, 16
    sra         $s0, $s0, 14
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s1
    addu        $v0, $s0, $v0
    lw          $a0, 0x0($v0)
    jal         func_800DC5C0
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s1
    addu        $a2, $s0, $v0
    lw          $v0, 0x0($a2)
    lbu         $a0, 0x21($v0)
    addiu       $v0, $zero, 0x40
    andi        $v1, $a0, 0xC0
    bne         $v1, $v0, .L800939E8
    addiu       $v0, $s2, 0x1
    andi        $v0, $a0, 0x3F
    sll         $a0, $v0, 2
    addu        $a1, $a0, $s4
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v1, -0x4D58($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6C80
    addu        $a0, $a0, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s3
    lw          $v1, 0x0($v1)
    lw          $v0, 0x0($a0)
    lw          $a1, 0x0($a1)
    lw          $v1, 0x8($v1)
    nor         $v0, $zero, $v0
    and         $s0, $a1, $v0
    and         $v0, $s0, $v1
    beqz        $v0, .L800939E8
    addiu       $v0, $s2, 0x1
    or          $v0, $a1, $v1
    sw          $v0, 0x0($a0)
    lw          $a0, 0x0($a2)
    lbu         $a1, 0x21($a0)
    jal         func_800BDD70
    andi        $a1, $a1, 0x3F
    addiu       $v0, $s2, 0x1
.L800939E8:
    addu        $s2, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnez        $v0, .L80093908
    nop
.L80093A0C:
    lw          $ra, 0x58($sp)
    lw          $s7, 0x54($sp)
    lw          $s6, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
.end func_8009386C

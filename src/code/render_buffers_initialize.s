.text
.align 2
.set noreorder
.globl render_buffers_initialize
.ent render_buffers_initialize
render_buffers_initialize:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sw          $s1, 0x14($sp)
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0x54A8
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    addu        $a0, $zero, $zero
.L800114F4:
    jal         func_80032E00
    addiu       $a1, $zero, 0x960
    sll         $v1, $s0, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s1
    sw          $v0, 0x0($v1)
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x40
    bnez        $v0, .L800114F4
    addu        $a0, $zero, $zero
    jal         func_8000BF08
    nop
    jal         func_8000BE80
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    addu        $t7, $zero, $zero
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x55D8($at)
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x54A8
    lui         $v0, 0xA000
    or          $t9, $v1, $v0
    addu        $t1, $zero, $zero
.L80011568:
    sll         $v0, $t7, 16
    sra         $v0, $v0, 16
    sll         $a0, $v0, 4
    subu        $a0, $a0, $v0
    sll         $s1, $a0, 1
    sll         $t8, $v0, 3
    addiu       $v0, $v0, 0x1
    sll         $v1, $v0, 4
    subu        $v1, $v1, $v0
    sll         $t3, $v1, 1
    sll         $a0, $a0, 17
    sra         $a0, $a0, 16
    slt         $t6, $a0, $t3
    addu        $a2, $zero, $zero
.L800115A0:
    addu        $a3, $s1, $zero
    sll         $v1, $t1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 2
    addu        $a1, $v0, $v1
    sll         $t5, $a1, 3
    addiu       $a0, $v1, 0x1
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $t8, $v1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s2
    lw          $t4, 0x0($v1)
    beqz        $t6, .L80011664
    sll         $t0, $v0, 3
    sll         $v0, $a1, 19
    sra         $v0, $v0, 16
    slt         $t2, $v0, $t0
.L800115E8:
    beqz        $t2, .L80011648
    addu        $s0, $t5, $zero
    sll         $v0, $a3, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $a1, $v1, 6
    sll         $v0, $a2, 1
    addu        $a0, $v0, $t4
.L8001160C:
    addiu       $a2, $a2, 0x1
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    addu        $v0, $a1, $v0
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t9
    lhu         $v1, 0x0($v0)
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t0
    sh          $v1, 0x0($a0)
    bnez        $v0, .L8001160C
    addiu       $a0, $a0, 0x2
.L80011648:
    addiu       $v0, $a3, 0x1
    addu        $a3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t3
    bnez        $v0, .L800115E8
    nop
.L80011664:
    addiu       $v0, $t1, 0x1
    addu        $t1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnel        $v0, $zero, .L800115A0
    addu        $a2, $zero, $zero
    addiu       $v0, $t7, 0x1
    addu        $t7, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, .L80011568
    addu        $t1, $zero, $zero
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end render_buffers_initialize

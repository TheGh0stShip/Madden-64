.text
.align 2
.set noreorder
.globl memory_pool_finalize
.ent memory_pool_finalize
memory_pool_finalize:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    andi        $a0, $a0, 0x8000
    sw          $ra, 0x1C($sp)
    bnez        $a0, .L800360E4
    sw          $s0, 0x10($sp)
    andi        $s0, $s2, 0xFFFF
    jal         func_800369A0
    addu        $a0, $s0, $zero
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $a0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lw          $v0, -0x4F84($at)
    sll         $v1, $s1, 2
    addu        $v0, $v1, $v0
    lw          $v0, 0x0($v0)
    beqz        $v0, .L800360E4
    nop
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lw          $v0, -0x4F80($at)
    addu        $v0, $v0, $s1
    lbu         $v0, 0x0($v0)
    andi        $v0, $v0, 0x10
    beql        $v0, $zero, .L80036070
    andi        $v1, $s2, 0xFFFF
    addiu       $a1, $zero, 0xF
    addu        $a3, $a0, $zero
    addu        $a2, $v1, $zero
    ori         $t0, $zero, 0xFFFF
.L80036014:
    andi        $a0, $a1, 0xFFFF
    sll         $v0, $a0, 1
    lui         $at, 0x8009
    addu        $at, $at, $a3
    lw          $v1, -0x4F84($at)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x4F88($at)
    addu        $v1, $a2, $v1
    lw          $v0, 0x0($v1)
    bne         $a0, $v0, .L80036060
    addu        $v0, $a1, $zero
    ori         $a0, $a1, 0x8000
    jal         func_80035A7C
    andi        $a0, $a0, 0xFFFF
    j .L800360E4
    nop
.L80036060:
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L80036014
    addu        $a1, $a1, $t0
    andi        $v1, $s2, 0xFFFF
.L80036070:
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $s0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F80($at)
    addu        $v0, $v0, $s1
    lbu         $v0, 0x0($v0)
    andi        $v0, $v0, 0x20
    bnez        $v0, .L800360B8
    sll         $v0, $s1, 2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F84($at)
    addu        $v0, $v0, $v1
    lw          $a1, 0x0($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
.L800360B8:
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F84($at)
    sll         $v1, $s1, 2
    addu        $v1, $v1, $v0
    sw          $zero, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F80($at)
    addu        $v0, $v0, $s1
    sb          $zero, 0x0($v0)
.L800360E4:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end memory_pool_finalize

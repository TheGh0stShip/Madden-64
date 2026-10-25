.text
.align 2
.set noreorder
.globl func_800592E8
.ent func_800592E8
func_800592E8:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    lw          $s2, 0x38($sp)
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a3, $zero
    sw          $ra, 0x24($sp)
    sw          $s3, 0x1C($sp)
    slt         $v0, $a2, $s2
    beqz        $v0, .L80059330
    sw          $s0, 0x10($sp)
    jal         func_80059154
    addu        $a3, $s2, $zero
    beqz        $v0, .L80059410
    addiu       $v0, $zero, -0x1
    lw          $a1, 0xC($s1)
    lw          $a2, 0x10($s1)
.L80059330:
    subu        $a2, $a2, $s2
    srav        $a0, $a1, $a2
    addiu       $v0, $zero, 0x1
    sllv        $v0, $v0, $s2
    sll         $v1, $s2, 2
    addu        $a3, $v1, $s4
    lw          $v1, 0x44($a3)
    addiu       $v0, $v0, -0x1
    and         $s0, $a0, $v0
    slt         $v1, $v1, $s0
    beqz        $v1, .L800593B0
    slti        $v0, $s2, 0x11
    addu        $s3, $a3, $zero
.L80059364:
    bgtz        $a2, .L80059388
    sll         $s0, $s0, 1
    addu        $a0, $s1, $zero
    jal         func_80059154
    addiu       $a3, $zero, 0x1
    beqz        $v0, .L80059410
    addiu       $v0, $zero, -0x1
    lw          $a1, 0xC($s1)
    lw          $a2, 0x10($s1)
.L80059388:
    addiu       $a2, $a2, -0x1
    addiu       $s3, $s3, 0x4
    srav        $v0, $a1, $a2
    andi        $v0, $v0, 0x1
    lw          $v1, 0x44($s3)
    or          $s0, $s0, $v0
    slt         $v1, $v1, $s0
    bnez        $v1, .L80059364
    addiu       $s2, $s2, 0x1
    slti        $v0, $s2, 0x11
.L800593B0:
    sw          $a1, 0xC($s1)
    beqz        $v0, .L800593E8
    sw          $a2, 0x10($s1)
    sll         $v0, $s2, 2
    addu        $v0, $v0, $s4
    lw          $v1, 0x0($v0)
    lw          $v0, 0x8C($v0)
    lw          $a0, 0xD0($s4)
    subu        $v1, $s0, $v1
    addu        $v0, $v0, $v1
    addu        $a0, $a0, $v0
    lbu         $v0, 0x11($a0)
    j .L80059410
    nop
.L800593E8:
    lw          $v0, 0x14($s1)
    lw          $v1, 0x0($v0)
    addiu       $v0, $zero, 0x72
    sw          $v0, 0x14($v1)
    lw          $a0, 0x14($s1)
    lw          $v0, 0x0($a0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addiu       $a1, $zero, -0x1
    addu        $v0, $zero, $zero
.L80059410:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800592E8

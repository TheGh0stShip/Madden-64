.text
.align 2
.set noreorder
.globl func_8009B2C4
.ent func_8009B2C4
func_8009B2C4:
    bnez        $v0, .L8009B2D8
    andi        $v0, $a1, 0x40
    sb          $a1, 0x0($s2)
    j           func_80096B5C
    addiu       $s2, $s2, 0x1
.L8009B2D8:
    bnez        $v0, .L8009B348
    andi        $v0, $a1, 0x20
    beqz        $v0, .L8009B308
    andi        $a2, $a1, 0x1F
    addiu       $s0, $s0, -0x1
    srl         $v0, $s1, 28
    sll         $s4, $v0, 4
    bnez        $s0, .L8009B308
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B308:
    beql        $a2, $zero, . + 4 + (-0x22 << 2)
    addiu       $s0, $s0, -0x1
.L8009B310:
    addiu       $a2, $a2, -0x1
    addiu       $s0, $s0, -0x1
    srl         $a1, $s1, 28
    bnez        $s0, .L8009B330
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B330:
    or          $v0, $s4, $a1
    sb          $v0, 0x0($s2)
    bnez        $a2, .L8009B310
    addiu       $s2, $s2, 0x1
    j           func_80096B60
    addiu       $s0, $s0, -0x1
.L8009B348:
    bnel        $v0, $zero, .L8009B3D0
    andi        $v0, $a1, 0x10
    andi        $a2, $a1, 0x3F
    beqz        $a2, .L8009B464
    andi        $a0, $s2, 0x3
    beqz        $a0, .L8009B378
    addiu       $v0, $zero, 0x4
    j           func_80096C54
    subu        $a0, $v0, $a0
.L8009B36C:
    addiu       $a2, $a2, -0x1
    sb          $zero, 0x0($s2)
    addiu       $s2, $s2, 0x1
.L8009B378:
    sltu        $v0, $zero, $a2
    sltu        $v1, $zero, $a0
    and         $v0, $v0, $v1
    bnel        $v0, $zero, .L8009B36C
    addiu       $a0, $a0, -0x1
    sltiu       $v0, $a2, 0x4
    bnez        $v0, .L8009B3B0
    addu        $v1, $s2, $zero
.L8009B398:
    addiu       $a2, $a2, -0x4
    addiu       $s2, $s2, 0x4
    sw          $zero, 0x0($v1)
    sltiu       $v0, $a2, 0x4
    beqz        $v0, .L8009B398
    addiu       $v1, $v1, 0x4
.L8009B3B0:
    beql        $a2, $zero, . + 4 + (-0x4C << 2)
    addiu       $s0, $s0, -0x1
.L8009B3B8:
    addiu       $a2, $a2, -0x1
    sb          $zero, 0x0($s2)
    bnez        $a2, .L8009B3B8
    addiu       $s2, $s2, 0x1
    j           func_80096B60
    addiu       $s0, $s0, -0x1
.L8009B3D0:
    bnez        $v0, .L8009B44C
    andi        $v0, $a1, 0x7
    addiu       $a2, $v0, 0x3
    andi        $v0, $a1, 0x8
    beqz        $v0, .L8009B408
    addu        $v1, $s4, $zero
    addiu       $s0, $s0, -0x1
    srl         $v0, $s1, 28
    sll         $v1, $v0, 4
    bnez        $s0, .L8009B408
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B408:
    addiu       $s0, $s0, -0x1
    srl         $v0, $s1, 28
    or          $v1, $v1, $v0
    bnez        $s0, .L8009B428
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B428:
    beql        $a2, $zero, . + 4 + (-0x6A << 2)
    addiu       $s0, $s0, -0x1
    addu        $v0, $v1, $zero
.L8009B434:
    addiu       $a2, $a2, -0x1
    sb          $v0, 0x0($s2)
    bnez        $a2, .L8009B434
    addiu       $s2, $s2, 0x1
    j           func_80096B60
    addiu       $s0, $s0, -0x1
.L8009B44C:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x748
    jal         func_8002CA88
    addiu       $s0, $s0, -0x1
    j           func_80096B64
    srl         $v0, $s1, 28
.L8009B464:
    subu        $v0, $s2, $s5
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
.end func_8009B2C4

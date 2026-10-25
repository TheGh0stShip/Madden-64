.text
.align 2
.set noreorder
.globl memory_pool_prepare
.ent memory_pool_prepare
memory_pool_prepare:
    lui         $v0, 0x8007
    lbu         $v0, 0x12F8($v0)
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    beqz        $v0, .L80035DD4
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, -0x5B00($v0)
    bnel        $v0, $zero, .L80035DD8
    andi        $v0, $a0, 0x8000
    jal         func_8003647C
    andi        $a0, $a0, 0xFFFF
    addu        $a0, $zero, $zero
    jal         func_80036540
    addu        $s0, $v0, $zero
    j .L80035ECC
    addu        $v0, $s0, $zero
.L80035DD4:
    andi        $v0, $a0, 0x8000
.L80035DD8:
    beqz        $v0, .L80035E14
    andi        $v1, $a0, 0x7FFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x4F88($at)
    sll         $v1, $s1, 1
    addu        $v1, $v1, $s1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $s0, 0x0($v1)
    j .L80035ECC
    addu        $v0, $s0, $v0
.L80035E14:
    andi        $s3, $a0, 0xFFFF
    addu        $a0, $s3, $zero
    jal         func_800369A0
    addu        $a1, $s1, $zero
    sll         $v0, $s3, 1
    addu        $v0, $v0, $s3
    sll         $s2, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v0, -0x4F84($at)
    sll         $s4, $s1, 2
    addu        $v0, $s4, $v0
    lw          $v0, 0x0($v0)
    bnez        $v0, .L80035ECC
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s1
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v1, -0x4F88($at)
    sll         $v0, $s1, 1
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $s0, 0x4($v0)
    jal         func_80032E00
    addu        $a1, $s0, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v1, -0x4F84($at)
    addu        $a0, $s3, $zero
    addu        $a1, $s1, $zero
    addu        $a2, $s0, $zero
    addu        $v1, $s4, $v1
    jal         func_8003663C
    sw          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v0, -0x4F84($at)
    addu        $v0, $s4, $v0
    lw          $v0, 0x0($v0)
.L80035ECC:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_pool_prepare

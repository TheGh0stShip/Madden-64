.text
.align 2
.set noreorder
.globl memory_pool_finalize_secondary
.ent memory_pool_finalize_secondary
memory_pool_finalize_secondary:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    andi        $a0, $a0, 0x4000
    sw          $ra, 0x1C($sp)
    bnez        $a0, .L80036A74
    sw          $s2, 0x18($sp)
    andi        $v1, $s0, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s1
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x41
    sb          $v0, 0x0($v1)
.L80036A74:
    lui         $a0, 0x8007
    lw          $a0, 0x24E0($a0)
    lui         $s2, 0x8007
    lw          $s2, 0x1304($s2)
    jal         func_80033298
    nop
    lui         $v1, 0x8007
    lw          $v1, 0x1304($v1)
    beqz        $v1, .L80036AB8
    addu        $a1, $v0, $zero
    sw          $zero, 0x0($a1)
    sw          $v1, 0x4($a1)
    sw          $a1, 0x0($v1)
    lui         $at, 0x8007
    sw          $a1, 0x1304($at)
    j .L80036AD0
    nop
.L80036AB8:
    lui         $at, 0x8007
    sw          $a1, 0x1304($at)
    lui         $at, 0x8007
    sw          $a1, 0x1308($at)
    sw          $zero, 0x0($a1)
    sw          $zero, 0x4($a1)
.L80036AD0:
    lui         $v0, 0x8007
    lw          $v0, 0x24E4($v0)
    lui         $a0, 0x8007
    lw          $a0, 0x24E8($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x503C($v1)
    sh          $s0, 0xC($a1)
    sw          $s1, 0x8($a1)
    lui         $at, 0x8007
    sw          $zero, 0x24E4($at)
    lui         $at, 0x8007
    sw          $zero, 0x24E8($at)
    sw          $v0, 0x10($a1)
    lui         $v0, 0x400
    or          $v1, $v1, $v0
    sw          $a0, 0x14($a1)
    lui         $at, 0x8008
    sw          $v1, 0x503C($at)
    bnez        $s2, .L80036B5C
    nop
    lui         $v0, 0x8007
    lbu         $v0, 0x12F8($v0)
    beqz        $v0, .L80036B44
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x7F90($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80036B54
    addiu       $v0, $zero, 0x1
.L80036B44:
    jal         func_80036B94
    nop
    j .L80036B5C
    nop
.L80036B54:
    lui         $at, 0x8009
    sw          $v0, -0x6A20($at)
.L80036B5C:
    lui         $v0, 0x8008
    lw          $v0, 0x503C($v0)
    lui         $v1, 0xFBFF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0x503C($at)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end memory_pool_finalize_secondary

.text
.align 2
.set noreorder
.globl memory_pool_initialize
.ent memory_pool_initialize
memory_pool_initialize:
    addiu       $sp, $sp, -0x20
    sll         $v0, $a0, 16
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5C00
    sra         $v0, $v0, 14
    addu        $v1, $v0, $v1
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x0($v1)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, -0x5C0C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $s0, -0x5BF0($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $s0, -0x5BF4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $s0, -0x5BEC($at)
    sw          $a1, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, -0x5C08($at)
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x8($s0)
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x18($s0)
    sw          $v0, 0x14($s0)
    sw          $v0, 0x10($s0)
    sw          $v0, 0xC($s0)
    sw          $a1, 0x4($s0)
    lw          $s1, 0x0($v1)
    j .L80032D68
    addu        $s2, $a0, $zero
.L80032D60:
    jal         func_80033534
    addu        $a0, $s0, $zero
.L80032D68:
    addiu       $s0, $s0, 0x1C
    sltu        $v0, $s0, $s1
    bnez        $v0, .L80032D60
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, -0x5BFC($at)
    ori         $v1, $zero, 0xFFFF
    sll         $v0, $v0, 1
    sh          $v1, 0x0($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $a1, -0x5C10($at)
    addiu       $v0, $zero, 0x1
    sltu        $v0, $v0, $a1
    beqz        $v0, .L80032DD0
    addiu       $v1, $zero, 0x1
    addiu       $a0, $a0, 0x2
.L80032DB8:
    sh          $v1, 0x0($a0)
    addiu       $v1, $v1, 0x1
    andi        $v0, $v1, 0xFFFF
    sltu        $v0, $v0, $a1
    bnel        $v0, $zero, .L80032DB8
    addiu       $a0, $a0, 0x2
.L80032DD0:
    sll         $v0, $s2, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, -0x5BF8($at)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end memory_pool_initialize

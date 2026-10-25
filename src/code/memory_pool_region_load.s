.text
.align 2
.set noreorder
.globl memory_pool_region_load
.ent memory_pool_region_load
memory_pool_region_load:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sll         $v0, $a0, 16
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $v1, 0x8($s2)
    sra         $s1, $v0, 16
    sll         $v0, $s1, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, -0x5C10($at)
    lhu         $v1, 0xA($s2)
    addu        $s4, $a0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, -0x5C04($at)
    lw          $a1, 0x0($s2)
    addiu       $a3, $v1, -0x1
    lhu         $v1, 0x8($s2)
    nor         $a2, $zero, $a3
    addu        $a1, $a1, $a3
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a3, $v0, $zero
    and         $a1, $a1, $a2
    sll         $a0, $v1, 1
    addu        $s3, $a0, $zero
    bnez        $s1, .L80032C44
    sw          $a1, 0x0($s2)
    addu        $v1, $a1, $v0
    addu        $v1, $v1, $a0
    lui         $at, 0x8008
    sw          $v1, -0x5C0C($at)
    lw          $v0, 0x4($s2)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, -0x5C08($at)
    lw          $v0, 0x0($s2)
    addu        $v0, $v0, $a0
    lui         $at, 0x8008
    sw          $v0, -0x5C00($at)
    lw          $v0, 0x0($s2)
    lui         $at, 0x8008
    sw          $v0, -0x5BFC($at)
    j .L80032C9C
    sll         $a0, $s4, 16
.L80032C44:
    addu        $a0, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5C0C
    sll         $s1, $s1, 2
    addu        $s0, $s1, $s0
    sw          $a1, 0x0($s0)
    jal         func_80032E00
    addu        $a1, $a3, $s3
    lw          $a0, 0x4($s2)
    lw          $a1, 0x0($s0)
    addu        $v1, $v0, $s3
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $v1, -0x5C00($at)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $v0, -0x5BFC($at)
    subu        $a0, $a0, $a1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $a0, -0x5C08($at)
    sll         $a0, $s4, 16
.L80032C9C:
    jal         func_80032CC8
    sra         $a0, $a0, 16
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_pool_region_load

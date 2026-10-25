.text
.align 2
.set noreorder
.globl memory_pool_resize
.ent memory_pool_resize
memory_pool_resize:
    addiu       $sp, $sp, -0x28
    sll         $v0, $a0, 16
    sra         $v0, $v0, 14
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $s1, -0x5BEC($at)
    addiu       $v0, $zero, -0x1
    beq         $s1, $v0, .L80032F94
    addu        $s3, $a0, $zero
    addiu       $v1, $zero, -0x1
.L80032F78:
    lw          $v0, 0x0($s1)
    sltu        $v0, $v0, $a1
    beqz        $v0, .L80032F94
    nop
    lw          $s1, 0xC($s1)
    bne         $s1, $v1, .L80032F78
    nop
.L80032F94:
    lw          $s2, 0x10($s1)
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x8($s1)
    addiu       $v0, $zero, -0x1
    beq         $s2, $v0, .L80032FE0
    nop
    lhu         $v0, 0x8($s2)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80032FE0
    addu        $a0, $s2, $zero
    sll         $s0, $s3, 16
    sra         $s0, $s0, 16
    jal         func_80033768
    addu        $a1, $s0, $zero
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_800334E0
    addu        $a2, $s0, $zero
    addu        $s1, $s2, $zero
.L80032FE0:
    lw          $s2, 0xC($s1)
    addiu       $v0, $zero, -0x1
    beq         $s2, $v0, .L80033024
    addu        $a0, $s1, $zero
    lhu         $v0, 0x8($s2)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80033020
    addu        $a0, $s2, $zero
    sll         $s0, $s3, 16
    sra         $s0, $s0, 16
    jal         func_80033768
    addu        $a1, $s0, $zero
    addu        $a0, $s1, $zero
    addu        $a1, $s2, $zero
    jal         func_800334E0
    addu        $a2, $s0, $zero
.L80033020:
    addu        $a0, $s1, $zero
.L80033024:
    sll         $a1, $s3, 16
    jal         func_8003368C
    sra         $a1, $a1, 16
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_pool_resize

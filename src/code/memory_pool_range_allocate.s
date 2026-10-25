.text
.align 2
.set noreorder
.globl memory_pool_range_allocate
.ent memory_pool_range_allocate
memory_pool_range_allocate:
    addiu       $sp, $sp, -0x30
    sll         $a2, $a0, 16
    sra         $a0, $a2, 16
    sll         $v0, $a0, 1
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v1, -0x5C04($at)
    sll         $v0, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $s0, -0x5BF4($at)
    addiu       $a1, $a1, -0x1
    addiu       $v0, $zero, -0x1
    addu        $s1, $a1, $v1
    negu        $v1, $v1
    beq         $s0, $v0, .L80032F10
    and         $s1, $s1, $v1
    addu        $s4, $a2, $zero
    addu        $s2, $a0, $zero
    addiu       $s3, $zero, -0x1
    ori         $s5, $zero, 0xFFFE
.L80032E70:
    lhu         $v0, 0x8($s0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80032F04
    nop
    lw          $v1, 0x4($s0)
    sltu        $v0, $v1, $s1
    bnez        $v0, .L80032F04
    sltu        $v0, $s1, $v1
    beqz        $v0, .L80032EF0
    addu        $a0, $s0, $zero
    jal         func_80033558
    addu        $a0, $s2, $zero
    lw          $v1, 0x0($s0)
    addu        $a0, $v0, $zero
    addu        $v1, $v1, $s1
    sw          $v1, 0x0($a0)
    lw          $v0, 0x4($s0)
    subu        $v0, $v0, $s1
    sw          $v0, 0x4($a0)
    lhu         $v0, 0x8($s0)
    sh          $v0, 0x8($a0)
    lw          $v0, 0xC($s0)
    sw          $s0, 0x10($a0)
    sw          $v0, 0xC($a0)
    sw          $s1, 0x4($s0)
    sw          $a0, 0xC($s0)
    lw          $v0, 0xC($a0)
    bnel        $v0, $s3, .L80032EE4
    sw          $a0, 0x10($v0)
.L80032EE4:
    jal         func_8003368C
    addu        $a1, $s2, $zero
    addu        $a0, $s0, $zero
.L80032EF0:
    jal         func_80033768
    sra         $a1, $s4, 16
    lw          $v0, 0x0($s0)
    j .L80032F14
    sh          $s5, 0x8($s0)
.L80032F04:
    lw          $s0, 0x14($s0)
    bne         $s0, $s3, .L80032E70
    nop
.L80032F10:
    addu        $v0, $zero, $zero
.L80032F14:
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
.end memory_pool_range_allocate

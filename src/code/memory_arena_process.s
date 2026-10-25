.text
.align 2
.set noreorder
.globl memory_arena_process
.ent memory_arena_process
memory_arena_process:
    addiu       $sp, $sp, -0x30
    sll         $v1, $a0, 16
    sra         $a0, $v1, 16
    sll         $v0, $a0, 1
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, -0x5C04($at)
    sll         $a3, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $s0, -0x5BF4($at)
    addiu       $a1, $a1, -0x1
    addu        $s2, $a1, $v0
    negu        $v0, $v0
    and         $s2, $s2, $v0
    addiu       $v0, $zero, -0x1
    beq         $s0, $v0, .L80033984
    addu        $v0, $zero, $zero
    addiu       $a1, $a2, -0x1
    addu        $s6, $v1, $zero
    addu        $s3, $a0, $zero
    addiu       $s4, $zero, -0x1
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5BEC
    addu        $s5, $a3, $v0
.L80033850:
    lhu         $v0, 0x8($s0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80033978
    nop
    lw          $v1, 0x4($s0)
    sltu        $v0, $v1, $s2
    bnez        $v0, .L80033978
    nop
    lw          $v0, 0x0($s0)
    and         $s1, $v0, $a1
    beqz        $s1, .L800338F8
    subu        $s1, $a2, $s1
    subu        $v0, $v1, $s1
    sltu        $v0, $v0, $s2
    bnez        $v0, .L80033978
    nop
    jal         func_80033558
    addu        $a0, $s3, $zero
    lw          $v1, 0x0($s0)
    addu        $a0, $v0, $zero
    sw          $s1, 0x4($a0)
    sw          $v1, 0x0($a0)
    lhu         $v0, 0x8($s0)
    sh          $v0, 0x8($a0)
    lw          $v0, 0x10($s0)
    sw          $s0, 0xC($a0)
    sw          $v0, 0x10($a0)
    lw          $v0, 0x4($s0)
    lw          $v1, 0x0($s0)
    sw          $a0, 0x10($s0)
    subu        $v0, $v0, $s1
    addu        $v1, $v1, $s1
    sw          $v0, 0x4($s0)
    sw          $v1, 0x0($s0)
    lw          $v0, 0x10($a0)
    beql        $v0, $s4, .L800338E4
    sw          $a0, 0x0($s5)
.L800338E4:
    lw          $v0, 0x10($a0)
    bnel        $v0, $s4, .L800338F0
    sw          $a0, 0xC($v0)
.L800338F0:
    jal         func_8003368C
    addu        $a1, $s3, $zero
.L800338F8:
    lw          $v0, 0x4($s0)
    sltu        $v0, $s2, $v0
    beqz        $v0, .L80033960
    addu        $a0, $s0, $zero
    jal         func_80033558
    addu        $a0, $s3, $zero
    lw          $v1, 0x0($s0)
    addu        $a0, $v0, $zero
    addu        $v1, $v1, $s2
    sw          $v1, 0x0($a0)
    lw          $v0, 0x4($s0)
    subu        $v0, $v0, $s2
    sw          $v0, 0x4($a0)
    lhu         $v0, 0x8($s0)
    sh          $v0, 0x8($a0)
    lw          $v0, 0xC($s0)
    sw          $s0, 0x10($a0)
    sw          $v0, 0xC($a0)
    sw          $s2, 0x4($s0)
    sw          $a0, 0xC($s0)
    lw          $v0, 0xC($a0)
    bnel        $v0, $s4, .L80033954
    sw          $a0, 0x10($v0)
.L80033954:
    jal         func_8003368C
    addu        $a1, $s3, $zero
    addu        $a0, $s0, $zero
.L80033960:
    jal         func_80033768
    sra         $a1, $s6, 16
    lw          $v0, 0x0($s0)
    ori         $v1, $zero, 0xFFFE
    j .L80033984
    sh          $v1, 0x8($s0)
.L80033978:
    lw          $s0, 0x14($s0)
    bne         $s0, $s4, .L80033850
    addu        $v0, $zero, $zero
.L80033984:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end memory_arena_process

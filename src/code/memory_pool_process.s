.text
.align 2
.set noreorder
.globl memory_pool_process
.ent memory_pool_process
memory_pool_process:
    addiu       $sp, $sp, -0x28
    addu        $a3, $a1, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    lui         $t1, 0x7FFF
    ori         $t1, $t1, 0xFFFF
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    andi        $v0, $s4, 0xFFFF
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    sw          $ra, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $a0, -0x4F7C($at)
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $a1, -0x4F88($at)
    sll         $v0, $a3, 1
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    lw          $t0, 0x8($v0)
    lw          $a1, 0x0($v0)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x4F84($at)
    sll         $a3, $a3, 2
    addu        $a3, $a3, $v0
    lw          $s2, 0x0($a3)
    jal         func_80036628
    and         $s1, $t0, $t1
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x1000
    jal         func_800337CC
    addiu       $a2, $zero, 0x10
    beqz        $s1, .L80036970
    addu        $s3, $v0, $zero
    sltiu       $v0, $s1, 0x1001
.L80036814:
    bnez        $v0, .L80036828
    addu        $a2, $s1, $zero
    addiu       $a2, $zero, 0x1000
    j .L8003682C
    addiu       $s1, $s1, -0x1000
.L80036828:
    addu        $s1, $zero, $zero
.L8003682C:
    andi        $v1, $s4, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x4F7C($at)
    jal         func_800365B8
    addu        $a1, $s3, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x617C($v1)
    sltiu       $v0, $s0, 0x1
    negu        $v0, $v0
    andi        $t0, $v0, 0x5
    addu        $v0, $s3, $t0
    addiu       $v1, $v1, 0x1000
    lui         $at, 0x8008
    sw          $v1, 0x617C($at)
    lbu         $a0, 0x0($v0)
    beqz        $a0, .L80036968
    nop
    addiu       $t2, $zero, 0x80
    addu        $t1, $zero, $zero
    addu        $a3, $v0, $zero
    sltiu       $v0, $t0, 0x1000
.L80036890:
    beqz        $v0, .L80036968
    nop
    addiu       $a3, $a3, 0x1
    andi        $a2, $a0, 0x80
    beqz        $a2, .L800368FC
    addiu       $t0, $t0, 0x1
    bne         $a2, $t2, .L8003695C
    nop
    andi        $a2, $a0, 0x7F
    sltu        $v0, $t1, $a2
    beqz        $v0, .L8003695C
    addu        $a1, $zero, $zero
    addu        $a0, $s0, $s2
    addu        $v1, $t0, $s3
.L800368C8:
    lbu         $v0, 0x0($v1)
    addiu       $v1, $v1, 0x1
    addiu       $a3, $a3, 0x1
    addiu       $t0, $t0, 0x1
    addiu       $s0, $s0, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($a0)
    andi        $v0, $a1, 0xFF
    sltu        $v0, $v0, $a2
    bnez        $v0, .L800368C8
    addiu       $a0, $a0, 0x1
    j .L8003695C
    nop
.L800368FC:
    lbu         $v1, 0x0($a3)
    lbu         $v0, 0x1($a3)
    addiu       $a3, $a3, 0x2
    addiu       $t0, $t0, 0x2
    addu        $a1, $zero, $zero
    andi        $a0, $a0, 0xFF
    sll         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sltu        $v0, $a2, $a0
    beqz        $v0, .L8003695C
    subu        $v1, $s0, $v1
    addu        $a2, $a0, $zero
    addu        $a0, $s0, $s2
.L80036930:
    andi        $v0, $a1, 0xFF
    addu        $v0, $v1, $v0
    addu        $v0, $s2, $v0
    lbu         $v0, 0x0($v0)
    addiu       $s0, $s0, 0x1
    addiu       $a1, $a1, 0x1
    sb          $v0, 0x0($a0)
    andi        $v0, $a1, 0xFF
    sltu        $v0, $v0, $a2
    bnez        $v0, .L80036930
    addiu       $a0, $a0, 0x1
.L8003695C:
    lbu         $a0, 0x0($a3)
    bnez        $a0, .L80036890
    sltiu       $v0, $t0, 0x1000
.L80036968:
    bnez        $s1, .L80036814
    sltiu       $v0, $s1, 0x1001
.L80036970:
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addu        $a1, $s3, $zero
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_pool_process

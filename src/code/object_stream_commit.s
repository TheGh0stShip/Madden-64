.text
.align 2
.set noreorder
.globl object_stream_commit
.ent object_stream_commit
object_stream_commit:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x4($s1)
    addu        $s3, $s4, $a3
    lw          $s5, 0x40($sp)
    sltu        $v0, $v0, $s3
    bnez        $v0, .L80064444
    addu        $s2, $a0, $zero
    lw          $v0, 0xC($s1)
    sltu        $v0, $v0, $a3
    bnez        $v0, .L80064444
    nop
    lw          $v0, 0x0($s1)
    bnez        $v0, .L80064460
    nop
.L80064444:
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x14
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80064460:
    lw          $v1, 0x18($s1)
    sltu        $v0, $s4, $v1
    bnez        $v0, .L80064484
    nop
    lw          $v0, 0x10($s1)
    addu        $v0, $v1, $v0
    sltu        $v0, $v0, $s3
    beqz        $v0, .L80064504
    nop
.L80064484:
    lw          $v0, 0x28($s1)
    bnez        $v0, .L800644A8
    addiu       $v0, $zero, 0x44
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L800644A8:
    lw          $v0, 0x24($s1)
    beqz        $v0, .L800644C4
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_80064090
    addiu       $a2, $zero, 0x1
    sw          $zero, 0x24($s1)
.L800644C4:
    lw          $v0, 0x18($s1)
    sltu        $v0, $v0, $s4
    beqz        $v0, .L800644DC
    nop
    j .L800644F4
    sw          $s4, 0x18($s1)
.L800644DC:
    lw          $v1, 0x10($s1)
    subu        $v1, $s3, $v1
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    sw          $v1, 0x18($s1)
.L800644F4:
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_80064090
    addu        $a2, $zero, $zero
.L80064504:
    lw          $v1, 0x1C($s1)
    sltu        $v0, $v1, $s3
    beqz        $v0, .L800645C4
    sltu        $v0, $v1, $s4
    beqz        $v0, .L80064540
    addu        $s0, $v1, $zero
    beqz        $s5, .L8006453C
    addiu       $v0, $zero, 0x14
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L8006453C:
    addu        $s0, $s4, $zero
.L80064540:
    bnel        $s5, $zero, .L80064548
    sw          $s3, 0x1C($s1)
.L80064548:
    lw          $v0, 0x20($s1)
    beqz        $v0, .L800645A0
    nop
    lw          $v0, 0x18($s1)
    lw          $v1, 0x8($s1)
    subu        $s0, $s0, $v0
    subu        $s3, $s3, $v0
    sltu        $v0, $s0, $s3
    beqz        $v0, .L800645C4
    sll         $s2, $v1, 7
.L80064570:
    lw          $v0, 0x0($s1)
    sll         $v1, $s0, 2
    addu        $v1, $v1, $v0
    lw          $a0, 0x0($v1)
    addu        $a1, $s2, $zero
    jal         func_800632F4
    addiu       $s0, $s0, 0x1
    sltu        $v0, $s0, $s3
    beqz        $v0, .L800645C4
    nop
    j .L80064570
    nop
.L800645A0:
    bnez        $s5, .L800645CC
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x14
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L800645C4:
    beqz        $s5, .L800645D0
    addiu       $v0, $zero, 0x1
.L800645CC:
    sw          $v0, 0x24($s1)
.L800645D0:
    lw          $v0, 0x18($s1)
    lw          $v1, 0x0($s1)
    subu        $v0, $s4, $v0
    sll         $v0, $v0, 2
    addu        $v0, $v1, $v0
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
.end object_stream_commit

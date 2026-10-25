.text
.align 2
.set noreorder
.globl object_lookup_finalize
.ent object_lookup_finalize
object_lookup_finalize:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    addu        $s5, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a3, $zero
    slt         $v0, $s1, $s4
    sw          $ra, 0x28($sp)
    sw          $s2, 0x18($sp)
    beqz        $v0, .L8006179C
    sw          $s0, 0x10($sp)
    sll         $v0, $s1, 5
    addu        $s0, $v0, $s3
.L80061634:
    sll         $v0, $s1, 1
    slt         $v0, $s4, $v0
    bnez        $v0, .L80061654
    addu        $a0, $s3, $zero
    jal         func_800610CC
    addu        $a1, $s1, $zero
    j .L80061660
    addu        $a1, $v0, $zero
.L80061654:
    jal         func_80061120
    addu        $a1, $s1, $zero
    addu        $a1, $v0, $zero
.L80061660:
    beqz        $a1, .L8006179C
    addiu       $a2, $zero, 0x1
    lw          $v0, 0x4($a1)
    sw          $v0, 0x4($s0)
    lw          $v0, 0xC($a1)
    sw          $v0, 0xC($s0)
    lw          $v0, 0x14($a1)
    sw          $v0, 0x14($s0)
    lw          $v0, 0x0($a1)
    sw          $v0, 0x0($s0)
    lw          $v0, 0x8($a1)
    sw          $v0, 0x8($s0)
    lw          $v0, 0x10($a1)
    sw          $v0, 0x10($s0)
    lw          $t5, 0xC($a1)
    lw          $t4, 0x8($a1)
    lw          $t3, 0x4($a1)
    lw          $t1, 0x0($a1)
    lw          $t2, 0x14($a1)
    lw          $t0, 0x10($a1)
    subu        $v0, $t5, $t4
    sll         $v1, $v0, 2
    sll         $v0, $v0, 3
    addu        $a0, $v0, $v1
    subu        $v0, $t3, $t1
    sll         $v1, $v0, 4
    subu        $v0, $t2, $t0
    sll         $a3, $v0, 3
    slt         $v0, $a0, $v1
    beqz        $v0, .L800616E4
    addu        $s2, $s0, $zero
    addu        $a0, $v1, $zero
    addu        $a2, $zero, $zero
.L800616E4:
    slt         $v0, $a0, $a3
    bnel        $v0, $zero, .L800616F0
    addiu       $a2, $zero, 0x2
.L800616F0:
    addiu       $v0, $zero, 0x1
    beq         $a2, $v0, .L80061740
    slti        $v0, $a2, 0x2
    beql        $v0, $zero, .L80061714
    addiu       $v0, $zero, 0x2
    beqz        $a2, .L80061724
    addu        $v0, $t3, $t1
    j .L80061778
    nop
.L80061714:
    beq         $a2, $v0, .L80061760
    addu        $v0, $t2, $t0
    j .L80061778
    nop
.L80061724:
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    sw          $v0, 0x4($a1)
    addiu       $v0, $v0, 0x1
    j .L80061778
    sw          $v0, 0x0($s0)
.L80061740:
    addu        $v0, $t5, $t4
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    sw          $v0, 0xC($a1)
    addiu       $v0, $v0, 0x1
    j .L80061778
    sw          $v0, 0x8($s0)
.L80061760:
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    sw          $v0, 0x14($a1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x10($s0)
.L80061778:
    jal         func_80061168
    addu        $a0, $s5, $zero
    addu        $a0, $s5, $zero
    jal         func_80061168
    addu        $a1, $s2, $zero
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $s4
    bnez        $v0, .L80061634
    addiu       $s0, $s0, 0x20
.L8006179C:
    addu        $v0, $s1, $zero
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
.end object_lookup_finalize

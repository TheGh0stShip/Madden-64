.text
.align 2
.set noreorder
.globl object_stream_complete
.ent object_stream_complete
object_stream_complete:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a1, $zero
    sw          $ra, 0x24($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x4($s3)
    sltiu       $v0, $s4, 0x2
    bnez        $v0, .L80064668
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
    addiu       $v0, $zero, 0x1
.L80064668:
    bnel        $s4, $v0, .L800646E0
    sll         $v0, $s4, 2
    lw          $s0, 0x40($s2)
    beqz        $s0, .L800646A4
    nop
.L8006467C:
    lw          $v0, 0x28($s0)
    beqz        $v0, .L80064698
    addu        $a0, $s3, $zero
    lw          $v0, 0x38($s0)
    addiu       $a1, $s0, 0x30
    jalr        $v0
    sw          $zero, 0x28($s0)
.L80064698:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L8006467C
    nop
.L800646A4:
    lw          $s0, 0x44($s2)
    beqz        $s0, .L800646D8
    sw          $zero, 0x40($s2)
.L800646B0:
    lw          $v0, 0x28($s0)
    beqz        $v0, .L800646CC
    addu        $a0, $s3, $zero
    lw          $v0, 0x38($s0)
    addiu       $a1, $s0, 0x30
    jalr        $v0
    sw          $zero, 0x28($s0)
.L800646CC:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L800646B0
    nop
.L800646D8:
    sw          $zero, 0x44($s2)
    sll         $v0, $s4, 2
.L800646E0:
    addu        $v0, $v0, $s2
    lw          $a1, 0x38($v0)
    beqz        $a1, .L80064724
    sw          $zero, 0x38($v0)
.L800646F0:
    lw          $v0, 0x4($a1)
    lw          $v1, 0x8($a1)
    addu        $a0, $s3, $zero
    lw          $s0, 0x0($a1)
    addu        $v0, $v0, $v1
    addiu       $s1, $v0, 0x10
    jal         func_80064990
    addu        $a2, $s1, $zero
    lw          $v0, 0x48($s2)
    addu        $a1, $s0, $zero
    subu        $v0, $v0, $s1
    bnez        $a1, .L800646F0
    sw          $v0, 0x48($s2)
.L80064724:
    sll         $v0, $s4, 2
    addu        $v0, $v0, $s2
    lw          $a1, 0x30($v0)
    beqz        $a1, .L8006476C
    sw          $zero, 0x30($v0)
.L80064738:
    lw          $v0, 0x4($a1)
    lw          $v1, 0x8($a1)
    addu        $a0, $s3, $zero
    lw          $s0, 0x0($a1)
    addu        $v0, $v0, $v1
    addiu       $s1, $v0, 0x10
    jal         func_80064950
    addu        $a2, $s1, $zero
    lw          $v0, 0x48($s2)
    addu        $a1, $s0, $zero
    subu        $v0, $v0, $s1
    bnez        $a1, .L80064738
    sw          $v0, 0x48($s2)
.L8006476C:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_stream_complete

.text
.align 2
.set noreorder
.globl resource_archive_finalize
.ent resource_archive_finalize
resource_archive_finalize:
    addiu       $sp, $sp, -0x40
    sw          $s2, 0x30($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x2C($sp)
    addu        $s1, $a1, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s0, 0x28($sp)
    lw          $s3, 0x8($s2)
    addiu       $a2, $zero, 0x48
    addu        $a3, $zero, $zero
    jal         func_80033308
    addu        $a1, $s3, $zero
    addiu       $a0, $zero, 0x1
    sw          $a0, 0x14($s2)
    sw          $zero, 0x18($s2)
    sw          $zero, 0x24($s2)
    sw          $zero, 0x20($s2)
    sw          $zero, 0x1C($s2)
    sw          $zero, 0x34($s2)
    sw          $zero, 0x30($s2)
    sw          $zero, 0x2C($s2)
    lw          $v0, 0xC($s1)
    sw          $v0, 0x30($s3)
    lw          $v0, 0xC($s1)
    andi        $v0, $v0, 0x20
    beqz        $v0, .L80017DB8
    addiu       $a2, $zero, 0x48
    lw          $v0, 0x14($s1)
    lw          $s0, 0x8($v0)
    addu        $a0, $s3, $zero
    jal         func_8002E17C
    addu        $a1, $s0, $zero
    addiu       $v0, $zero, -0x1
    sw          $s3, 0x34($s0)
    sw          $v0, 0x34($s3)
    lw          $v0, 0xC($s1)
    sw          $v0, 0x30($s3)
    lh          $a1, 0x6($s1)
    lh          $a2, 0x8($s1)
    jal         func_80017000
    addu        $a0, $s2, $zero
    lw          $v0, 0xC($s1)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L80017E8C
    nop
    lw          $v0, 0x18($s1)
    lw          $v0, 0x8($v0)
    j .L80017E8C
    sw          $v0, 0x8($s3)
.L80017DB8:
    sw          $zero, 0x34($s3)
    lw          $v1, 0xC($s1)
    andi        $v0, $v1, 0x4
    beqz        $v0, .L80017DFC
    andi        $v0, $v1, 0x100
    lh          $a1, 0x4($s1)
    lh          $a2, 0x6($s1)
    lh          $a3, 0x8($s1)
    sw          $a1, 0x10($sp)
    lh          $v0, 0x20($s1)
    sw          $v0, 0x14($sp)
    lw          $v0, 0x1C($s1)
    addu        $a0, $s3, $zero
    jal         func_80017504
    sw          $v0, 0x18($sp)
    j .L80017E8C
    nop
.L80017DFC:
    beqz        $v0, .L80017E48
    nop
    sw          $a0, 0x2C($s2)
    sw          $a0, 0x30($s2)
    lh          $v0, 0x8($s1)
    lh          $a2, 0x4($s1)
    lh          $a3, 0x6($s1)
    sw          $v0, 0x10($sp)
    lh          $v0, 0xE($s1)
    sw          $v0, 0x14($sp)
    lw          $v0, 0x18($s1)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x24($s1)
    sw          $v0, 0x1C($sp)
    lw          $a1, 0x0($s1)
    jal         func_80017880
    addu        $a0, $s3, $zero
    j .L80017E8C
    nop
.L80017E48:
    lhu         $v0, 0x8($s1)
    lh          $a2, 0x4($s1)
    lhu         $a3, 0x6($s1)
    sw          $v0, 0x10($sp)
    lh          $v0, 0x4($s1)
    sw          $v0, 0x14($sp)
    lh          $v0, 0xE($s1)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x18($s1)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x24($s1)
    sw          $v0, 0x20($sp)
    lw          $v0, 0x1C($s1)
    sw          $v0, 0x24($sp)
    lw          $a1, 0x0($s1)
    jal         func_80017030
    addu        $a0, $s3, $zero
.L80017E8C:
    lw          $ra, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end resource_archive_finalize

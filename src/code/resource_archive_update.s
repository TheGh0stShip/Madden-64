.text
.align 2
.set noreorder
.globl resource_archive_update
.ent resource_archive_update
resource_archive_update:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    addu        $t1, $a0, $zero
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, -0x1
    addu        $a2, $zero, $zero
    sw          $ra, 0x20($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    sll         $v0, $a2, 16
.L80016C78:
    sra         $v0, $v0, 16
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $v0, -0x7488($at)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L80016CB0
    addiu       $v0, $a2, 0x1
    j .L80016CC8
    addu        $s2, $a2, $zero
.L80016CB0:
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80016C78
    sll         $v0, $a2, 16
.L80016CC8:
    sll         $a1, $s2, 16
    sra         $a1, $a1, 16
    sll         $a0, $a1, 3
    subu        $a0, $a0, $a1
    sll         $a0, $a0, 2
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $v0, -0x7486($at)
    subu        $a0, $a0, $a1
    sll         $a0, $a0, 3
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v0, -0x7486($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $v0, -0x7484($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v0, -0x7484($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $v0, -0x7482($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v0, -0x7482($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $v0, -0x7480($at)
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $v0, -0x7480($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lhu         $a1, -0x747E($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x747C
    addu        $t0, $a0, $v0
    addu        $a3, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $a1, -0x747E($at)
.L80016D8C:
    sll         $v1, $a2, 16
    sra         $v1, $v1, 15
    addu        $v0, $v1, $a3
    lhu         $a0, 0x0($v0)
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    addu        $v1, $v1, $t0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x60
    bnez        $v0, .L80016D8C
    sh          $a0, 0x0($v1)
    addu        $a0, $zero, $zero
    sll         $s2, $s2, 16
    sra         $s2, $s2, 16
    sll         $s1, $s2, 3
    subu        $s1, $s1, $s2
    sll         $s1, $s1, 2
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    sll         $s0, $v0, 3
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x73BC($at)
    subu        $s1, $s1, $s2
    sll         $s1, $s1, 3
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sw          $v0, -0x73BC($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x200
    addu        $a0, $v0, $zero
    addu        $a1, $s3, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sw          $a0, -0x73B8($at)
    jal         func_8002E17C
    addiu       $a2, $zero, 0x200
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lhu         $a0, -0x73B4($at)
    addu        $v0, $s2, $zero
    addiu       $v1, $zero, 0x3
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sh          $v1, -0x7488($at)
    lui         $at, 0x8009
    addu        $at, $at, $s1
    sh          $a0, -0x73B4($at)
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end resource_archive_update

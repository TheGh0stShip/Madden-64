.text
.align 2
.set noreorder
.globl memory_block_process
.ent memory_block_process
memory_block_process:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $s0, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x20($sp)
    sw          $s2, 0x18($sp)
    jal         func_80036540
    sw          $s1, 0x14($sp)
    andi        $v1, $s0, 0xC000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80035B48
    ori         $v0, $zero, 0x8000
    bne         $v1, $v0, .L80035B88
    andi        $v0, $s3, 0xFFFF
    andi        $s3, $s0, 0x7FFF
    sll         $v0, $s3, 1
    addu        $v0, $v0, $s3
    sll         $s0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F88($at)
    beqz        $v0, .L80035CB4
    andi        $v0, $s3, 0xFFFF
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F7C($at)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x4F80($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F80($at)
    addu        $v1, $v1, $v0
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0xEF
    sb          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lhu         $a0, -0x4F7A($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F80($at)
    jal         func_80035F88
    nop
    j .L80035C98
    addu        $a0, $zero, $zero
.L80035B48:
    andi        $s3, $s0, 0xBFFF
    sll         $v0, $s3, 1
    addu        $v0, $v0, $s3
    sll         $s0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F88($at)
    beqz        $v0, .L80035CB4
    andi        $v0, $s3, 0xFFFF
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    jal         func_80036620
    nop
    j .L80035C98
    addu        $a0, $zero, $zero
.L80035B88:
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $s1, $v1, 3
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lw          $v0, -0x4F88($at)
    beqz        $v0, .L80035CB4
    andi        $v0, $s3, 0xFFFF
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lw          $a0, -0x4F7C($at)
    jal         func_80036620
    nop
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lw          $s0, -0x4F78($at)
    addu        $v0, $s0, $zero
    beqz        $v0, .L80035C48
    addiu       $s0, $s0, -0x1
    addu        $s2, $s1, $zero
.L80035BD8:
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v0, -0x4F84($at)
    sll         $s1, $s0, 2
    addu        $v1, $s1, $v0
    lw          $a1, 0x0($v1)
    beqz        $a1, .L80035C40
    addu        $v0, $s0, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v0, -0x4F80($at)
    addu        $v0, $v0, $s0
    lbu         $v0, 0x0($v0)
    andi        $v0, $v0, 0x20
    beqz        $v0, .L80035C20
    nop
    j .L80035C3C
    sw          $zero, 0x0($v1)
.L80035C20:
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s2
    lw          $v0, -0x4F84($at)
    addu        $v0, $s1, $v0
    sw          $zero, 0x0($v0)
.L80035C3C:
    addu        $v0, $s0, $zero
.L80035C40:
    bnez        $v0, .L80035BD8
    addiu       $s0, $s0, -0x1
.L80035C48:
    andi        $v0, $s3, 0xFFFF
    sll         $s0, $v0, 1
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F88($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F84($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F80($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $a0, $zero, $zero
.L80035C98:
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x4F88
    addu        $a1, $s0, $a1
    addiu       $a2, $zero, 0x18
    jal         func_80033308
    addu        $a3, $zero, $zero
    andi        $v0, $s3, 0xFFFF
.L80035CB4:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_block_process

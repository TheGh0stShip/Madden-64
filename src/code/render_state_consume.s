.text
.align 2
.set noreorder
.globl render_state_consume
.ent render_state_consume
render_state_consume:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s4, 0x20($sp)
    addiu       $s4, $zero, -0x1
    sw          $s3, 0x1C($sp)
    addu        $s3, $zero, $zero
    sw          $ra, 0x24($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    sll         $v0, $s3, 16
.L80015D58:
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
    bnez        $v0, .L80015D90
    addiu       $v0, $s3, 0x1
    j .L80015DA8
    addu        $s4, $s3, $zero
.L80015D90:
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80015D58
    sll         $v0, $s3, 16
.L80015DA8:
    lui         $a0, 0x8008
    lhu         $a0, 0x616C($a0)
    jal         func_80035D7C
    andi        $a1, $s1, 0xFFFF
    addu        $s2, $v0, $zero
    sll         $v0, $s4, 16
    sra         $v0, $v0, 16
    sll         $s0, $v0, 3
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $s1, -0x73B4($at)
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $v0, -0x7486($at)
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $v0, -0x7484($at)
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $v0, -0x7482($at)
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $v0, -0x7480($at)
    lh          $a0, 0x0($s2)
    addu        $s3, $zero, $zero
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x747C
    addu        $s1, $s0, $v1
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sh          $v0, -0x747E($at)
.L80015E78:
    lh          $a0, 0x0($s2)
    jal         func_80016C24
    addiu       $s2, $s2, 0x2
    sll         $a0, $s3, 16
    addiu       $v1, $s3, 0x1
    addu        $s3, $v1, $zero
    sra         $a0, $a0, 15
    addu        $a0, $a0, $s1
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    slti        $v1, $v1, 0x60
    bnez        $v1, .L80015E78
    sh          $v0, 0x0($a0)
    addiu       $s1, $s2, 0x8
    lh          $a0, 0x0($s1)
    jal         func_80016C24
    addu        $s3, $zero, $zero
    lh          $a0, 0x2($s1)
    jal         func_80016C24
    addu        $s0, $v0, $zero
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    sll         $v0, $v0, 16
    or          $s0, $s0, $v0
    addu        $s1, $s1, $s0
    lh          $a0, 0x0($s1)
    jal         func_80016C24
    addiu       $s0, $s2, 0x14
    lh          $a0, 0x2($s1)
    jal         func_80016C24
    addiu       $s1, $s1, 0xC
    sll         $v1, $s4, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $s1, -0x73BC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $s0, -0x73B8($at)
.L80015F28:
    lh          $a0, 0x0($s0)
    jal         func_80016C24
    nop
    andi        $v1, $v0, 0x1F
    andi        $a1, $v0, 0x3E0
    andi        $v0, $v0, 0x7C00
    andi        $a0, $s3, 0xF
    sltu        $a0, $zero, $a0
    sll         $v1, $v1, 11
    sll         $a1, $a1, 1
    or          $v1, $v1, $a1
    srl         $v0, $v0, 9
    or          $v1, $v1, $v0
    or          $a0, $a0, $v1
    sh          $a0, 0x0($s0)
    addiu       $v0, $s3, 0x1
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x100
    bnez        $v0, .L80015F28
    addiu       $s0, $s0, 0x2
    sll         $v0, $s4, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addiu       $a0, $zero, 0x1
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sh          $a0, -0x7488($at)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end render_state_consume

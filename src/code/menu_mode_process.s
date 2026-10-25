.text
.align 2
.set noreorder
.globl menu_mode_process
.ent menu_mode_process
menu_mode_process:
    addiu       $sp, $sp, -0x58
    sw          $s6, 0x48($sp)
    addu        $s6, $a2, $zero
    sw          $s7, 0x4C($sp)
    addu        $s7, $zero, $zero
    sw          $s3, 0x3C($sp)
    addiu       $s3, $zero, -0x1
    sw          $s2, 0x38($sp)
    addu        $s2, $zero, $zero
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0xCFC
    sh          $a0, 0x1E($sp)
    sll         $a0, $a0, 16
    sw          $s5, 0x44($sp)
    sra         $s5, $a0, 16
    sw          $fp, 0x50($sp)
    sll         $fp, $s5, 1
    sw          $ra, 0x54($sp)
    sw          $s4, 0x40($sp)
    sw          $s1, 0x34($sp)
    sw          $s0, 0x30($sp)
    sw          $a1, 0x24($sp)
    sh          $zero, 0x0($s6)
    addu        $s0, $zero, $zero
.L80029234:
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $s1, $v0, 2
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0x1876
    addu        $s4, $s1, $t1
    sll         $v0, $s0, 16
.L80029270:
    sra         $a0, $v0, 16
    sll         $a1, $a0, 1
    addu        $v0, $s1, $t0
    addu        $v0, $a1, $v0
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L8002933C
    addiu       $v0, $s0, 0x1
    addiu       $v0, $zero, 0x31
    bne         $s5, $v0, .L8002930C
    addu        $v0, $a1, $a0
    sll         $v0, $v0, 4
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v0, $s1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a0, 0x187C($at)
    slti        $v0, $a0, 0xF
    bnel        $v0, $zero, .L80029324
    addu        $v1, $zero, $zero
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $v0, 0x1884($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a1, 0x187E($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a2, 0x1880($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a3, 0x1882($at)
    sw          $t0, 0x28($sp)
    jal         func_80027EF0
    sw          $v0, 0x10($sp)
    lw          $t0, 0x28($sp)
    j .L80029324
    addu        $v1, $v0, $zero
.L8002930C:
    sll         $v0, $v0, 4
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s4
    addu        $v0, $fp, $v0
    lh          $v1, 0x0($v0)
.L80029324:
    slt         $v0, $s3, $v1
    beqz        $v0, .L8002933C
    addiu       $v0, $s0, 0x1
    addu        $s3, $v1, $zero
    sh          $s0, 0x0($s6)
    addu        $s7, $s2, $zero
.L8002933C:
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L80029270
    sll         $v0, $s0, 16
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnel        $v0, $zero, .L80029234
    addu        $s0, $zero, $zero
    lhu         $t1, 0x1E($sp)
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x31
    beql        $v0, $v1, .L80029388
    sra         $s3, $s3, 16
.L80029388:
    lw          $t1, 0x24($sp)
    sll         $v0, $s7, 16
    sra         $v0, $v0, 16
    sh          $s3, 0x0($t1)
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end menu_mode_process

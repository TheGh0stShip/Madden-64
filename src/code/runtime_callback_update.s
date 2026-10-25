.text
.align 2
.set noreorder
.globl runtime_callback_update
.ent runtime_callback_update
runtime_callback_update:
    addiu       $sp, $sp, -0x40
    sw          $ra, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    jal         func_80032A80
    sw          $s0, 0x20($sp)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4D78
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x6A54
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addu        $a0, $s0, $zero
    jal         func_80032A4C
    addu        $a1, $zero, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L8003150C
    addu        $s2, $zero, $zero
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x49A0
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x6F60
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6DE4
.L80031420:
    lb          $v0, 0x0($s0)
    addiu       $s3, $zero, 0x1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $zero, 0x0($v0)
.L80031434:
    lb          $a2, 0x0($s0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4D78
    sll         $a1, $a2, 1
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 2
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 3
    jal         func_80048608
    addu        $a1, $a1, $s4
    lb          $v1, 0x0($s0)
    addu        $s1, $v0, $zero
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s4
    lb          $v0, 0x0($s0)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s4
    lb          $v0, 0x0($s0)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s4
    bnez        $s1, .L800314DC
    addu        $a0, $v0, $zero
    lb          $v0, 0x0($s0)
    addiu       $v1, $zero, 0x1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $v1, 0x0($v0)
.L800314DC:
    beqz        $a0, .L800314EC
    addu        $v0, $s3, $zero
    bnez        $v0, .L80031434
    addiu       $s3, $s3, -0x1
.L800314EC:
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L80031420
    addiu       $s0, $s0, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
.L8003150C:
    blez        $v0, .L80031598
    addu        $s2, $zero, $zero
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x49A0
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x6F60
    addiu       $s3, $zero, 0x1
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6DE4
.L80031530:
    lb          $v0, 0x0($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $zero, 0x0($v0)
    lb          $a2, 0x0($s0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4D78
    sll         $a1, $a2, 1
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 2
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 3
    jal         func_80048608
    addu        $a1, $a1, $s4
    bnez        $v0, .L80031580
    nop
    lb          $v0, 0x0($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $s3, 0x0($v0)
.L80031580:
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L80031530
    addiu       $s0, $s0, 0x1
.L80031598:
    jal         func_80032ABC
    nop
    lw          $ra, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end runtime_callback_update

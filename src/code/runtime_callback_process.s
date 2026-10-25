.text
.align 2
.set noreorder
.globl runtime_callback_process
.ent runtime_callback_process
runtime_callback_process:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    jal         func_80032A80
    sw          $s0, 0x10($sp)
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
    lui         $v1, 0x8008
    lh          $v1, 0x6DA8($v1)
    addu        $v0, $v1, $zero
    beqz        $v0, .L80031388
    addiu       $v1, $v1, -0x1
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x49A0
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x6F60
    addu        $s0, $v1, $zero
.L80031238:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $a1, 0x6DE4($at)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $s1
    lw          $v1, 0x0($v0)
    andi        $v0, $v1, 0x3
    beqz        $v0, .L80031310
    andi        $v0, $v1, 0x2
    beqz        $v0, .L80031310
    sll         $a0, $a1, 1
    addu        $a0, $a0, $a1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $a1
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s2
    beqz        $v0, .L800312EC
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $zero, 0x0($v0)
.L800312EC:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    lw          $v1, 0x0($v0)
    addiu       $a0, $zero, -0xF
    j .L80031378
    and         $v1, $v1, $a0
.L80031310:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $zero, 0x0($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $a2, 0x6DE4($at)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4D78
    sll         $a1, $a2, 1
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 2
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 3
    jal         func_80048608
    addu        $a1, $a1, $s2
    bnez        $v0, .L80031380
    addu        $v0, $s0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v0, 0x6DE4($at)
    addiu       $v1, $zero, 0x1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
.L80031378:
    sw          $v1, 0x0($v0)
    addu        $v0, $s0, $zero
.L80031380:
    bnez        $v0, .L80031238
    addiu       $s0, $s0, -0x1
.L80031388:
    jal         func_80032ABC
    nop
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end runtime_callback_process

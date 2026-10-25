.text
.align 2
.set noreorder
.globl runtime_state_update
.ent runtime_state_update
runtime_state_update:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
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
    sll         $v0, $s1, 16
    sra         $s2, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lb          $v1, 0x6DE4($at)
    sll         $v0, $v1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x49A0($at)
    addu        $s3, $s1, $zero
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x49A0
    andi        $v0, $a0, 0x3
    beqz        $v0, .L80031708
    andi        $v0, $a0, 0x2
    beqz        $v0, .L80031708
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 3
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6F60
    jal         func_800481B8
    addu        $a0, $a0, $s0
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lb          $v0, 0x6DE4($at)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s0
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lb          $v0, 0x6DE4($at)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    jal         func_800481B8
    addu        $a0, $a0, $s0
    beqz        $v0, .L800316E4
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $zero, 0x0($v0)
.L800316E4:
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    lw          $v1, 0x0($v0)
    addiu       $a0, $zero, -0xF
    j .L80031788
    and         $v1, $v1, $a0
.L80031708:
    sll         $v0, $s3, 16
    sra         $s1, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lb          $a2, 0x6DE4($at)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4D78
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lb          $v1, 0x6DE4($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x6F60
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x49A0
    sll         $a1, $a2, 1
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 2
    addu        $a1, $a1, $a2
    sll         $a1, $a1, 3
    sll         $v1, $v1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sw          $zero, -0x49A0($at)
    jal         func_80048608
    addu        $a1, $a1, $v0
    bnez        $v0, .L8003178C
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
.L80031788:
    sw          $v1, 0x0($v0)
.L8003178C:
    jal         func_80032ABC
    nop
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $v0, 0x6DE4($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x49A0($at)
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end runtime_state_update

.text
.align 2
.set noreorder
.globl object_state_process
.ent object_state_process
object_state_process:
    addiu       $sp, $sp, -0x30
    addu        $t8, $a0, $zero
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s0, 0x1A4($t8)
    lw          $v0, 0x20($t8)
    lw          $s1, 0x138($t8)
    lw          $v1, 0xD8($t8)
    blez        $v0, .L8005AE74
    addu        $t7, $zero, $zero
    addiu       $s3, $s1, 0x2
    addiu       $s2, $s1, -0x2
    addiu       $t6, $v1, 0x24
    addu        $t9, $s0, $zero
.L8005AD1C:
    lw          $v1, -0x18($t6)
    lw          $v0, 0x0($t6)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x138($t8)
    nop
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005AD44
    nop
    break       7
.L8005AD44:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005AD5C
    lui         $at, 0x8000
    bne         $v1, $at, .L8005AD5C
    nop
    break       6
.L8005AD5C:
    .word       0x00003812  # mflo        $a3
    nop
    nop
    .word       0x00F30018  # mult        $a3, $s3
    .word       0x00002812  # mflo        $a1
    lw          $a0, 0x3C($s0)
    lw          $v0, 0x38($s0)
    lw          $t0, 0x8($t9)
    sll         $v1, $t7, 2
    addu        $v0, $v1, $v0
    lw          $t4, 0x0($v0)
    addu        $v1, $v1, $a0
    lw          $t1, 0x0($v1)
    blez        $a1, .L8005ADCC
    addu        $a2, $zero, $zero
    addu        $t2, $a1, $zero
    addu        $a1, $t4, $zero
    addu        $a0, $t1, $zero
    addu        $v1, $t0, $zero
.L8005ADA8:
    lw          $v0, 0x0($v1)
    addiu       $v1, $v1, 0x4
    addiu       $a2, $a2, 0x1
    sw          $v0, 0x0($a0)
    sw          $v0, 0x0($a1)
    addiu       $a1, $a1, 0x4
    slt         $v0, $a2, $t2
    bnez        $v0, .L8005ADA8
    addiu       $a0, $a0, 0x4
.L8005ADCC:
    sll         $t2, $a3, 1
    blez        $t2, .L8005AE30
    addu        $a2, $zero, $zero
    .word       0x00F20018  # mult        $a3, $s2
    .word       0x00006812  # mflo        $t5
    nop
    nop
    .word       0x00F10018  # mult        $a3, $s1
    .word       0x00005812  # mflo        $t3
    addu        $v1, $t5, $a2
.L8005ADF4:
    addu        $a0, $t3, $a2
    sll         $a0, $a0, 2
    addu        $v0, $a0, $t0
    lw          $a1, 0x0($v0)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t1
    addu        $v1, $v1, $t0
    sw          $a1, 0x0($v0)
    lw          $v0, 0x0($v1)
    addiu       $a2, $a2, 0x1
    addu        $a0, $a0, $t1
    sw          $v0, 0x0($a0)
    slt         $v0, $a2, $t2
    bnez        $v0, .L8005ADF4
    addu        $v1, $t5, $a2
.L8005AE30:
    blez        $a3, .L8005AE5C
    addu        $a2, $zero, $zero
    subu        $v0, $a2, $a3
.L8005AE3C:
    addiu       $a2, $a2, 0x1
    lw          $v1, 0x0($t4)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t4
    sw          $v1, 0x0($v0)
    slt         $v0, $a2, $a3
    bnez        $v0, .L8005AE3C
    subu        $v0, $a2, $a3
.L8005AE5C:
    addiu       $t9, $t9, 0x4
    lw          $v0, 0x20($t8)
    addiu       $t7, $t7, 0x1
    slt         $v0, $t7, $v0
    bnez        $v0, .L8005AD1C
    addiu       $t6, $t6, 0x54
.L8005AE74:
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_state_process

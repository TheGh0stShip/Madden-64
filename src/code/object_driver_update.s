.text
.align 2
.set noreorder
.globl object_driver_update
.ent object_driver_update
object_driver_update:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $v1, 0x10($s1)
    addiu       $v0, $zero, 0xCA
    beq         $v1, $v0, .L800557CC
    addiu       $v0, $zero, 0x12
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x10($s1)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L800557CC:
    lw          $v1, 0x2C($s1)
    lw          $a0, 0x30($s1)
    sll         $v0, $v1, 3
    sltu        $v0, $a0, $v0
    bnez        $v0, .L80055810
    sll         $v0, $v1, 2
    lw          $a0, 0x18($s1)
    jal         func_800631D8
    addiu       $a1, $zero, 0x8
    lw          $a0, 0x1C($s1)
    addiu       $a1, $zero, 0x8
    jal         func_800631D8
    sw          $v0, 0x70($s1)
    sw          $v0, 0x74($s1)
    addiu       $v0, $zero, 0x1
    j .L80055894
    sw          $v0, 0x138($s1)
.L80055810:
    sltu        $v0, $a0, $v0
    bnez        $v0, .L80055848
    sll         $v0, $v1, 1
    lw          $a0, 0x18($s1)
    jal         func_800631D8
    addiu       $a1, $zero, 0x4
    lw          $a0, 0x1C($s1)
    addiu       $a1, $zero, 0x4
    jal         func_800631D8
    sw          $v0, 0x70($s1)
    sw          $v0, 0x74($s1)
    addiu       $v0, $zero, 0x2
    j .L80055894
    sw          $v0, 0x138($s1)
.L80055848:
    sltu        $v0, $a0, $v0
    bnez        $v0, .L80055880
    addiu       $v1, $zero, 0x8
    lw          $a0, 0x18($s1)
    jal         func_800631D8
    addiu       $a1, $zero, 0x2
    lw          $a0, 0x1C($s1)
    addiu       $a1, $zero, 0x2
    jal         func_800631D8
    sw          $v0, 0x70($s1)
    sw          $v0, 0x74($s1)
    addiu       $v0, $zero, 0x4
    j .L80055894
    sw          $v0, 0x138($s1)
.L80055880:
    lw          $v0, 0x18($s1)
    lw          $a0, 0x1C($s1)
    sw          $v1, 0x138($s1)
    sw          $v0, 0x70($s1)
    sw          $a0, 0x74($s1)
.L80055894:
    lw          $v0, 0x20($s1)
    lw          $v1, 0xD8($s1)
    blez        $v0, .L8005596C
    addu        $s2, $zero, $zero
    addiu       $a2, $v1, 0x24
.L800558A8:
    lw          $a0, 0x138($s1)
    slti        $v0, $a0, 0x8
    beqz        $v0, .L8005594C
    addu        $a3, $a0, $zero
    lw          $t3, -0x1C($a2)
    .word       0x01640018  # mult        $t3, $a0
    .word       0x00001812  # mflo        $v1
    lw          $t0, 0x130($s1)
    nop
    .word       0x01040018  # mult        $t0, $a0
    .word       0x00001012  # mflo        $v0
    sll         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L80055950
    sw          $a0, 0x0($a2)
    lw          $t2, -0x18($a2)
    lw          $t1, 0x134($s1)
.L800558EC:
    .word       0x01440018  # mult        $t2, $a0
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x01270018  # mult        $t1, $a3
    .word       0x00001812  # mflo        $v1
    sll         $v0, $v0, 1
    slt         $v1, $v1, $v0
    bnez        $v1, .L8005594C
    addu        $a1, $a3, $zero
    sll         $a0, $a0, 1
    slti        $v0, $a0, 0x8
    beql        $v0, $zero, .L80055950
    sw          $a0, 0x0($a2)
    .word       0x01640018  # mult        $t3, $a0
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x01050018  # mult        $t0, $a1
    .word       0x00001812  # mflo        $v1
    sll         $v0, $v0, 1
    slt         $v1, $v1, $v0
    beqz        $v1, .L800558EC
    nop
.L8005594C:
    sw          $a0, 0x0($a2)
.L80055950:
    lw          $v0, 0x20($s1)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L800558A8
    addiu       $a2, $a2, 0x54
    lw          $v0, 0x20($s1)
    lw          $v1, 0xD8($s1)
.L8005596C:
    blez        $v0, .L800559E8
    addu        $s2, $zero, $zero
    addiu       $s0, $v1, 0x2C
.L80055978:
    lw          $v1, -0x24($s0)
    lw          $v0, -0x8($s0)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $a0, 0x18($s1)
    nop
    .word       0x00830018  # mult        $a0, $v1
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x130($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    lw          $a1, -0x20($s0)
    lw          $v1, -0x8($s0)
    .word       0x00A30018  # mult        $a1, $v1
    .word       0x00002812  # mflo        $a1
    sw          $v0, -0x4($s0)
    lw          $a0, 0x1C($s1)
    .word       0x00850018  # mult        $a0, $a1
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x134($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    sw          $v0, 0x0($s0)
    lw          $v0, 0x20($s1)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L80055978
    addiu       $s0, $s0, 0x54
.L800559E8:
    lw          $v0, 0x28($s1)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L80055A28
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x3218($at)
    jr          $v0
    nop
    j .L80055A2C
    addiu       $v0, $zero, 0x1
    j .L80055A2C
    addiu       $v0, $zero, 0x3
    j .L80055A2C
    addiu       $v0, $zero, 0x4
.L80055A28:
    lw          $v0, 0x20($s1)
.L80055A2C:
    sw          $v0, 0x78($s1)
    lw          $v0, 0x54($s1)
    bnez        $v0, .L80055A40
    addiu       $v1, $zero, 0x1
    lw          $v1, 0x78($s1)
.L80055A40:
    sw          $v1, 0x7C($s1)
    jal         object_state_pattern_test
    addu        $a0, $s1, $zero
    beqz        $v0, .L80055A60
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x134($s1)
    j .L80055A64
    sw          $v0, 0x80($s1)
.L80055A60:
    sw          $v0, 0x80($s1)
.L80055A64:
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_driver_update

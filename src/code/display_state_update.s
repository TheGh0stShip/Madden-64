.text
.align 2
.set noreorder
.globl display_state_update
.ent display_state_update
display_state_update:
    addiu       $sp, $sp, -0x38
    sw          $s3, 0x2C($sp)
    addu        $s3, $a0, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $a3, $zero
    andi        $a1, $a1, 0xFF
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, -0x56FC($at)
    addu        $s0, $a2, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x800
    andi        $s0, $s0, 0xFF
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x02020019  # multu       $s0, $v0
    .word       0x00004010  # mfhi        $t0
    srl         $v1, $t0, 3
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    subu        $s4, $s0, $v0
    sltiu       $v0, $s0, 0x64
    beqz        $v0, .L80042364
    andi        $a1, $v1, 0xFF
    sltu        $v0, $zero, $a1
    sltiu       $v1, $s0, 0x1
    or          $v0, $v0, $v1
    beqz        $v0, .L80042334
    addu        $a2, $s3, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5658($a0)
    addiu       $a3, $zero, 0x40
    addiu       $s1, $zero, 0x20
    addiu       $v0, $zero, 0x9
    addiu       $s0, $zero, 0xB
    sw          $s1, 0x10($sp)
    sw          $v0, 0x14($sp)
    jal         func_80042170
    sw          $s0, 0x18($sp)
    andi        $a1, $s4, 0xFF
    lui         $a0, 0x8008
    lw          $a0, -0x5658($a0)
    addu        $a2, $s3, $zero
    addiu       $a3, $zero, 0x40
    addiu       $v0, $zero, 0x18
    sw          $s1, 0x10($sp)
    sw          $v0, 0x14($sp)
    j .L8004235C
    sw          $s0, 0x18($sp)
.L80042334:
    andi        $a1, $s4, 0xFF
    lui         $a0, 0x8008
    lw          $a0, -0x5658($a0)
    addiu       $a3, $zero, 0x40
    addiu       $v0, $zero, 0x20
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x10
    sw          $v0, 0x14($sp)
    addiu       $v0, $zero, 0xB
    sw          $v0, 0x18($sp)
.L8004235C:
    jal         func_80042170
    nop
.L80042364:
    beqz        $s2, .L800423FC
    nop
    lbu         $v0, 0x0($s2)
    beqz        $v0, .L800423FC
    nop
    jal         func_8004DF94
    addu        $a0, $s2, $zero
    lbu         $a1, 0x0($s2)
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0xC
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    beqz        $a1, .L800423FC
    srl         $s0, $v0, 1
    addiu       $s1, $zero, 0x20
    addiu       $s4, $zero, 0x2
.L800423B0:
    bne         $a1, $s1, .L800423C0
    addiu       $a1, $a1, -0x2E
    j .L800423EC
    addiu       $s0, $s0, 0x4
.L800423C0:
    andi        $a1, $a1, 0xFF
    addu        $a2, $s3, $zero
    addiu       $a3, $zero, 0x40
    lui         $a0, 0x8008
    lw          $a0, -0x5654($a0)
    andi        $v0, $s0, 0xFF
    addiu       $s0, $s0, 0x4
    sw          $s1, 0x10($sp)
    sw          $v0, 0x14($sp)
    jal         func_80042170
    sw          $s4, 0x18($sp)
.L800423EC:
    addiu       $s2, $s2, 0x1
    lbu         $a1, 0x0($s2)
    bnez        $a1, .L800423B0
    nop
.L800423FC:
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end display_state_update

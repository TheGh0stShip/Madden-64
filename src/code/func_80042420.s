.text
.align 2
.set noreorder
.globl func_80042420
.ent func_80042420
func_80042420:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x28($sp)
    addu        $s2, $a0, $zero
    andi        $a1, $a1, 0xFF
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $ra, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, -0x56FC($at)
    addu        $s0, $a2, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x800
    andi        $v1, $s0, 0xFF
    sltiu       $v0, $v1, 0x64
    beqz        $v0, .L8004254C
    nop
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00004010  # mfhi        $t0
    srl         $a0, $t0, 3
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    subu        $s3, $v1, $v0
    andi        $v0, $a0, 0xFF
    sltu        $v0, $zero, $v0
    sltiu       $v1, $v1, 0x1
    or          $v0, $v0, $v1
    beqz        $v0, .L80042518
    addu        $a1, $s3, $zero
    addiu       $a1, $a0, 0x2
    andi        $a1, $a1, 0xFF
    addu        $a2, $s2, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5654($a0)
    addiu       $a3, $zero, 0x20
    addiu       $s1, $zero, 0x40
    addiu       $v0, $zero, 0x13
    addiu       $s0, $zero, 0x2C
    sw          $s1, 0x10($sp)
    sw          $v0, 0x14($sp)
    jal         func_80042170
    sw          $s0, 0x18($sp)
    addiu       $a1, $s3, 0x2
    andi        $a1, $a1, 0xFF
    lui         $a0, 0x8008
    lw          $a0, -0x5654($a0)
    addu        $a2, $s2, $zero
    addiu       $a3, $zero, 0x20
    addiu       $v0, $zero, 0x18
    sw          $s1, 0x10($sp)
    sw          $v0, 0x14($sp)
    j .L80042544
    sw          $s0, 0x18($sp)
.L80042518:
    andi        $a1, $a1, 0xFF
    addu        $a2, $s2, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5654($a0)
    addiu       $a3, $zero, 0x20
    addiu       $v0, $zero, 0x40
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x15
    sw          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x2C
    sw          $v0, 0x18($sp)
.L80042544:
    jal         func_80042170
    nop
.L8004254C:
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80042420

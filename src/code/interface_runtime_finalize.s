.text
.align 2
.set noreorder
.globl interface_runtime_finalize
.ent interface_runtime_finalize
interface_runtime_finalize:
    addiu       $sp, $sp, -0x40
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s4, 0x8($a0)
    lw          $v0, 0x4($s4)
    lw          $v1, 0x0($s4)
    lw          $s1, 0xC($v0)
    lh          $a0, 0x4($v1)
    lh          $v0, 0x6($v1)
    sw          $zero, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $zero, 0x18($sp)
    addu        $s0, $a0, $v0
    addu        $v0, $s0, $zero
    beqz        $v0, .L80041184
    addiu       $s0, $s0, -0x1
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s0
    sll         $s2, $v0, 2
.L800410F4:
    beql        $s1, $zero, .L80041178
    addiu       $s2, $s2, -0xA4
    lw          $v0, 0x14($s1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80041170
    nop
    lw          $v0, 0x10($s4)
    addu        $v1, $s2, $v0
    lh          $a0, 0xA2($v1)
    lw          $v0, 0x18($v1)
    slt         $v0, $a0, $v0
    bnez        $v0, .L80041148
    nop
    lw          $v0, 0x1C($v1)
    slt         $v0, $a0, $v0
    bnez        $v0, .L80041148
    nop
    lw          $v0, 0x20($v1)
    slt         $v0, $a0, $v0
    beqz        $v0, .L80041170
    nop
.L80041148:
    lw          $a1, 0x10($s4)
    addu        $a0, $s1, $zero
    jal         func_800409B8
    addu        $a1, $a1, $s2
    jal         func_8000F038
    addu        $a0, $s1, $zero
    lw          $a1, 0x10($s4)
    addu        $a0, $s1, $zero
    jal         func_80040930
    addu        $a2, $a1, $s2
.L80041170:
    lw          $s1, 0x0($s1)
    addiu       $s2, $s2, -0xA4
.L80041178:
    addu        $v0, $s0, $zero
    bnez        $v0, .L800410F4
    addiu       $s0, $s0, -0x1
.L80041184:
    lb          $v0, 0x18($s4)
    beqz        $v0, .L800412B0
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x58AC($v1)
    j .L8004129C
    addu        $v0, $v0, $v1
.L800411A8:
    lw          $v0, 0x8($s4)
    lw          $s1, 0xC($v0)
    beqz        $s1, .L800411E4
    nop
.L800411B8:
    lw          $v0, 0x8($s1)
    lhu         $v1, 0x16($s4)
    lh          $v0, 0x16($v0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800411D8
    nop
    jal         func_8001A520
    addu        $a0, $s1, $zero
.L800411D8:
    lw          $s1, 0x0($s1)
    bnez        $s1, .L800411B8
    nop
.L800411E4:
    lw          $v0, 0x0($s4)
    lw          $v1, 0x4($s4)
    lh          $a0, 0x4($v0)
    lh          $v0, 0x6($v0)
    lw          $s1, 0xC($v1)
    addu        $s0, $a0, $v0
    addu        $v0, $s0, $zero
    beqz        $v0, .L80041274
    addiu       $s0, $s0, -0x1
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $s6, $v0, 4
    sll         $v1, $s0, 2
    addu        $v1, $v1, $s0
    sll         $v0, $v1, 3
    addu        $v0, $v0, $s0
    sll         $s3, $v0, 2
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addiu       $s2, $v1, 0x8
.L80041238:
    lw          $a0, 0x0($s4)
    lw          $a1, 0x10($s4)
    lw          $a2, 0xC($s4)
    addu        $s5, $s0, $zero
    addu        $a0, $a0, $s2
    addu        $a1, $a1, $s3
    jal         func_80040F60
    addu        $a2, $a2, $s6
    beqz        $s1, .L80041264
    addiu       $s6, $s6, -0x30
    lw          $s1, 0x0($s1)
.L80041264:
    addiu       $s3, $s3, -0xA4
    addiu       $s2, $s2, -0x54
    bnez        $s5, .L80041238
    addiu       $s0, $s0, -0x1
.L80041274:
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    lhu         $v0, 0x16($s4)
    lw          $a1, 0x10($s4)
    addiu       $v0, $v0, 0x1
    jal         func_800408C8
    sh          $v0, 0x16($s4)
    lui         $v0, 0x8009
    lw          $v0, -0x58AC($v0)
    addiu       $v0, $v0, -0x4
.L8004129C:
    lui         $at, 0x8009
    sw          $v0, -0x58AC($at)
    sltiu       $v0, $v0, 0x4
    beqz        $v0, .L800411A8
    nop
.L800412B0:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end interface_runtime_finalize

.text
.align 2
.set noreorder
.globl func_8009F9E8
.ent func_8009F9E8
func_8009F9E8:
    addiu       $sp, $sp, -0x40
    sw          $s6, 0x30($sp)
    addu        $s6, $a0, $zero
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lui         $at, 0x8008
    sw          $zero, -0x5F88($at)
    lui         $at, 0x8008
    sw          $zero, -0x5F84($at)
    jal         func_800A2BAC
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8008
    sw          $zero, -0x5F7C($at)
    lui         $at, 0x8008
    sw          $zero, 0x54A4($at)
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    lui         $at, 0x8008
    sw          $zero, 0x7FAC($at)
    lui         $at, 0x8009
    sb          $zero, -0x5090($at)
    jal         func_80016FD4
    addu        $s7, $zero, $zero
    andi        $a0, $v0, 0xFFFF
    jal         func_80035D7C
    addiu       $a1, $zero, 0x20
    addu        $a1, $v0, $zero
    lui         $at, 0x8008
    sw          $a1, 0x5BEC($at)
    jal         func_80096878
    addiu       $a0, $zero, 0x10
    lui         $a1, 0x8008
    lw          $a1, 0x5BEC($a1)
    addiu       $a0, $zero, 0x10
    lui         $at, 0x8009
    sh          $v0, -0x6CE6($at)
    jal         func_80096878
    addiu       $a1, $a1, 0x20
    lui         $a1, 0x8008
    lw          $a1, 0x5BEC($a1)
    addu        $s5, $zero, $zero
    addiu       $a0, $zero, 0x10
    lui         $at, 0x8009
    sh          $v0, -0x4DEC($at)
    jal         func_80096878
    addiu       $a1, $a1, 0x40
    lui         $at, 0x8008
    sh          $v0, 0x5130($at)
    jal         func_8009518C
    addiu       $a0, $zero, 0x1
    lui         $v1, 0x8009
    lw          $v1, -0x79D0($v1)
    addu        $s3, $zero, $zero
    lui         $at, 0x8007
    sw          $v0, -0x6548($at)
    lui         $at, 0x8007
    sw          $v0, -0x6488($at)
    lui         $at, 0x8007
    sw          $v1, -0x6598($at)
    jal         func_8009518C
    addiu       $a0, $zero, 0x2
    lui         $at, 0x8007
    sw          $v0, -0x6578($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x1E
    addu        $s4, $v0, $zero
    lui         $at, 0x8008
    sw          $zero, 0x7950($at)
    sll         $v1, $s3, 16
.L8009FB18:
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $s0, $v0, 4
    slti        $v1, $v1, 0x4
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $s3, 0x7157($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $zero, 0x7159($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $zero, 0x7168($at)
    bnez        $v1, .L8009FB84
    addu        $a0, $s6, $zero
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6578
    jal         func_8000D740
    addiu       $a1, $zero, 0x6
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $v0, 0x715C($at)
    j           func_8009B4A8
    sll         $s0, $s3, 16
.L8009FB84:
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6598
    jal         func_8000D740
    addiu       $a1, $zero, 0x7
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $v0, 0x715C($at)
    addu        $a0, $v0, $zero
    andi        $a1, $s7, 0xFFFF
    addu        $a2, $s5, $zero
    jal         func_8009B280
    andi        $a3, $s4, 0xFFFF
    jal         func_80031A1C
    addiu       $a0, $zero, 0x14
    addiu       $v0, $v0, 0x1
    addu        $s4, $s4, $v0
    addiu       $s5, $zero, 0x1
    sll         $s0, $s3, 16
    sra         $s0, $s0, 16
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $s1, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x1C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x20($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x24($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x2C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x30($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sw          $zero, 0x34($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    sh          $zero, 0x3E($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    addiu       $v0, $zero, 0x96
    sh          $v0, 0x3C($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    addiu       $v0, $zero, 0x2000
    sw          $v0, 0x40($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    addiu       $v0, $zero, 0x1800
    sw          $v0, 0x44($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    addiu       $v0, $zero, 0x235
    sw          $v0, 0x14($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    lui         $v0, 0x800A
    addiu       $v0, $v0, -0x4870
    sw          $v0, 0xC($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x715C($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    addu        $s2, $s1, $v0
    addiu       $v0, $zero, 0x20
    sw          $s2, 0x10($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $v0, 0x7144($at)
    addiu       $v0, $zero, 0xA0
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sb          $v0, 0x7142($at)
    jal         func_800E1C98
    addu        $a0, $s2, $zero
    slti        $s0, $s0, 0x4
    bnez        $s0, .L8009FD64
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, 0x715C($at)
    lui         $a1, 0x8008
    lhu         $a1, 0x5130($a1)
    jal         func_80096A00
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a2, 0x715C($at)
    addu        $a0, $s2, $zero
    lw          $v1, 0x14($a2)
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, -0x201
    and         $v1, $v1, $v0
    addiu       $v0, $zero, 0x3A
    sw          $v1, 0x14($a2)
    jal         func_800E1A84
    sb          $v0, 0x10($sp)
    addu        $a0, $s2, $zero
    j           func_8009B6A4
    addiu       $a1, $zero, 0x200
.L8009FD64:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, 0x715C($at)
    jal         func_800B95D8
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x715C($at)
    lw          $v1, 0x48($v0)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x16($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, 0x715C($at)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x4824
    jal         func_800B96C0
    nop
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x34
    jal         func_800E1A84
    sb          $v0, 0x10($sp)
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0x41
    jal         func_800C0C8C
    nop
    addiu       $v0, $s3, 0x1
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, .L8009FB18
    sll         $v1, $s3, 16
    addu        $a0, $s6, $zero
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6488
    jal         func_8000D740
    addiu       $a1, $zero, 0x6
    lui         $a1, 0x8008
    lhu         $a1, 0x5130($a1)
    addu        $a0, $v0, $zero
    addiu       $v0, $zero, 0x32
    sh          $v0, 0x3C($a0)
    addiu       $v0, $zero, 0x1000
    sw          $v0, 0x40($a0)
    addiu       $v0, $zero, 0x30
    lui         $at, 0x8009
    sw          $a0, -0x791C($at)
    sw          $zero, 0x1C($a0)
    sw          $zero, 0x20($a0)
    sw          $zero, 0x24($a0)
    sw          $zero, 0x2C($a0)
    sw          $zero, 0x30($a0)
    sw          $zero, 0x34($a0)
    sh          $zero, 0x3E($a0)
    sw          $zero, 0x44($a0)
    sw          $v0, 0x14($a0)
    sw          $zero, 0xC($a0)
    jal         func_80096A00
    sw          $zero, 0x10($a0)
    jal         func_8009BB00
    nop
    jal         func_8009B980
    nop
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $zero, 0x69D4($at)
    lui         $at, 0x8008
    sh          $zero, 0x7AC0($at)
    lui         $at, 0x8009
    sb          $v0, -0x79CA($at)
    lw          $ra, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_8009F9E8

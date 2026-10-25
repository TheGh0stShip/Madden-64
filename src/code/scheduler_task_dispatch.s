.text
.align 2
.set noreorder
.globl scheduler_task_dispatch
.ent scheduler_task_dispatch
scheduler_task_dispatch:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $sp, $sp, -0x58
    sw          $s3, 0x44($sp)
    addu        $s3, $a0, $zero
    sw          $s2, 0x40($sp)
    addu        $s2, $a1, $zero
    sw          $s4, 0x48($sp)
    addu        $s4, $a2, $zero
    lui         $a0, 0xAF00
    sw          $ra, 0x50($sp)
    sw          $s5, 0x4C($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    lbu         $s1, 0x51($s3)
    ori         $a0, $a0, 0x7FF
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($v1)
    lui         $v0, 0x7
    addiu       $v0, $v0, 0x6D00
    sw          $v0, 0xC($v1)
    addiu       $v0, $v1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x5
    addiu       $v0, $v0, 0x3398
    sw          $zero, 0x4($v1)
    sw          $a0, 0x10($v1)
    jal         func_80008FA0
    sw          $v0, 0x14($v1)
    jal         func_8000BC74
    andi        $s1, $s1, 0xFFFF
    jal         func_800425B8
    sll         $s0, $s1, 1
    lui         $a0, 0x8009
    lw          $a0, -0x5C20($a0)
    jal         func_8000DE34
    addu        $s0, $s0, $s1
    jal         func_8000E3C8
    sll         $s0, $s0, 2
    jal         func_8000E20C
    subu        $s0, $s0, $s1
    lbu         $v0, 0x50($s3)
    sll         $s0, $s0, 2
    lui         $s1, 0x8008
    addiu       $s1, $s1, -0x56F8
    addu        $v1, $s0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0x0($v0)
    jal         func_800093F4
    addiu       $s1, $s1, -0x20
    jal         func_8002CBD4
    addu        $s0, $s0, $s1
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x30
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addiu       $a2, $sp, 0x34
    addu        $a3, $s2, $zero
    jal         func_80043114
    sw          $v0, 0x10($sp)
    lw          $a0, 0x3C($s3)
    addu        $s2, $zero, $zero
    andi        $s5, $v0, 0xFF
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
.L80044DBC:
    jal         func_8002CBD4
    andi        $s1, $s2, 0xFFFF
    sw          $s5, 0x10($sp)
    lw          $a1, 0x30($sp)
    lw          $a2, 0x34($sp)
    addiu       $a0, $sp, 0x18
    jal         func_80042F50
    andi        $a3, $s2, 0xFF
    jal         func_8002DA14
    addiu       $a0, $sp, 0x18
    lw          $a0, 0x2C($sp)
    jal         func_8002D14C
    nop
    lw          $a0, 0x28($sp)
    jal         func_8002CF48
    nop
    lw          $a0, 0x24($sp)
    jal         func_8002CD44
    nop
    jal         func_8002D398
    nop
    lw          $a0, 0x40($s3)
    lw          $a1, 0x44($s3)
    lw          $a2, 0x48($s3)
    jal         func_8002D8D0
    nop
    sll         $a0, $s1, 6
    jal         func_8002DEF4
    addu        $a0, $s4, $a0
    addiu       $v0, $zero, 0xD
    beq         $s1, $v0, .L80044E5C
    nop
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lbu         $v0, 0x4A64($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a1, 0x0($v0)
    j .L80044E60
    nop
.L80044E5C:
    lw          $a1, 0x28($s3)
.L80044E60:
    jal         func_8000B184
    addiu       $a0, $zero, 0x2
    lw          $v1, 0x24($s3)
    andi        $a1, $s2, 0xFFFF
    sll         $v0, $a1, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0x0($v0)
    sll         $a1, $a1, 6
    lw          $a2, 0x8($a0)
    addu        $a1, $s4, $a1
    jal         func_80042848
    addiu       $s2, $s2, 0x1
    jal         func_8002CD28
    nop
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0xE
    bnez        $v0, .L80044DBC
    nop
    jal         func_8002CD28
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0xAF00
    ori         $a0, $a0, 0x7FF
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($v1)
    lui         $v0, 0x7
    addiu       $v0, $v0, 0x5D00
    sw          $v0, 0xC($v1)
    addiu       $v0, $v1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x5
    addiu       $v0, $v0, 0xF78
    sw          $zero, 0x4($v1)
    sw          $a0, 0x10($v1)
    jal         func_80008FA0
    sw          $v0, 0x14($v1)
    jal         func_8000BC74
    nop
    lw          $ra, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end scheduler_task_dispatch

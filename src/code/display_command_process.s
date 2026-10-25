.text
.align 2
.set noreorder
.globl display_command_process
.ent display_command_process
display_command_process:
    addiu       $sp, $sp, -0x40
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0xAF00
    ori         $a0, $a0, 0x7FF
    sw          $ra, 0x3C($sp)
    sw          $fp, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
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
    nop
    jal         func_800425B8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x5C20($a0)
    jal         func_8000DE34
    nop
    jal         func_8000E3C8
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x4A38
    jal         func_8000DF34
    nop
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x4A3C
    jal         func_8000E05C
    addu        $a0, $zero, $zero
    jal         func_8000E20C
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x564C($a1)
    beqz        $a1, .L80042B0C
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5650($a0)
    lw          $a2, 0x8($a0)
    jal         func_80042848
    nop
.L80042B0C:
    lui         $a0, 0x8009
    lw          $a0, -0x5C20($a0)
    lui         $fp, 0xBC00
    ori         $fp, $fp, 0x806
    addu        $s7, $zero, $zero
    lui         $s6, 0x8008
    addiu       $s6, $s6, -0x5640
    jal         func_8000DE34
    sw          $zero, 0x14($sp)
    jal         func_8000E3C8
    nop
    jal         func_8000E20C
    nop
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x56F8
    addiu       $s5, $v0, -0x20
    addu        $s4, $v0, $zero
.L80042B50:
    addiu       $s3, $zero, -0x1
    addu        $s1, $zero, $zero
    addu        $s2, $s6, $zero
.L80042B5C:
    lw          $s0, 0x0($s2)
    beql        $s0, $zero, .L80042CA0
    addiu       $s1, $s1, 0x1
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lb          $a3, 0x4944($at)
    beq         $a3, $s3, .L80042C30
    lui         $a0, 0xF500
    ori         $a0, $a0, 0x100
    lui         $a2, 0x73F
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a2, $a2, 0xC000
    lui         $v0, 0xFD10
    sw          $v0, 0x0($v1)
    sll         $v0, $a3, 2
    addu        $v0, $v0, $s4
    lw          $a1, 0x0($v0)
    addu        $s3, $a3, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE800
    sw          $v0, 0x8($v1)
    addiu       $v0, $v1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x700
    sw          $v0, 0x14($v1)
    addiu       $v0, $v1, 0x20
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE600
    sw          $v0, 0x18($v1)
    addiu       $v0, $v1, 0x28
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xF000
    sw          $v0, 0x20($v1)
    addiu       $v0, $v1, 0x30
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $zero, 0xC($v1)
    sw          $a0, 0x10($v1)
    sw          $zero, 0x1C($v1)
    sw          $a2, 0x24($v1)
    sw          $v0, 0x28($v1)
    sw          $zero, 0x2C($v1)
    sw          $a1, 0x4($v1)
.L80042C30:
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lb          $v0, 0x4958($at)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $fp, 0x0($v1)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x4($v1)
    lw          $a0, 0x0($s0)
    lw          $a1, 0x4($s0)
    lw          $a2, 0x8($a0)
    addiu       $v1, $v1, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    j .L80042C88
    nop
.L80042C78:
    lw          $a0, 0x0($s0)
    lw          $a2, 0x8($a0)
    lw          $a1, 0x4($s0)
    addiu       $a2, $a2, 0x38
.L80042C88:
    jal         func_80042848
    nop
    lw          $s0, 0xC($s0)
    bnez        $s0, .L80042C78
    nop
    addiu       $s1, $s1, 0x1
.L80042CA0:
    sltiu       $v0, $s1, 0x13
    bnez        $v0, .L80042B5C
    addiu       $s2, $s2, 0x4
    lui         $at, 0x8008
    addu        $at, $at, $s7
    lw          $s0, -0x55F4($at)
    beql        $s0, $zero, .L80042D04
    addiu       $s7, $s7, 0x50
.L80042CC0:
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    sw          $fp, 0x0($v0)
    lw          $v1, 0x8($s0)
    sw          $v1, 0x4($v0)
    lw          $a0, 0x0($s0)
    lw          $a1, 0x4($s0)
    lw          $a2, 0x8($a0)
    addiu       $v0, $v0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    jal         func_80042848
    nop
    lw          $s0, 0xC($s0)
    bnez        $s0, .L80042CC0
    nop
    addiu       $s7, $s7, 0x50
.L80042D04:
    addiu       $s5, $s5, 0x2C
    lw          $t0, 0x14($sp)
    addiu       $s4, $s4, 0x2C
    addiu       $s6, $s6, 0x50
    addiu       $t0, $t0, 0x1
    sltiu       $v0, $t0, 0x4
    bnez        $v0, .L80042B50
    sw          $t0, 0x14($sp)
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
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
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
.end display_command_process

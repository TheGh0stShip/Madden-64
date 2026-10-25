.text
.align 2
.set noreorder
.globl object_resource_process
.ent object_resource_process
object_resource_process:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $s1, 0x4($s0)
    beqz        $s1, .L8000F01C
    lui         $a0, 0x80
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $s2, 0xE700
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s2, 0x0($v1)
    jal         func_80009E14
    sw          $zero, 0x4($v1)
    jal         func_8000A404
    addu        $a0, $zero, $zero
    jal         func_8000A22C
    addu        $a0, $zero, $zero
    lw          $a1, 0xC($s1)
    jal         func_8000B184
    addiu       $a0, $zero, 0x1
    addiu       $a0, $zero, 0x4
    jal         func_8000B184
    addiu       $a1, $s0, 0xD8
    lhu         $v0, 0x4($s1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8000EF98
    lui         $a0, 0x2
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    sw          $s2, 0x0($v0)
    sw          $zero, 0x4($v0)
    lhu         $v1, 0xA8($s0)
    addiu       $v0, $v0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v1, $v1, 0x10
    beqz        $v1, .L8000EE90
    nop
    jal         func_8000A3C0
    lui         $a0, 0x10
    lui         $a0, 0x3
    jal         func_8000AFA8
    ori         $a0, $a0, 0x2205
    lhu         $a0, 0x14($s0)
    lhu         $a1, 0x16($s0)
    jal         func_8000AECC
    nop
    lbu         $a0, 0x18($s0)
    lbu         $a1, 0x19($s0)
    lbu         $a2, 0x1A($s0)
    lbu         $a3, 0x1B($s0)
    jal         func_8000A08C
    nop
    jal         func_80009E9C
    addu        $a0, $zero, $zero
    j .L8000EEE4
    nop
.L8000EE90:
    jal         func_8000A3C0
    addu        $a0, $zero, $zero
    lui         $a0, 0x2
    jal         func_8000AFA8
    ori         $a0, $a0, 0x2205
    lui         $a0, 0x44
    ori         $a0, $a0, 0x2078
    lui         $a1, 0x44
    jal         func_8000A63C
    ori         $a1, $a1, 0x2078
    lui         $a1, 0xFC60
    ori         $a1, $a1, 0xFEC1
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0x55FE
    ori         $a0, $a0, 0x793C
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a1, 0x0($v1)
    sw          $a0, 0x4($v1)
.L8000EEE4:
    lhu         $v0, 0x4($s1)
    andi        $v0, $v0, 0x4
    beqz        $v0, .L8000EF00
    nop
    lw          $a1, 0x10($s0)
    jal         func_8000B184
    addiu       $a0, $zero, 0x2
.L8000EF00:
    lhu         $v0, 0x4($s1)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L8000EF1C
    nop
    lw          $a1, 0xC($s0)
    jal         func_8000B184
    addiu       $a0, $zero, 0x3
.L8000EF1C:
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_80009E58
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lw          $v0, 0x4($s0)
    lw          $a0, 0x8($v0)
    jal         func_8000AD84
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    j .L8000F01C
    nop
.L8000EF98:
    jal         func_8000AFA8
    ori         $a0, $a0, 0x2205
    jal         func_8000A3C0
    addu        $a0, $zero, $zero
    lhu         $v0, 0xA8($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L8000EFC8
    lui         $a0, 0x40
    ori         $a0, $a0, 0x49D8
    lui         $a1, 0x40
    j .L8000EFD8
    ori         $a1, $a1, 0x49D8
.L8000EFC8:
    lui         $a0, 0x44
    ori         $a0, $a0, 0x2078
    lui         $a1, 0x44
    ori         $a1, $a1, 0x2078
.L8000EFD8:
    jal         func_8000A63C
    nop
    lui         $a0, 0xFC61
    ori         $a0, $a0, 0xFEC3
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $v0, 0x55FE
    ori         $v0, $v0, 0x7F3F
    sw          $a0, 0x0($v1)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x4($s0)
    lw          $a0, 0x8($v0)
    addiu       $v1, $v1, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    jal         func_8000AD84
    nop
.L8000F01C:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_resource_process

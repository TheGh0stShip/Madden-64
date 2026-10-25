.text
.align 2
.set noreorder
.globl vector_display_emit
.ent vector_display_emit
vector_display_emit:
    addiu       $sp, $sp, -0x60
    sw          $s5, 0x54($sp)
    addiu       $s5, $zero, 0x1
    addiu       $a0, $sp, 0x10
    sw          $ra, 0x5C($sp)
    sw          $s6, 0x58($sp)
    sw          $s4, 0x50($sp)
    sw          $s3, 0x4C($sp)
    sw          $s2, 0x48($sp)
    sw          $s1, 0x44($sp)
    jal         func_8002D800
    sw          $s0, 0x40($sp)
    addu        $s0, $zero, $zero
    addiu       $v1, $sp, 0x10
.L8000E244:
    lw          $v0, 0x0($v1)
    addiu       $s0, $s0, 0x1
    sw          $v0, 0x0($v1)
    sltiu       $v0, $s0, 0x9
    bnez        $v0, .L8000E244
    addiu       $v1, $v1, 0x4
    jal         func_8002CBD4
    addu        $s0, $zero, $zero
    jal         func_8002CB50
    addiu       $a0, $sp, 0x10
    lui         $s6, 0x300
    ori         $s6, $s6, 0x10
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x7D00
    addiu       $s1, $v0, 0x10
    addu        $s4, $v0, $zero
    addu        $s3, $zero, $zero
.L8000E288:
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lw          $v0, -0x7CE0($at)
    beqz        $v0, .L8000E2F8
    addu        $a0, $s4, $zero
    jal         func_8000E164
    addiu       $a1, $s1, 0x8
    jal         func_8000DE18
    nop
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x10
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    andi        $v1, $s5, 0xFF
    addiu       $s5, $s5, 0x1
    sll         $v1, $v1, 1
    addiu       $v1, $v1, 0x84
    andi        $v1, $v1, 0xFF
    sll         $v1, $v1, 16
    or          $v1, $v1, $s6
    addiu       $a0, $v0, 0x8
    lui         $at, 0x8008
    sw          $a0, 0x4F5C($at)
    sw          $v1, 0x0($v0)
    sw          $s2, 0x4($v0)
.L8000E2F8:
    addiu       $s1, $s1, 0x28
    addiu       $s4, $s4, 0x28
    addiu       $s0, $s0, 0x1
    sltiu       $v0, $s0, 0x7
    bnez        $v0, .L8000E288
    addiu       $s3, $s3, 0x28
    jal         func_8000DE18
    andi        $s0, $s5, 0xFF
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, -0x7BE8
    jal         func_8002E17C
    addiu       $a2, $zero, 0x10
    lui         $a0, 0x300
    ori         $a0, $a0, 0x10
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $s0, $s0, -0x1
    sll         $v0, $s0, 1
    addiu       $v0, $v0, 0x86
    andi        $v0, $v0, 0xFF
    sll         $v0, $v0, 16
    or          $v0, $v0, $a0
    sw          $v0, 0x0($v1)
    sw          $s2, 0x4($v1)
    lui         $a0, 0x8008
    lbu         $a0, -0x7BD8($a0)
    lui         $a1, 0x8008
    lbu         $a1, -0x7BD7($a1)
    lui         $a2, 0x8008
    lbu         $a2, -0x7BD6($a2)
    addiu       $v1, $v1, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    jal         func_80009FDC
    addiu       $a3, $zero, 0xFF
    jal         func_8000B0EC
    addu        $a0, $s0, $zero
    jal         func_8002CD28
    nop
    lw          $ra, 0x5C($sp)
    lw          $s6, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end vector_display_emit

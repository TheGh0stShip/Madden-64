.text
.align 2
.set noreorder
.globl ui_text_update
.ent ui_text_update
ui_text_update:
    addiu       $sp, $sp, -0x50
    sw          $s7, 0x44($sp)
    addu        $s7, $a0, $zero
    sw          $s3, 0x34($sp)
    addu        $s3, $a1, $zero
    sw          $s2, 0x30($sp)
    addu        $s2, $a2, $zero
    sw          $s4, 0x38($sp)
    sw          $ra, 0x4C($sp)
    sw          $fp, 0x48($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    lw          $a1, 0x8($s7)
    beqz        $s2, .L8001DA2C
    addu        $s4, $a3, $zero
    lbu         $v0, 0x16($s2)
    lbu         $v1, 0x17($s2)
    lbu         $a0, 0x18($s2)
    lhu         $fp, 0x1A($a1)
    lhu         $a1, 0x1C($a1)
    addu        $s1, $zero, $zero
    lui         $at, 0x8008
    sb          $zero, 0x5027($at)
    sll         $v0, $v0, 16
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $s0, $v0, $a0
    sll         $s6, $fp, 24
    sll         $s5, $a1, 24
    sh          $a1, 0x26($sp)
    sra         $a2, $s6, 24
.L8001D91C:
    sra         $a3, $s5, 24
    sll         $v0, $s1, 24
    sra         $v0, $v0, 24
    addu        $v0, $s2, $v0
    lbu         $a0, 0x0($v0)
    lbu         $a1, 0x1($v0)
    andi        $v0, $s0, 0x3
    srl         $s0, $s0, 2
    addiu       $t0, $zero, 0x61
    sw          $s3, 0x10($sp)
    sw          $s4, 0x14($sp)
    sw          $v0, 0x18($sp)
    subu        $a0, $t0, $a0
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    andi        $a1, $a1, 0x3F
    jal         func_8001E668
    addiu       $a1, $a1, 0x9
    addiu       $v0, $s1, 0x2
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slti        $v0, $v0, 0x16
    bnez        $v0, .L8001D91C
    sra         $a2, $s6, 24
    addu        $s1, $zero, $zero
    lbu         $v1, 0x16($s2)
    lbu         $a0, 0x17($s2)
    lbu         $a1, 0x18($s2)
    lhu         $t0, 0x26($sp)
    sll         $s6, $fp, 24
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
    sll         $s5, $t0, 24
    sll         $v1, $v1, 16
    sll         $a0, $a0, 8
    or          $v1, $v1, $a0
    or          $s0, $v1, $a1
    sra         $a2, $s6, 24
.L8001D9BC:
    sra         $a3, $s5, 24
    sll         $v0, $s1, 24
    sra         $v0, $v0, 24
    addu        $v0, $s2, $v0
    lbu         $a0, 0x0($v0)
    lbu         $a1, 0x1($v0)
    andi        $v0, $s0, 0x3
    srl         $s0, $s0, 2
    addiu       $t0, $zero, 0x5F
    sw          $s3, 0x10($sp)
    sw          $s4, 0x14($sp)
    sw          $v0, 0x18($sp)
    subu        $a0, $t0, $a0
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    andi        $a1, $a1, 0x3F
    jal         func_8001E668
    addiu       $a1, $a1, 0x7
    addiu       $v0, $s1, 0x2
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slti        $v0, $v0, 0x16
    bnez        $v0, .L8001D9BC
    sra         $a2, $s6, 24
    addiu       $a0, $zero, 0x5
    j .L8001DA34
    addiu       $a1, $zero, 0xE
.L8001DA2C:
    addiu       $a0, $zero, 0x5
    addiu       $a1, $zero, 0x18
.L8001DA34:
    addu        $a2, $s7, $zero
    lw          $t0, 0x60($sp)
    addu        $a3, $s3, $zero
    ori         $v0, $zero, 0xC02F
    lui         $at, 0x8008
    sb          $zero, 0x5027($at)
    sw          $s4, 0x14($sp)
    sw          $v0, 0x18($sp)
    jal         func_8001E8F0
    sw          $t0, 0x10($sp)
    lw          $ra, 0x4C($sp)
    lw          $fp, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end ui_text_update

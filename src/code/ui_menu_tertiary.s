.text
.align 2
.set noreorder
.globl ui_menu_tertiary
.ent ui_menu_tertiary
ui_menu_tertiary:
    addiu       $sp, $sp, -0x58
    lw          $v1, 0x70($sp)
    sw          $s2, 0x38($sp)
    lw          $s2, 0x68($sp)
    sw          $ra, 0x54($sp)
    sw          $fp, 0x50($sp)
    sw          $s7, 0x4C($sp)
    sw          $s6, 0x48($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $s1, 0x34($sp)
    sw          $s0, 0x30($sp)
    sw          $a3, 0x2C($sp)
    lw          $v0, 0x8($a2)
    lw          $s5, 0x6C($sp)
    addu        $s1, $a0, $zero
    sb          $a1, 0x27($sp)
    lhu         $fp, 0x1A($v0)
    lhu         $s7, 0x1C($v0)
    andi        $v0, $v1, 0x8000
    beqz        $v0, .L8001E958
    addu        $s3, $v1, $zero
    addiu       $s0, $zero, 0x2
    j .L8001E95C
    andi        $s3, $v1, 0x7FFF
.L8001E958:
    addu        $s0, $zero, $zero
.L8001E95C:
    andi        $v0, $s3, 0x4000
    beqz        $v0, .L8001E994
    addu        $a0, $s2, $zero
    andi        $s3, $s3, 0xBFFF
    addu        $a1, $s5, $zero
    addu        $a2, $s0, $zero
    jal         func_8001E820
    addu        $a3, $s3, $zero
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x60
    subu        $v1, $v1, $v0
    srl         $v0, $v1, 31
    addu        $v1, $v1, $v0
    srl         $s1, $v1, 1
.L8001E994:
    lbu         $v1, 0x0($s2)
    beqz        $v1, .L8001EA70
    addu        $s4, $zero, $zero
    addiu       $s6, $s0, 0x2
    andi        $a1, $v1, 0xFF
.L8001E9A8:
    addiu       $v0, $zero, 0x20
    bne         $a1, $v0, .L8001E9BC
    addiu       $s4, $s4, 0x1
    j .L8001EA60
    addu        $s1, $s1, $s6
.L8001E9BC:
    addiu       $a0, $v1, -0x41
    andi        $v0, $a0, 0xFF
    sltiu       $v0, $v0, 0x1A
    beql        $v0, $zero, .L8001E9D8
    addiu       $a0, $v1, -0x30
    j .L8001E9F8
    addu        $v1, $a0, $zero
.L8001E9D8:
    andi        $v0, $a0, 0xFF
    sltiu       $v0, $v0, 0xA
    beqz        $v0, .L8001E9F0
    addiu       $v0, $zero, 0x2D
    j .L8001E9F8
    addiu       $v1, $a0, 0x1A
.L8001E9F0:
    beql        $a1, $v0, .L8001E9F8
    addiu       $v1, $zero, 0x24
.L8001E9F8:
    addu        $v1, $s3, $v1
    andi        $v1, $v1, 0xFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $s5
    lhu         $s0, 0x2($v0)
    sll         $a0, $s1, 24
    sra         $a0, $a0, 24
    lbu         $t0, 0x27($sp)
    sll         $a2, $fp, 24
    sra         $a2, $a2, 24
    lhu         $v0, 0x0($s5)
    sll         $a3, $s7, 24
    sra         $a3, $a3, 24
    sw          $s5, 0x14($sp)
    sw          $v1, 0x18($sp)
    sll         $a1, $t0, 24
    sra         $a1, $a1, 24
    lw          $t0, 0x2C($sp)
    addiu       $s0, $s0, 0x2
    sll         $v0, $v0, 1
    addu        $s0, $s0, $v0
    addu        $s0, $s5, $s0
    jal         func_8001E4B0
    sw          $t0, 0x10($sp)
    lbu         $v0, 0x2($s0)
    addu        $s1, $s1, $v0
.L8001EA60:
    addiu       $s2, $s2, 0x1
    lbu         $v1, 0x0($s2)
    bnez        $v1, .L8001E9A8
    andi        $a1, $v1, 0xFF
.L8001EA70:
    andi        $v0, $s4, 0xFFFF
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end ui_menu_tertiary

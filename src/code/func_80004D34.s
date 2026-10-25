.text
.align 2
.set noreorder
.globl func_80004D34
.ent func_80004D34
func_80004D34:
    addiu       $sp, $sp, -0x180
    sw          $ra, 0x17C($sp)
    sw          $fp, 0x178($sp)
    sw          $s7, 0x174($sp)
    sw          $s6, 0x170($sp)
    sw          $s5, 0x16C($sp)
    sw          $s4, 0x168($sp)
    sw          $s3, 0x164($sp)
    sw          $s2, 0x160($sp)
    sw          $s1, 0x15C($sp)
    sw          $s0, 0x158($sp)
    lw          $v0, 0x4($a0)
    lw          $s5, 0x8($a0)
    xori        $v0, $v0, 0x1
    sw          $s5, 0x11C($sp)
    sw          $v0, 0x4($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $v0, 0xC($v0)
    sw          $v0, 0x114($sp)
    lw          $a0, 0x14($a0)
    beqz        $s5, .L80008C60
    sw          $a0, 0x12C($sp)
    addiu       $s6, $v0, 0x3E
    sw          $s6, 0x154($sp)
.L80004D98:
    lw          $s6, 0x12C($sp)
    addiu       $s5, $zero, 0x7
    sw          $s5, 0x124($sp)
    sw          $zero, 0x10($sp)
    sw          $zero, 0x50($sp)
    sw          $zero, 0x14($sp)
    sw          $zero, 0x54($sp)
    sw          $zero, 0x18($sp)
    sw          $zero, 0x58($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x5C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x60($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x64($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x68($sp)
    sw          $zero, 0x2C($sp)
    sw          $zero, 0x6C($sp)
    sw          $zero, 0x30($sp)
    sw          $zero, 0x70($sp)
    sw          $zero, 0x34($sp)
    sw          $zero, 0x74($sp)
    sw          $zero, 0x38($sp)
    sw          $zero, 0x78($sp)
    sw          $zero, 0x3C($sp)
    sw          $zero, 0x7C($sp)
    sw          $zero, 0x40($sp)
    sw          $zero, 0x80($sp)
    sw          $zero, 0x44($sp)
    sw          $zero, 0x84($sp)
    sw          $zero, 0x48($sp)
    sw          $zero, 0x88($sp)
    addiu       $s6, $s6, 0xE0
    sw          $s6, 0x14C($sp)
    sw          $zero, 0x4C($sp)
    sw          $zero, 0x8C($sp)
.L80004E2C:
    lw          $s5, 0x14C($sp)
    lw          $v1, 0x18($s5)
    sltiu       $v0, $v1, 0x10
    beqz        $v0, .L80008A90
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x488($at)
    jr          $v0
    nop
    lw          $s6, 0x14C($sp)
    lw          $v0, 0x18($s6)
    addiu       $v1, $zero, -0x5
    and         $v0, $v0, $v1
    sw          $v0, 0x18($s6)
    lw          $s5, 0x14C($sp)
    lw          $s6, 0x14C($sp)
    lw          $s5, 0x10($s5)
    sw          $s5, 0x134($sp)
    lbu         $v1, 0x1($s5)
    lw          $s6, 0x8($s6)
    lw          $s5, 0x14C($sp)
    sw          $s6, 0x13C($sp)
    lw          $fp, 0xC($s5)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    lui         $s6, 0x8006
    addiu       $s6, $s6, 0x4A04
    addu        $v0, $v0, $s6
    lw          $a2, 0x0($v0)
    lw          $s5, 0x134($sp)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s6
    lw          $s6, 0x134($sp)
    lbu         $s5, 0x0($s5)
    sw          $a2, 0xD4($sp)
    sb          $s5, 0x147($sp)
    lw          $a0, 0x0($v0)
    sw          $a0, 0xD0($sp)
    lbu         $v1, 0x2($s6)
    lui         $s5, 0x8006
    addiu       $s5, $s5, 0x4A04
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $t0, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $t0, 0xDC($sp)
    lw          $a3, 0x0($v0)
    sw          $a3, 0xD8($sp)
    lbu         $v1, 0x3($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $t2, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $t2, 0xE4($sp)
    lw          $t1, 0x0($v0)
    sw          $t1, 0xE0($sp)
    lbu         $v1, 0x4($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $t4, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $t4, 0xEC($sp)
    lw          $t3, 0x0($v0)
    sw          $t3, 0xE8($sp)
    lbu         $v1, 0x5($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $t6, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $t6, 0xF4($sp)
    lw          $t5, 0x0($v0)
    sw          $t5, 0xF0($sp)
    lbu         $v1, 0x6($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $s0, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $s0, 0xFC($sp)
    lw          $t7, 0x0($v0)
    sw          $t7, 0xF8($sp)
    lbu         $v1, 0x7($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $s2, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $s2, 0x104($sp)
    lw          $s1, 0x0($v0)
    sw          $s1, 0x100($sp)
    lbu         $v1, 0x8($s6)
    andi        $v0, $v1, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $s4, 0x0($v0)
    sra         $v0, $v1, 4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    sw          $s4, 0x10C($sp)
    lw          $s3, 0x0($v0)
    lbu         $v0, 0x147($sp)
    srl         $a1, $v0, 4
    srl         $v0, $v0, 2
    andi        $v1, $v0, 0x3
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800050D8
    sw          $s3, 0x108($sp)
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L8000503C
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L80005058
    sllv        $s4, $s4, $a1
    j .L80005B7C
    nop
.L8000503C:
    beql        $v1, $v0, .L80005318
    sll         $v1, $fp, 4
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800056C0
    sll         $v1, $fp, 1
    j .L80005B7C
    nop
.L80005058:
    sw          $s4, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sllv        $v1, $a0, $a1
    sw          $v1, 0x90($sp)
    sllv        $v1, $a2, $a1
    sw          $v1, 0x94($sp)
    sllv        $v1, $a3, $a1
    sw          $v1, 0x98($sp)
    sllv        $v1, $t0, $a1
    sw          $v1, 0x9C($sp)
    sllv        $v1, $t1, $a1
    sw          $v1, 0xA0($sp)
    sllv        $v1, $t2, $a1
    sw          $v1, 0xA4($sp)
    sllv        $v1, $t3, $a1
    sw          $v1, 0xA8($sp)
    sllv        $v1, $t4, $a1
    sw          $v1, 0xAC($sp)
    sllv        $v1, $t5, $a1
    sw          $v1, 0xB0($sp)
    sllv        $v1, $t6, $a1
    sw          $v1, 0xB4($sp)
    sllv        $v1, $t7, $a1
    sw          $v1, 0xB8($sp)
    sllv        $v1, $s0, $a1
    sw          $v1, 0xBC($sp)
    sllv        $v1, $s1, $a1
    sw          $v1, 0xC0($sp)
    sllv        $v1, $s2, $a1
    sllv        $fp, $s3, $a1
    j .L8000530C
    sw          $v1, 0xC4($sp)
.L800050D8:
    lw          $s5, 0x13C($sp)
    sllv        $v1, $a0, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0x90($sp)
    sllv        $v1, $a2, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0x94($sp)
    sllv        $v1, $a3, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0x98($sp)
    sllv        $v1, $t0, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0x9C($sp)
    sllv        $v1, $t1, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0xA0($sp)
    sllv        $v1, $t2, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0xA4($sp)
    sllv        $v1, $t3, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0xA8($sp)
    sllv        $v1, $t4, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0xAC($sp)
    sllv        $v1, $t5, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0xB0($sp)
    sllv        $v1, $t6, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0xB4($sp)
    sllv        $v1, $t7, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0xB8($sp)
    sllv        $v1, $s0, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sw          $v1, 0xBC($sp)
    sllv        $v1, $s1, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
    sw          $v1, 0xC0($sp)
    sllv        $v1, $s2, $a1
    sll         $v0, $s6, 4
    subu        $v0, $v0, $s6
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s5, 0x13C($sp)
    sllv        $v1, $s3, $a1
    sll         $v0, $s5, 4
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    addu        $fp, $v1, $v0
    sllv        $v1, $s4, $a1
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 4
    sra         $v0, $v0, 8
    sw          $s5, 0xC4($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x13C($sp)
    lw          $s6, 0x13C($sp)
.L8000530C:
    sw          $fp, 0xC8($sp)
    j .L80005B7C
    sw          $s6, 0xCC($sp)
.L80005318:
    subu        $v1, $v1, $fp
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x90($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x94($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x98($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t1, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x9C($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t4, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA8($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t5, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xAC($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t6, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t7, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB8($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s1, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xBC($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xC0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xC4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 4
    subu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s4, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 4
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    j .L80005B64
    sll         $v0, $v0, 3
.L800056C0:
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x90($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $a3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x94($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x98($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t1, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0x9C($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t4, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xA8($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t5, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xAC($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t6, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $t7, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s0, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xB8($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s1, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xBC($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s2, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xC0($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s3, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xC4($sp)
    addu        $a0, $a0, $v0
    sll         $v1, $fp, 1
    addu        $v1, $v1, $fp
    sll         $v1, $v1, 2
    addu        $v1, $v1, $fp
    sw          $a0, 0x13C($sp)
    lw          $fp, 0x13C($sp)
    sllv        $a0, $s4, $a1
    sll         $v1, $v1, 4
    sll         $v0, $fp, 3
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    sll         $v0, $v0, 2
    subu        $v0, $v0, $fp
    sll         $v0, $v0, 2
.L80005B64:
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 8
    sw          $fp, 0xC8($sp)
    addu        $a0, $a0, $v0
    sw          $a0, 0x13C($sp)
    sw          $a0, 0xCC($sp)
.L80005B7C:
    lw          $s5, 0x14C($sp)
    lw          $v0, 0x0($s5)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0xF
    beqz        $v0, .L800072B0
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x4C8($at)
    jr          $v0
    nop
    lw          $v0, 0x10($sp)
    lw          $t6, 0x90($sp)
    lw          $v1, 0x14($sp)
    lw          $t7, 0x94($sp)
    lw          $a0, 0x18($sp)
    lw          $s0, 0x98($sp)
    lw          $a1, 0x1C($sp)
    lw          $s1, 0x9C($sp)
    lw          $a2, 0x20($sp)
    lw          $s2, 0xA0($sp)
    lw          $a3, 0x24($sp)
    lw          $s3, 0xA4($sp)
    lw          $t0, 0x28($sp)
    lw          $s4, 0xA8($sp)
    lw          $t1, 0x2C($sp)
    lw          $s5, 0xAC($sp)
    lw          $t2, 0x30($sp)
    lw          $s6, 0xB0($sp)
    lw          $t3, 0x34($sp)
    lw          $s7, 0xB4($sp)
    lw          $t4, 0x38($sp)
    lw          $t8, 0xB8($sp)
    lw          $t5, 0x3C($sp)
    lw          $t9, 0xBC($sp)
    addu        $v0, $v0, $t6
    addu        $v1, $v1, $t7
    addu        $a0, $a0, $s0
    addu        $a1, $a1, $s1
    addu        $a2, $a2, $s2
    addu        $a3, $a3, $s3
    addu        $t0, $t0, $s4
    addu        $t1, $t1, $s5
    addu        $t2, $t2, $s6
    addu        $t3, $t3, $s7
    addu        $t4, $t4, $t8
    addu        $t5, $t5, $t9
    sw          $v0, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $a0, 0x18($sp)
    sw          $a1, 0x1C($sp)
    sw          $a2, 0x20($sp)
    sw          $a3, 0x24($sp)
    sw          $t0, 0x28($sp)
    sw          $t1, 0x2C($sp)
    sw          $t2, 0x30($sp)
    sw          $t3, 0x34($sp)
    sw          $t4, 0x38($sp)
    sw          $t5, 0x3C($sp)
    lw          $v0, 0x40($sp)
    lw          $a2, 0xC0($sp)
    lw          $v1, 0x44($sp)
    lw          $a3, 0xC4($sp)
    lw          $a0, 0x48($sp)
    lw          $t0, 0xC8($sp)
    lw          $a1, 0x4C($sp)
    lw          $t1, 0xCC($sp)
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $a3
    addu        $a0, $a0, $t0
    addu        $a1, $a1, $t1
    sw          $v0, 0x40($sp)
    sw          $v1, 0x44($sp)
    sw          $a0, 0x48($sp)
    j .L800072B0
    sw          $a1, 0x4C($sp)
    lw          $v0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x14($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x14($sp)
    lw          $a1, 0x1C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x1C($sp)
    lw          $a1, 0x24($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x24($sp)
    lw          $a1, 0x2C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x2C($sp)
    lw          $a1, 0x34($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x34($sp)
    lw          $a1, 0x3C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x38($sp)
    sw          $a1, 0x3C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x44($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x44($sp)
    lw          $a1, 0x4C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    j .L8000667C
    sll         $a0, $a0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    sll         $v0, $a0, 1
    j .L800072A8
    addu        $v0, $v0, $a0
    lw          $v0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x14($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x14($sp)
    lw          $a1, 0x1C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x1C($sp)
    lw          $a1, 0x24($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x24($sp)
    lw          $a1, 0x2C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x2C($sp)
    lw          $a1, 0x34($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x34($sp)
    lw          $a1, 0x3C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x38($sp)
    sw          $a1, 0x3C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x44($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x44($sp)
    lw          $a1, 0x4C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    j .L8000667C
    sll         $a0, $a0, 2
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    sll         $v0, $a0, 2
    j .L800072A8
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    addu        $v0, $v0, $a0
    j .L800072A8
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $a1, 3
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $a2, 3
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xCC($sp)
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $a2, 3
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    j .L800072A4
    sll         $v0, $a0, 3
    lw          $v0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x14($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x14($sp)
    lw          $a1, 0x1C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x1C($sp)
    lw          $a1, 0x24($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x24($sp)
    lw          $a1, 0x2C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x2C($sp)
    lw          $a1, 0x34($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x34($sp)
    lw          $a1, 0x3C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x38($sp)
    sw          $a1, 0x3C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x44($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x44($sp)
    lw          $a1, 0x4C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 3
.L8000667C:
    addu        $a1, $a1, $a0
    sw          $v1, 0x48($sp)
    j .L800072B0
    sw          $a1, 0x4C($sp)
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $a1, 3
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    sll         $v0, $a0, 3
    j .L800072A8
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    addu        $v0, $v0, $a0
    j .L800072A8
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    subu        $v0, $v0, $a1
    lw          $a0, 0xCC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    j .L800072A4
    sll         $v0, $v0, 2
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    addu        $v0, $v0, $a0
    j .L800072A8
    sll         $v0, $v0, 2
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    addu        $v0, $v0, $a1
    lw          $a0, 0xCC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    sll         $v0, $v0, 2
    j .L800072A8
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    lw          $v1, 0x10($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    lw          $v1, 0x40($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    subu        $v0, $v0, $a0
    j .L800072A8
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x10($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x10($sp)
    lw          $v1, 0x14($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x14($sp)
    lw          $v1, 0x18($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x18($sp)
    lw          $v1, 0x1C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x1C($sp)
    lw          $v1, 0x20($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x20($sp)
    lw          $v1, 0x24($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x24($sp)
    lw          $v1, 0x28($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x28($sp)
    lw          $v1, 0x2C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x2C($sp)
    lw          $v1, 0x30($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    lw          $v1, 0x34($sp)
    sll         $v0, $a1, 4
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x34($sp)
    lw          $v1, 0x38($sp)
    sll         $v0, $a2, 4
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x38($sp)
    lw          $v1, 0x3C($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x40($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x40($sp)
    lw          $v1, 0x44($sp)
    lw          $a0, 0xCC($sp)
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x44($sp)
    lw          $v1, 0x48($sp)
    sll         $v0, $a2, 4
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x48($sp)
    lw          $v1, 0x4C($sp)
    sll         $v0, $a0, 4
.L800072A4:
    subu        $v0, $v0, $a0
.L800072A8:
    addu        $v1, $v1, $v0
    sw          $v1, 0x4C($sp)
.L800072B0:
    lw          $s6, 0x14C($sp)
    lw          $v0, 0x4($s6)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0xF
    beqz        $v0, .L800089E4
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x508($at)
    jr          $v0
    nop
    lw          $v0, 0x50($sp)
    lw          $t6, 0x90($sp)
    lw          $v1, 0x54($sp)
    lw          $t7, 0x94($sp)
    lw          $a0, 0x58($sp)
    lw          $s0, 0x98($sp)
    lw          $a1, 0x5C($sp)
    lw          $s1, 0x9C($sp)
    lw          $a2, 0x60($sp)
    lw          $s2, 0xA0($sp)
    lw          $a3, 0x64($sp)
    lw          $s3, 0xA4($sp)
    lw          $t0, 0x68($sp)
    lw          $s4, 0xA8($sp)
    lw          $t1, 0x6C($sp)
    lw          $s5, 0xAC($sp)
    lw          $t2, 0x70($sp)
    lw          $s6, 0xB0($sp)
    lw          $t3, 0x74($sp)
    lw          $s7, 0xB4($sp)
    lw          $t4, 0x78($sp)
    lw          $t8, 0xB8($sp)
    lw          $t5, 0x7C($sp)
    lw          $t9, 0xBC($sp)
    addu        $v0, $v0, $t6
    addu        $v1, $v1, $t7
    addu        $a0, $a0, $s0
    addu        $a1, $a1, $s1
    addu        $a2, $a2, $s2
    addu        $a3, $a3, $s3
    addu        $t0, $t0, $s4
    addu        $t1, $t1, $s5
    addu        $t2, $t2, $s6
    addu        $t3, $t3, $s7
    addu        $t4, $t4, $t8
    addu        $t5, $t5, $t9
    sw          $v0, 0x50($sp)
    sw          $v1, 0x54($sp)
    sw          $a0, 0x58($sp)
    sw          $a1, 0x5C($sp)
    sw          $a2, 0x60($sp)
    sw          $a3, 0x64($sp)
    sw          $t0, 0x68($sp)
    sw          $t1, 0x6C($sp)
    sw          $t2, 0x70($sp)
    sw          $t3, 0x74($sp)
    sw          $t4, 0x78($sp)
    sw          $t5, 0x7C($sp)
    lw          $v0, 0x80($sp)
    lw          $a2, 0xC0($sp)
    lw          $v1, 0x84($sp)
    lw          $a3, 0xC4($sp)
    lw          $a0, 0x88($sp)
    lw          $t0, 0xC8($sp)
    lw          $a1, 0x8C($sp)
    lw          $t1, 0xCC($sp)
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $a3
    addu        $a0, $a0, $t0
    addu        $a1, $a1, $t1
    sw          $v0, 0x80($sp)
    sw          $v1, 0x84($sp)
    sw          $a0, 0x88($sp)
    j .L800089E4
    sw          $a1, 0x8C($sp)
    lw          $v0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x54($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x54($sp)
    lw          $a1, 0x5C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x5C($sp)
    lw          $a1, 0x64($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x64($sp)
    lw          $a1, 0x6C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x6C($sp)
    lw          $a1, 0x74($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x74($sp)
    lw          $a1, 0x7C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x78($sp)
    sw          $a1, 0x7C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x84($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 1
    addu        $a1, $a1, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x84($sp)
    lw          $a1, 0x8C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    j .L80007DB0
    sll         $a0, $a0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    sll         $v0, $a0, 1
    j .L800089DC
    addu        $v0, $v0, $a0
    lw          $v0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x54($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x54($sp)
    lw          $a1, 0x5C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x5C($sp)
    lw          $a1, 0x64($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x64($sp)
    lw          $a1, 0x6C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x6C($sp)
    lw          $a1, 0x74($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x74($sp)
    lw          $a1, 0x7C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x78($sp)
    sw          $a1, 0x7C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x84($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 2
    addu        $a1, $a1, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x84($sp)
    lw          $a1, 0x8C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    j .L80007DB0
    sll         $a0, $a0, 2
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 2
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    sll         $v0, $a0, 2
    j .L800089DC
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    addu        $v0, $v0, $a0
    j .L800089DC
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $a1, 3
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $a2, 3
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xCC($sp)
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $a2, 3
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    j .L800089D8
    sll         $v0, $a0, 3
    lw          $v0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    lw          $a1, 0x54($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0x98($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sw          $a1, 0x54($sp)
    lw          $a1, 0x5C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xA0($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sw          $a1, 0x5C($sp)
    lw          $a1, 0x64($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xA8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sw          $a1, 0x64($sp)
    lw          $a1, 0x6C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xB0($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sw          $a1, 0x6C($sp)
    lw          $a1, 0x74($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xB8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sw          $a1, 0x74($sp)
    lw          $a1, 0x7C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x78($sp)
    sw          $a1, 0x7C($sp)
    lw          $v0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    lw          $a1, 0x84($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0xC8($sp)
    sll         $a0, $a0, 3
    addu        $a1, $a1, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sw          $a1, 0x84($sp)
    lw          $a1, 0x8C($sp)
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    sll         $a0, $a0, 3
.L80007DB0:
    addu        $a1, $a1, $a0
    sw          $v1, 0x88($sp)
    j .L800089E4
    sw          $a1, 0x8C($sp)
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $a1, 3
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 3
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 3
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xCC($sp)
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    sll         $v0, $a0, 3
    j .L800089DC
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    addu        $v0, $v0, $a0
    j .L800089DC
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    subu        $v0, $v0, $a1
    lw          $a0, 0xCC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    j .L800089D8
    sll         $v0, $v0, 2
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    addu        $v0, $v0, $a0
    j .L800089DC
    sll         $v0, $v0, 2
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    addu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    addu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    addu        $v0, $v0, $a1
    lw          $a0, 0xCC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    sll         $v0, $v0, 2
    j .L800089DC
    addu        $v0, $v0, $a0
    lw          $v1, 0x90($sp)
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    lw          $v1, 0x50($sp)
    lw          $a0, 0x94($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    lw          $a0, 0x9C($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    lw          $a0, 0xA0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    lw          $a0, 0xA4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    lw          $a0, 0xA8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    lw          $a0, 0xAC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    lw          $a0, 0xB0($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    lw          $a0, 0xB4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    lw          $a0, 0xB8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    lw          $a0, 0xBC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $v1, 0xC0($sp)
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    lw          $v1, 0x80($sp)
    lw          $a0, 0xC4($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xC8($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    subu        $v0, $v0, $a0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    lw          $a0, 0xCC($sp)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 3
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    subu        $v0, $v0, $a0
    j .L800089DC
    sll         $v0, $v0, 1
    lw          $a0, 0x90($sp)
    lw          $v1, 0x50($sp)
    lw          $a1, 0x94($sp)
    lw          $a2, 0xB8($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x50($sp)
    lw          $v1, 0x54($sp)
    lw          $a0, 0x98($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0x9C($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x54($sp)
    lw          $v1, 0x58($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x58($sp)
    lw          $v1, 0x5C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xA4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x5C($sp)
    lw          $v1, 0x60($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xA8($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x60($sp)
    lw          $v1, 0x64($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xAC($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x64($sp)
    lw          $v1, 0x68($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xB0($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x68($sp)
    lw          $v1, 0x6C($sp)
    subu        $v0, $v0, $a1
    lw          $a1, 0xB4($sp)
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 4
    sw          $v1, 0x6C($sp)
    lw          $v1, 0x70($sp)
    subu        $v0, $v0, $a0
    lw          $a0, 0xBC($sp)
    addu        $v1, $v1, $v0
    sw          $v1, 0x70($sp)
    lw          $v1, 0x74($sp)
    sll         $v0, $a1, 4
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x74($sp)
    lw          $v1, 0x78($sp)
    sll         $v0, $a2, 4
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x78($sp)
    lw          $v1, 0x7C($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v1, 0x7C($sp)
    lw          $a0, 0xC0($sp)
    lw          $v1, 0x80($sp)
    lw          $a1, 0xC4($sp)
    lw          $a2, 0xC8($sp)
    sll         $v0, $a0, 4
    subu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sll         $v0, $a1, 4
    sw          $v1, 0x80($sp)
    lw          $v1, 0x84($sp)
    lw          $a0, 0xCC($sp)
    subu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    sw          $v1, 0x84($sp)
    lw          $v1, 0x88($sp)
    sll         $v0, $a2, 4
    subu        $v0, $v0, $a2
    addu        $v1, $v1, $v0
    sw          $v1, 0x88($sp)
    lw          $v1, 0x8C($sp)
    sll         $v0, $a0, 4
.L800089D8:
    subu        $v0, $v0, $a0
.L800089DC:
    addu        $v1, $v1, $v0
    sw          $v1, 0x8C($sp)
.L800089E4:
    lw          $s5, 0x134($sp)
    lw          $s6, 0x14C($sp)
    addiu       $v0, $s5, 0x9
    sw          $v0, 0x10($s6)
    lbu         $s5, 0x147($sp)
    andi        $v0, $s5, 0x3
    beqz        $v0, .L80008A44
    andi        $v0, $s5, 0x2
    beqz        $v0, .L80008A30
    addiu       $v0, $zero, -0xC
    lw          $v0, 0x14($s6)
    lw          $v1, 0x1C($s6)
    beqz        $v1, .L80008A44
    sw          $v0, 0x10($s6)
    lw          $a0, 0x14C($sp)
    jalr        $v1
    nop
    j .L80008A44
    nop
.L80008A30:
    lw          $s6, 0x14C($sp)
    lw          $v1, 0x18($s6)
    sw          $zero, 0x1C($s6)
    and         $v1, $v1, $v0
    sw          $v1, 0x18($s6)
.L80008A44:
    lw          $s6, 0x13C($sp)
    lw          $s5, 0x14C($sp)
    sw          $s6, 0x8($s5)
    j .L80008A8C
    sw          $fp, 0xC($s5)
    lw          $s5, 0x14C($sp)
    lw          $v0, 0x18($s5)
    addiu       $v1, $zero, -0x5
    and         $v0, $v0, $v1
    ori         $v0, $v0, 0x1
    j .L80008A8C
    sw          $v0, 0x18($s5)
    lw          $s6, 0x14C($sp)
    lw          $v1, 0x18($s6)
    addiu       $v0, $zero, -0xC
    sw          $zero, 0x1C($s6)
    and         $v1, $v1, $v0
    sw          $v1, 0x18($s6)
.L80008A8C:
    lw          $s5, 0x14C($sp)
.L80008A90:
    lw          $v0, 0x124($sp)
    addiu       $s5, $s5, -0x20
    addu        $s6, $v0, $zero
    addiu       $s6, $s6, -0x1
    sw          $s5, 0x14C($sp)
    bnez        $v0, .L80004E2C
    sw          $s6, 0x124($sp)
    lw          $v0, 0x10($sp)
    lw          $s5, 0x114($sp)
    sra         $v0, $v0, 5
    sh          $v0, 0x0($s5)
    lw          $v0, 0x50($sp)
    lw          $s6, 0x154($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x3C($s6)
    lw          $v0, 0x14($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x3A($s6)
    lw          $v0, 0x54($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x38($s6)
    lw          $v0, 0x18($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x36($s6)
    lw          $v0, 0x58($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x34($s6)
    lw          $v0, 0x1C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x32($s6)
    lw          $v0, 0x5C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x30($s6)
    lw          $v0, 0x20($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x2E($s6)
    lw          $v0, 0x60($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x2C($s6)
    lw          $v0, 0x24($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x2A($s6)
    lw          $v0, 0x64($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x28($s6)
    lw          $v0, 0x28($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x26($s6)
    lw          $v0, 0x68($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x24($s6)
    lw          $v0, 0x2C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x22($s6)
    lw          $v0, 0x6C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x20($s6)
    lw          $v0, 0x30($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x1E($s6)
    lw          $v0, 0x70($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x1C($s6)
    lw          $v0, 0x34($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x1A($s6)
    lw          $v0, 0x74($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x18($s6)
    lw          $v0, 0x38($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x16($s6)
    lw          $v0, 0x78($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x14($s6)
    lw          $v0, 0x3C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x12($s6)
    lw          $v0, 0x7C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x10($s6)
    lw          $v0, 0x40($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0xE($s6)
    lw          $v0, 0x80($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0xC($s6)
    lw          $v0, 0x44($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0xA($s6)
    lw          $v0, 0x84($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x8($s6)
    lw          $v0, 0x48($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x6($s6)
    lw          $v0, 0x88($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x4($s6)
    lw          $v0, 0x4C($sp)
    sra         $v0, $v0, 5
    sh          $v0, -0x2($s6)
    lw          $s5, 0x11C($sp)
    lw          $s6, 0x114($sp)
    lw          $v0, 0x8C($sp)
    addiu       $s5, $s5, -0x10
    addiu       $s6, $s6, 0x40
    sw          $s5, 0x11C($sp)
    sw          $s6, 0x114($sp)
    lw          $s5, 0x154($sp)
    sra         $v0, $v0, 5
    sh          $v0, 0x0($s5)
    lw          $s6, 0x11C($sp)
    addiu       $s5, $s5, 0x40
    bnez        $s6, .L80004D98
    sw          $s5, 0x154($sp)
.L80008C60:
    lw          $ra, 0x17C($sp)
    lw          $fp, 0x178($sp)
    lw          $s7, 0x174($sp)
    lw          $s6, 0x170($sp)
    lw          $s5, 0x16C($sp)
    lw          $s4, 0x168($sp)
    lw          $s3, 0x164($sp)
    lw          $s2, 0x160($sp)
    lw          $s1, 0x15C($sp)
    lw          $s0, 0x158($sp)
    addiu       $sp, $sp, 0x180
    jr          $ra
    nop
.end func_80004D34

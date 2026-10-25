.text
.align 2
.set noreorder
.globl ui_text_layout_reverse
.ent ui_text_layout_reverse
ui_text_layout_reverse:
    addiu       $sp, $sp, -0x78
    sw          $s1, 0x54($sp)
    addu        $s1, $a3, $zero
    sw          $a1, 0x24($sp)
    lw          $a1, 0x24($sp)
    lw          $a3, 0x8C($sp)
    sw          $s0, 0x50($sp)
    addu        $s0, $a0, $zero
    sw          $a2, 0x2C($sp)
    addu        $a2, $s1, $zero
    sw          $ra, 0x74($sp)
    sw          $fp, 0x70($sp)
    sw          $s7, 0x6C($sp)
    sw          $s6, 0x68($sp)
    sw          $s5, 0x64($sp)
    sw          $s4, 0x60($sp)
    sw          $s3, 0x5C($sp)
    jal         func_8001D088
    sw          $s2, 0x58($sp)
    lw          $v0, 0x8($s0)
    lhu         $t0, 0x1A($v0)
    sh          $t0, 0x36($sp)
    lhu         $v0, 0x1C($v0)
    addiu       $s1, $s1, 0x1
    addu        $a0, $s1, $zero
    jal         func_8004DF94
    sh          $v0, 0x3E($sp)
    addiu       $v0, $v0, 0x1
    addu        $s1, $s1, $v0
    sw          $s1, 0x44($sp)
    addiu       $s1, $s1, 0xB
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, -0x7B30
    addiu       $a2, $zero, 0x16
    jal         func_80033308
    addu        $a3, $zero, $zero
    lbu         $v1, 0x0($s1)
    addiu       $v0, $zero, 0x90
    andi        $a0, $v1, 0xFF
    bne         $a0, $v0, .L8001E064
    sw          $zero, 0x4C($sp)
    lbu         $v0, 0x1($s1)
    lbu         $v1, 0x2($s1)
    lbu         $a0, 0x3($s1)
    sll         $v0, $v0, 16
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $v0, $v0, $a0
    j .L8001E10C
    sw          $v0, 0x4C($sp)
.L8001E064:
    andi        $v0, $v1, 0x80
    beqz        $v0, .L8001E0B0
    andi        $v0, $v1, 0xF
    beqz        $v0, .L8001E10C
    addiu       $s5, $v0, -0x1
    addiu       $a0, $zero, 0x1
.L8001E07C:
    addiu       $s1, $s1, 0x1
    lbu         $v0, 0x0($s1)
    addu        $v1, $s5, $zero
    andi        $v1, $v1, 0xFF
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $a0, -0x7B30($at)
    bnez        $v1, .L8001E07C
    addiu       $s5, $s5, -0x1
    j .L8001E10C
    nop
.L8001E0B0:
    beqz        $a0, .L8001E10C
    addu        $s0, $v1, $zero
    sll         $s0, $s0, 3
    andi        $v0, $s0, 0xFF
    beqz        $v0, .L8001E10C
    addiu       $a0, $zero, 0x2
    andi        $v0, $s0, 0x80
.L8001E0CC:
    beqz        $v0, .L8001E100
    sll         $s0, $s0, 1
    addiu       $s1, $s1, 0x1
    lbu         $v1, 0x0($s1)
    addiu       $s1, $s1, 0x1
    lbu         $v0, 0x0($s1)
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $v1, $v1, 0xF000
    srl         $v1, $v1, 11
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $a0, -0x7B30($at)
.L8001E100:
    andi        $v0, $s0, 0xFF
    bnez        $v0, .L8001E0CC
    andi        $v0, $s0, 0x80
.L8001E10C:
    lhu         $t0, 0x36($sp)
    sll         $fp, $t0, 24
    lw          $t0, 0x2C($sp)
    lbu         $v0, 0x16($t0)
    lhu         $t0, 0x3E($sp)
    sll         $s7, $t0, 24
    lw          $t0, 0x2C($sp)
    lw          $s1, 0x44($sp)
    addu        $s5, $zero, $zero
    lbu         $v1, 0x17($t0)
    sll         $v0, $v0, 16
    lbu         $a0, 0x18($t0)
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $s6, $v0, $a0
.L8001E148:
    lw          $t0, 0x2C($sp)
    andi        $a0, $s5, 0xFF
    lbu         $s3, 0x0($s1)
    addu        $v0, $t0, $a0
    lbu         $v1, 0x0($v0)
    lbu         $s2, 0x1($v0)
    addiu       $v0, $zero, 0x63
    subu        $s4, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, -0x7B30($at)
    andi        $v0, $s2, 0x3F
    beqz        $v1, .L8001E188
    addiu       $s2, $v0, 0x9
    j .L8001E18C
    addiu       $s0, $zero, 0x1
.L8001E188:
    andi        $s0, $s6, 0x3
.L8001E18C:
    andi        $v1, $s3, 0xFF
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L8001E1CC
    sll         $a0, $s4, 24
    sra         $a0, $a0, 24
    sll         $a1, $s2, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x88($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s3, 0xFFFF
    sw          $v0, 0x18($sp)
    jal         func_8001D4D4
    sw          $t0, 0x14($sp)
.L8001E1CC:
    sll         $a0, $s4, 24
    sra         $a0, $a0, 24
    sll         $a1, $s2, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x8C($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s0, 0xFF
    sw          $v0, 0x18($sp)
    jal         func_8001E668
    sw          $t0, 0x14($sp)
    addiu       $s1, $s1, 0x1
    addiu       $s5, $s5, 0x2
    andi        $v0, $s5, 0xFF
    sltiu       $v0, $v0, 0x16
    bnez        $v0, .L8001E148
    srl         $s6, $s6, 2
    lhu         $t0, 0x36($sp)
    sll         $fp, $t0, 24
    lw          $t0, 0x2C($sp)
    lbu         $v0, 0x16($t0)
    lhu         $t0, 0x3E($sp)
    sll         $s7, $t0, 24
    lw          $t0, 0x2C($sp)
    lw          $s1, 0x44($sp)
    addu        $s5, $zero, $zero
    lbu         $v1, 0x17($t0)
    sll         $v0, $v0, 16
    lbu         $a0, 0x18($t0)
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $s6, $v0, $a0
.L8001E254:
    lw          $t0, 0x2C($sp)
    andi        $v0, $s5, 0xFF
    addu        $v0, $t0, $v0
    lbu         $v1, 0x0($v0)
    lbu         $s2, 0x1($v0)
    addiu       $v0, $zero, 0x61
    addu        $t0, $zero, $zero
    beqz        $t0, .L8001E284
    subu        $s4, $v0, $v1
    lw          $t0, 0x4C($sp)
    j .L8001E28C
    andi        $v0, $t0, 0x3
.L8001E284:
    sll         $v0, $s2, 24
    srl         $v0, $v0, 30
.L8001E28C:
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
    andi        $v0, $s2, 0x3F
    addiu       $s2, $v0, 0x7
    andi        $v0, $s5, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, -0x7B30($at)
    lbu         $s3, 0x0($s1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8001E2C8
    addiu       $v0, $zero, 0x2
    j .L8001E2DC
    addiu       $s0, $zero, 0x1
.L8001E2C8:
    bne         $v1, $v0, .L8001E2DC
    andi        $s0, $s6, 0x3
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
.L8001E2DC:
    andi        $v1, $s3, 0xFF
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L8001E31C
    sll         $a0, $s4, 24
    sra         $a0, $a0, 24
    sll         $a1, $s2, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x88($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s3, 0xFFFF
    sw          $v0, 0x18($sp)
    jal         func_8001D4D4
    sw          $t0, 0x14($sp)
.L8001E31C:
    sll         $a0, $s4, 24
    sra         $a0, $a0, 24
    sll         $a1, $s2, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x8C($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s0, 0xFF
    sw          $v0, 0x18($sp)
    jal         func_8001E668
    sw          $t0, 0x14($sp)
    addiu       $s1, $s1, 0x1
    srl         $s6, $s6, 2
    lw          $t0, 0x4C($sp)
    addiu       $s5, $s5, 0x2
    andi        $v0, $s5, 0xFF
    sltiu       $v0, $v0, 0x16
    srl         $t0, $t0, 2
    bnez        $v0, .L8001E254
    sw          $t0, 0x4C($sp)
    lbu         $v1, 0x0($s1)
    andi        $v0, $v1, 0x80
    bnez        $v0, .L8001E47C
    addu        $s0, $v1, $zero
    beqz        $s0, .L8001E47C
    sll         $s0, $s0, 3
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
    andi        $v0, $s0, 0xFF
    beqz        $v0, .L8001E47C
    addiu       $s3, $zero, 0x8
    addiu       $s5, $zero, -0x40
.L8001E3A8:
    andi        $v0, $s0, 0x80
    beql        $v0, $zero, .L8001E470
    sll         $s0, $s0, 1
    addiu       $s1, $s1, 0x1
    lbu         $v1, 0x0($s1)
    addiu       $s1, $s1, 0x1
    lbu         $v0, 0x0($s1)
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $a1, $v1, 0x3F
    addu        $s2, $a1, $zero
    srl         $a0, $v1, 6
    andi        $a2, $a0, 0x3F
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001E3EC
    addu        $s4, $a2, $zero
    or          $s2, $a1, $s5
.L8001E3EC:
    andi        $v0, $a0, 0x20
    bnel        $v0, $zero, .L8001E3F8
    or          $s4, $a2, $s5
.L8001E3F8:
    lhu         $t0, 0x36($sp)
    andi        $v1, $v1, 0xF000
    sll         $a2, $t0, 24
    lw          $t0, 0x2C($sp)
    srl         $v1, $v1, 11
    addiu       $a0, $zero, 0x5F
    addu        $v0, $t0, $v1
    lbu         $v1, 0x0($v0)
    lbu         $a1, 0x1($v0)
    lhu         $t0, 0x3E($sp)
    sra         $a2, $a2, 24
    andi        $v0, $s3, 0xFFFF
    sw          $v0, 0x18($sp)
    sll         $a3, $t0, 24
    sra         $a3, $a3, 24
    lw          $t0, 0x24($sp)
    subu        $a0, $a0, $v1
    subu        $a0, $a0, $s4
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    andi        $a1, $a1, 0x3F
    addiu       $a1, $a1, 0x7
    addu        $a1, $s2, $a1
    sw          $t0, 0x10($sp)
    lw          $t0, 0x8C($sp)
    sll         $a1, $a1, 24
    sra         $a1, $a1, 24
    jal         func_8001E4B0
    sw          $t0, 0x14($sp)
    sll         $s0, $s0, 1
.L8001E470:
    andi        $v0, $s0, 0xFF
    bnez        $v0, .L8001E3A8
    addiu       $s3, $s3, -0x1
.L8001E47C:
    lw          $ra, 0x74($sp)
    lw          $fp, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end ui_text_layout_reverse

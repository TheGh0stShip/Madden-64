.text
.align 2
.set noreorder
.globl ui_text_layout_forward
.ent ui_text_layout_forward
ui_text_layout_forward:
    addiu       $sp, $sp, -0x80
    sw          $s1, 0x5C($sp)
    addu        $s1, $a3, $zero
    sw          $a1, 0x24($sp)
    lw          $a1, 0x24($sp)
    lw          $a3, 0x94($sp)
    sw          $s0, 0x58($sp)
    addu        $s0, $a0, $zero
    sw          $a2, 0x2C($sp)
    addu        $a2, $s1, $zero
    sw          $ra, 0x7C($sp)
    sw          $fp, 0x78($sp)
    sw          $s7, 0x74($sp)
    sw          $s6, 0x70($sp)
    sw          $s5, 0x6C($sp)
    sw          $s4, 0x68($sp)
    sw          $s3, 0x64($sp)
    jal         func_8001D088
    sw          $s2, 0x60($sp)
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
    addiu       $a1, $a1, -0x7B48
    addiu       $a2, $zero, 0x16
    jal         func_80033308
    addu        $a3, $zero, $zero
    lbu         $v1, 0x0($s1)
    addiu       $v0, $zero, 0x90
    sw          $zero, 0x4C($sp)
    andi        $a0, $v1, 0xFF
    bne         $a0, $v0, .L8001DB68
    sw          $zero, 0x54($sp)
    lbu         $v0, 0x1($s1)
    addiu       $t0, $zero, 0x1
    sw          $t0, 0x54($sp)
    lbu         $v1, 0x2($s1)
    lbu         $a0, 0x3($s1)
    sll         $v0, $v0, 16
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $v0, $v0, $a0
    j .L8001DC10
    sw          $v0, 0x4C($sp)
.L8001DB68:
    andi        $v0, $v1, 0x80
    beqz        $v0, .L8001DBB4
    andi        $v0, $v1, 0xF
    beqz        $v0, .L8001DC10
    addiu       $s4, $v0, -0x1
    addiu       $a0, $zero, 0x1
.L8001DB80:
    addiu       $s1, $s1, 0x1
    lbu         $v0, 0x0($s1)
    addu        $v1, $s4, $zero
    andi        $v1, $v1, 0xFF
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $a0, -0x7B48($at)
    bnez        $v1, .L8001DB80
    addiu       $s4, $s4, -0x1
    j .L8001DC10
    nop
.L8001DBB4:
    beqz        $a0, .L8001DC10
    addu        $s0, $v1, $zero
    sll         $s0, $s0, 3
    andi        $v0, $s0, 0xFF
    beqz        $v0, .L8001DC10
    addiu       $a0, $zero, 0x2
    andi        $v0, $s0, 0x80
.L8001DBD0:
    beqz        $v0, .L8001DC04
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
    sb          $a0, -0x7B48($at)
.L8001DC04:
    andi        $v0, $s0, 0xFF
    bnez        $v0, .L8001DBD0
    andi        $v0, $s0, 0x80
.L8001DC10:
    lhu         $t0, 0x36($sp)
    sll         $fp, $t0, 24
    lw          $t0, 0x2C($sp)
    lbu         $v0, 0x16($t0)
    lhu         $t0, 0x3E($sp)
    sll         $s7, $t0, 24
    lw          $t0, 0x2C($sp)
    lw          $s1, 0x44($sp)
    addu        $s4, $zero, $zero
    lbu         $v1, 0x17($t0)
    sll         $v0, $v0, 16
    lbu         $a0, 0x18($t0)
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $s6, $v0, $a0
.L8001DC4C:
    lw          $t0, 0x2C($sp)
    andi        $s0, $s4, 0xFF
    lbu         $s2, 0x0($s1)
    addu        $v0, $t0, $s0
    lbu         $v1, 0x1($v0)
    lbu         $s5, 0x0($v0)
    addiu       $v0, $zero, 0xFF
    andi        $v1, $v1, 0x3F
    addiu       $a1, $v1, 0x9
    addu        $v1, $s2, $zero
    beq         $v1, $v0, .L8001DCA4
    addu        $s3, $a1, $zero
    lw          $t0, 0x24($sp)
    sll         $a0, $s5, 24
    sra         $a0, $a0, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x90($sp)
    sra         $a2, $fp, 24
    sra         $a3, $s7, 24
    sw          $s2, 0x18($sp)
    jal         func_8001D300
    sw          $t0, 0x14($sp)
.L8001DCA4:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v0, -0x7B48($at)
    bnez        $v0, .L8001DCBC
    addiu       $s0, $zero, 0x1
    andi        $s0, $s6, 0x3
.L8001DCBC:
    sll         $a0, $s5, 24
    sra         $a0, $a0, 24
    sll         $a1, $s3, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x94($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s0, 0xFF
    sw          $v0, 0x18($sp)
    jal         func_8001E4B0
    sw          $t0, 0x14($sp)
    addiu       $s1, $s1, 0x1
    addiu       $s4, $s4, 0x2
    andi        $v0, $s4, 0xFF
    sltiu       $v0, $v0, 0x16
    bnez        $v0, .L8001DC4C
    srl         $s6, $s6, 2
    lhu         $t0, 0x36($sp)
    sll         $fp, $t0, 24
    lw          $t0, 0x2C($sp)
    lbu         $v0, 0x16($t0)
    lhu         $t0, 0x3E($sp)
    sll         $s7, $t0, 24
    lw          $t0, 0x2C($sp)
    lw          $s1, 0x44($sp)
    addu        $s4, $zero, $zero
    lbu         $v1, 0x17($t0)
    sll         $v0, $v0, 16
    lbu         $a0, 0x18($t0)
    sll         $v1, $v1, 8
    or          $v0, $v0, $v1
    or          $s6, $v0, $a0
.L8001DD44:
    lw          $t0, 0x2C($sp)
    andi        $v0, $s4, 0xFF
    addu        $v0, $t0, $v0
    lbu         $v1, 0x0($v0)
    lw          $t0, 0x54($sp)
    lbu         $s3, 0x1($v0)
    beqz        $t0, .L8001DD70
    addiu       $s5, $v1, -0x2
    lw          $t0, 0x4C($sp)
    j .L8001DD78
    andi        $v0, $t0, 0x3
.L8001DD70:
    sll         $v0, $s3, 24
    srl         $v0, $v0, 30
.L8001DD78:
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
    andi        $v0, $s3, 0x3F
    addiu       $s3, $v0, 0x7
    andi        $v0, $s4, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, -0x7B48($at)
    lbu         $s2, 0x0($s1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8001DDB4
    addiu       $v0, $zero, 0x2
    j .L8001DDC8
    addiu       $s0, $zero, 0x1
.L8001DDB4:
    bne         $v1, $v0, .L8001DDC8
    andi        $s0, $s6, 0x3
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
.L8001DDC8:
    andi        $v1, $s2, 0xFF
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L8001DE08
    sll         $a0, $s5, 24
    sra         $a0, $a0, 24
    sll         $a1, $s3, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x90($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s2, 0xFFFF
    sw          $v0, 0x18($sp)
    jal         func_8001D300
    sw          $t0, 0x14($sp)
.L8001DE08:
    sll         $a0, $s5, 24
    sra         $a0, $a0, 24
    sll         $a1, $s3, 24
    lw          $t0, 0x24($sp)
    sra         $a1, $a1, 24
    sra         $a2, $fp, 24
    sw          $t0, 0x10($sp)
    lw          $t0, 0x94($sp)
    sra         $a3, $s7, 24
    andi        $v0, $s0, 0xFF
    sw          $v0, 0x18($sp)
    jal         func_8001E4B0
    sw          $t0, 0x14($sp)
    addiu       $s1, $s1, 0x1
    srl         $s6, $s6, 2
    lw          $t0, 0x4C($sp)
    addiu       $s4, $s4, 0x2
    andi        $v0, $s4, 0xFF
    sltiu       $v0, $v0, 0x16
    srl         $t0, $t0, 2
    bnez        $v0, .L8001DD44
    sw          $t0, 0x4C($sp)
    lbu         $v1, 0x0($s1)
    andi        $v0, $v1, 0x80
    bnez        $v0, .L8001DF64
    addu        $s0, $v1, $zero
    beqz        $s0, .L8001DF64
    sll         $s0, $s0, 3
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5027($at)
    andi        $v0, $s0, 0xFF
    beqz        $v0, .L8001DF64
    addiu       $s2, $zero, 0x4
    addiu       $s4, $zero, -0x40
.L8001DE94:
    andi        $v0, $s0, 0x80
    beql        $v0, $zero, .L8001DF58
    sll         $s0, $s0, 1
    addiu       $s1, $s1, 0x1
    lbu         $v1, 0x0($s1)
    addiu       $s1, $s1, 0x1
    lbu         $v0, 0x0($s1)
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $a1, $v1, 0x3F
    addu        $s3, $a1, $zero
    srl         $a0, $v1, 6
    andi        $a2, $a0, 0x3F
    andi        $v0, $v1, 0x20
    beqz        $v0, .L8001DED8
    addu        $s5, $a2, $zero
    or          $s3, $a1, $s4
.L8001DED8:
    andi        $v0, $a0, 0x20
    bnel        $v0, $zero, .L8001DEE4
    or          $s5, $a2, $s4
.L8001DEE4:
    lhu         $t0, 0x36($sp)
    sll         $a2, $t0, 24
    lw          $t0, 0x2C($sp)
    andi        $v1, $v1, 0xF000
    srl         $v1, $v1, 11
    addu        $v0, $t0, $v1
    lbu         $a0, 0x0($v0)
    lbu         $a1, 0x1($v0)
    lhu         $t0, 0x3E($sp)
    sra         $a2, $a2, 24
    andi        $v0, $s2, 0xFFFF
    sw          $v0, 0x18($sp)
    sll         $a3, $t0, 24
    sra         $a3, $a3, 24
    lw          $t0, 0x24($sp)
    addiu       $a0, $a0, 0xFE
    addu        $a0, $s5, $a0
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    andi        $a1, $a1, 0x3F
    addiu       $a1, $a1, 0x7
    addu        $a1, $s3, $a1
    sw          $t0, 0x10($sp)
    lw          $t0, 0x94($sp)
    sll         $a1, $a1, 24
    sra         $a1, $a1, 24
    jal         func_8001E4B0
    sw          $t0, 0x14($sp)
    sll         $s0, $s0, 1
.L8001DF58:
    andi        $v0, $s0, 0xFF
    bnez        $v0, .L8001DE94
    addiu       $s2, $s2, 0x1
.L8001DF64:
    lw          $ra, 0x7C($sp)
    lw          $fp, 0x78($sp)
    lw          $s7, 0x74($sp)
    lw          $s6, 0x70($sp)
    lw          $s5, 0x6C($sp)
    lw          $s4, 0x68($sp)
    lw          $s3, 0x64($sp)
    lw          $s2, 0x60($sp)
    lw          $s1, 0x5C($sp)
    lw          $s0, 0x58($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end ui_text_layout_forward

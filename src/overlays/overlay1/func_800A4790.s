.text
.align 2
.set noreorder
.globl func_800A4790
.ent func_800A4790
func_800A4790:
    lhu         $a2, -0x7F3C($a2)
    addiu       $a1, $zero, 0x18
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    andi        $a2, $a2, 0x4
    jal         func_800B7DD8
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lw          $v1, 0x9C($s2)
    addu        $v0, $v0, $v1
    sw          $v0, 0x9C($s2)
    slti        $v0, $v0, 0x1E
    bnez        $v0, .L800A4ADC
    addu        $v0, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5F80($v1)
    addiu       $v0, $zero, 0x1500
    bne         $v1, $v0, .L800A47EC
    addiu       $v0, $zero, 0x1300
    addu        $a0, $s2, $zero
    j           func_800A00F8
    addu        $a1, $zero, $zero
.L800A47EC:
    bne         $v1, $v0, .L800A4818
    addu        $a0, $s2, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A4814
    addiu       $a1, $zero, 0xC00
    j           func_800A00F8
    addu        $a0, $s2, $zero
.L800A4814:
    addu        $a0, $s2, $zero
.L800A4818:
    addiu       $a1, $zero, 0x400
    jal         func_800C16A0
    nop
    lui         $a1, 0x8008
    lw          $a1, -0x5F80($a1)
    jal         func_800C0BBC
    addu        $a0, $s2, $zero
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800A485C
    nop
.L800A4840:
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x8C($s2)
    addu        $a0, $zero, $zero
.L800A484C:
    jal         func_800A2BAC
    nop
    j           func_800A03B8
    addu        $v0, $zero, $zero
.L800A485C:
    jal         func_800A2834
    nop
    jal         func_800A2BAC
    addu        $a0, $zero, $zero
    j           func_800A0184
    addiu       $v0, $zero, 0x3
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    beqz        $v0, .L800A48A8
    addiu       $v0, $zero, 0x3
    lui         $v0, 0x8008
    lw          $v0, 0x78E4($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x793C($v1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A484C
    addiu       $a0, $zero, 0x1500
    j           func_800A0128
    addiu       $a0, $zero, 0x1300
.L800A48A8:
    sw          $v0, 0x8C($s2)
    addu        $a0, $s2, $zero
.L800A48B0:
    addiu       $a1, $zero, 0x3E
    jal         func_800C0BBC
    nop
    j           func_800A03B8
    addu        $v0, $zero, $zero
    lw          $v1, 0x2C($s2)
    beq         $v1, $v0, .L800A48D8
    addu        $a0, $s2, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
.L800A48D8:
    jal         func_800B9208
    addiu       $a0, $sp, 0x28
    addu        $a0, $s2, $zero
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
    j           func_800A03B8
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s2)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x2
    and         $v0, $v0, $v1
    bnez        $v0, .L800A4ADC
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x5F80($v0)
    bnez        $v0, .L800A4954
    addu        $a0, $s2, $zero
    addiu       $v0, $zero, 0x3
    jal         func_800209AC
    sw          $v0, 0x8C($s2)
    lw          $v1, 0x4($v0)
    lh          $v0, 0x10($v0)
    lbu         $v1, 0x1E($v1)
    bne         $v1, $v0, .L800A494C
    addu        $a0, $s2, $zero
    j           func_800A0190
    addiu       $a1, $zero, 0x40
.L800A494C:
    j           func_800A0190
    addiu       $a1, $zero, 0x3F
.L800A4954:
    jal         func_800C16A0
    addu        $a1, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, -0x5F80($a1)
    jal         func_800C0BBC
    addu        $a0, $s2, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L800A4840
    addiu       $v0, $zero, 0x3
    sw          $v0, 0x8C($s2)
    addu        $a0, $s2, $zero
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x3E
    j           func_800A0128
    addu        $a0, $zero, $zero
    lw          $v0, 0x24($s2)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x2
    and         $v0, $v0, $v1
    bnez        $v0, .L800A4ADC
    addu        $v0, $zero, $zero
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0x3E
    addiu       $v0, $zero, 0x3
    jal         func_800C0BBC
    sw          $v0, 0x8C($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    beqz        $v0, .L800A4ADC
    addu        $v0, $zero, $zero
    jal         func_800A2834
    nop
    j           func_800A03B8
    addu        $v0, $zero, $zero
    lw          $a0, 0x24($s2)
    lw          $v0, 0x8($a0)
    lhu         $v1, 0x14($v0)
    addiu       $v0, $v1, -0x3E
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800A4A04
    andi        $v1, $v1, 0xFFFF
    addiu       $v0, $zero, 0x40
    bnel        $v1, $v0, .L800A48B0
    addu        $a0, $s2, $zero
.L800A4A04:
    lw          $v0, 0x14($a0)
    lui         $v1, 0x4
    and         $v0, $v0, $v1
    beqz        $v0, .L800A4AD8
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lb          $v1, -0x79CA($v1)
    beq         $v1, $v0, .L800A4A68
    addu        $a1, $v1, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x6CF4
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $a0, $v0, -0xC
    andi        $a1, $a1, 0xFF
    jal         func_800A6590
    sw          $v1, 0x0($v0)
    lui         $v0, 0x8008
    lhu         $v0, 0x6D6C($v0)
    addiu       $v1, $zero, -0x1
    lui         $at, 0x8009
    sb          $v1, -0x79CA($at)
    andi        $v0, $v0, 0xFFF6
    lui         $at, 0x8008
    sh          $v0, 0x6D6C($at)
.L800A4A68:
    lui         $at, 0x8009
    sh          $zero, -0x5A4E($at)
    jal         func_800C62A8
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    sw          $zero, 0x24($v0)
    addiu       $v0, $zero, 0x4
    j           func_800A03B4
    sw          $v0, 0x8C($s2)
    lw          $v0, 0x24($s2)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x2
    and         $v0, $v0, $v1
    bnel        $v0, $zero, .L800A4ADC
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x36
    sb          $v0, 0x20($sp)
    addu        $a0, $s2, $zero
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x20
    addu        $a0, $s2, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
    jal         func_800A365C
    addu        $a0, $zero, $zero
    j           func_800A03B8
    addiu       $v0, $zero, 0x1
.L800A4AD8:
    addu        $v0, $zero, $zero
.L800A4ADC:
    lw          $ra, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end func_800A4790

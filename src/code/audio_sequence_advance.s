.text
.align 2
.set noreorder
.globl audio_sequence_advance
.ent audio_sequence_advance
audio_sequence_advance:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    lbu         $s2, 0x1E($s1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x1860
    addu        $v1, $s2, $zero
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lbu         $v1, 0x1F($s1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lui         $a0, 0x8007
    lh          $a0, 0x40CC($a0)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $v0
    lhu         $s3, 0x0($v1)
    addiu       $v0, $zero, 0x1
    beq         $a0, $v0, .L8003F040
    addu        $v0, $zero, $zero
    lui         $v0, 0x8007
    lh          $v0, 0x40CA($v0)
    beqz        $v0, .L8003F040
    addu        $v0, $zero, $zero
    jal         func_8003FE94
    addu        $a0, $s2, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L8003EF00
    addiu       $v0, $zero, 0xFF
    lbu         $v1, 0x1A($s1)
    beq         $v1, $v0, .L8003EF00
    negu        $v1, $v1
    bltzl       $v1, .L8003EEC8
    addiu       $v1, $v1, 0x7
.L8003EEC8:
    lbu         $v0, 0x20($s1)
    addiu       $v0, $v0, -0x15
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L8003EF00
    sra         $a0, $v1, 3
    lhu         $v1, 0x30($s1)
    addiu       $v0, $a0, 0xC8
    addu        $a0, $v1, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0xF2
    beqz        $v0, .L8003EF08
    nop
.L8003EF00:
    j .L8003F040
    addu        $v0, $zero, $zero
.L8003EF08:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A50($v0)
    addiu       $v0, $v0, -0x5
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L8003EF34
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x63
    addu        $a0, $v0, $zero
    j .L8003EF54
    addiu       $s0, $zero, 0x6
.L8003EF34:
    lui         $v0, 0x8007
    lbu         $v0, 0x40BC($v0)
    lui         $a0, 0x8007
    lbu         $a0, 0x40BD($a0)
    jal         func_80031A1C
    addu        $a0, $a0, $v0
    addu        $a0, $v0, $zero
    addiu       $s0, $zero, 0x2
.L8003EF54:
    sll         $v0, $a0, 16
    bltzl       $v0, .L8003EF90
    sll         $s0, $s0, 16
.L8003EF60:
    addiu       $v0, $s0, -0x1
    sll         $v1, $v0, 16
    sra         $v1, $v1, 16
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v1, 0x40BC($at)
    subu        $v1, $a0, $v1
    addu        $a0, $v1, $zero
    sll         $v1, $v1, 16
    bgez        $v1, .L8003EF60
    addu        $s0, $v0, $zero
    sll         $s0, $s0, 16
.L8003EF90:
    sra         $s0, $s0, 14
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $a0, 0x40A5($at)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $v0, 0x40A4($at)
    subu        $a0, $a0, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lbu         $a2, 0x40A4($at)
    addu        $a0, $s2, $zero
    addu        $a1, $s3, $zero
    addu        $a2, $a2, $v0
    jal         func_8003F060
    andi        $a2, $a2, 0xFFFF
    lbu         $a0, 0x1E($s1)
    lbu         $v1, 0x1F($s1)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x1860
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sll         $v1, $v1, 1
    addu        $v0, $v0, $a1
    addu        $v1, $v1, $v0
    lhu         $a1, 0x0($v1)
    jal         func_80022738
    nop
    addiu       $v0, $zero, 0x1
    addiu       $v1, $zero, -0x1
    lui         $at, 0x8007
    sh          $v1, -0x4856($at)
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8007
    sh          $v1, 0x40CC($at)
.L8003F040:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_sequence_advance

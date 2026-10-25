.text
.align 2
.set noreorder
.globl func_800C473C
.ent func_800C473C
func_800C473C:
    addiu       $sp, $sp, -0x48
    sw          $s1, 0x2C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s0, 0x28($sp)
    lhu         $v0, 0x28($s1)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    addu        $s5, $a2, $zero
    addu        $s3, $a1, $zero
    sh          $s3, 0x3C($s1)
    andi        $v0, $v0, 0xFFBF
    bne         $v1, $s1, .L800C4790
    sh          $v0, 0x28($s1)
    sll         $a0, $a1, 16
    jal         func_800C1F78
    sra         $a0, $a0, 16
.L800C4790:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s1, $v0, .L800C48AC
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5C24($v0)
    bnez        $v0, .L800C48B4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800C47D8
    addiu       $s2, $zero, 0xA
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bnel        $v1, $v0, .L800C47D8
    addiu       $s2, $zero, 0x14
.L800C47D8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800C484C
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $v1, 0x8009
    lb          $v1, -0x4CE0($v1)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($v1)
    lw          $v0, 0x24($v0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x20($v0)
    lw          $a0, 0x20($v1)
    lui         $v1, 0x50
    addu        $v0, $v0, $v1
    slt         $v0, $v0, $a0
    bnel        $v0, $zero, .L800C484C
    sll         $s2, $s2, 1
.L800C484C:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    blez        $v0, .L800C48AC
    addu        $s0, $zero, $zero
    addiu       $s4, $zero, -0x8C
.L800C4860:
    jal         func_80031A1C
    andi        $a0, $s2, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800C4894
    nop
    lhu         $v0, 0xC($s1)
    addiu       $v0, $v0, -0x1
    sh          $v0, 0xC($s1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, -0x8C
    bnel        $v0, $zero, .L800C4894
    sh          $s4, 0xC($s1)
.L800C4894:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $v0
    bnez        $v0, .L800C4860
    nop
.L800C48AC:
    lui         $v0, 0x8009
    lw          $v0, -0x5C24($v0)
.L800C48B4:
    lhu         $s2, 0xC($s1)
    bne         $s1, $v0, .L800C48D4
    nop
    lui         $s2, 0x8008
    lbu         $s2, 0x799E($s2)
    jal         func_800C157C
    addu        $a0, $s1, $zero
    addu        $s3, $v0, $zero
.L800C48D4:
    lhu         $a3, 0x28($s1)
    andi        $v0, $a3, 0x8
    bnez        $v0, .L800C48F8
    nop
    lh          $v0, 0x4C($s1)
    beqz        $v0, .L800C4A38
    addiu       $s2, $s2, 0x14
    j           func_800C0564
    sh          $s3, 0x3E($s1)
.L800C48F8:
    lui         $a2, 0x8008
    lw          $a2, 0xC10($a2)
    andi        $v0, $a2, 0x4000
    beqz        $v0, .L800C4A38
    andi        $v0, $a2, 0x140
    beqz        $v0, .L800C4A38
    nop
    lw          $a0, 0x24($s1)
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    lw          $v1, 0x20($a0)
    slt         $v0, $v0, $v1
    bnez        $v0, .L800C4A38
    nop
    lw          $a1, 0x1C($a0)
    bltzl       $a1, .L800C493C
    negu        $a1, $a1
.L800C493C:
    lui         $v0, 0x8F
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $a1
    bnez        $v0, .L800C4A38
    addiu       $v0, $s3, -0x5C7
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x472
    beqz        $v0, .L800C4A38
    andi        $v0, $a2, 0x8
    bnez        $v0, .L800C4A38
    nop
    lbu         $v1, 0x20($s1)
    beqz        $v1, .L800C4994
    nop
    bltz        $v1, .L800C4A38
    slti        $v0, $v1, 0xA
    beqz        $v0, .L800C4A38
    slti        $v0, $v1, 0x4
    bnez        $v0, .L800C4A38
    addiu       $v0, $zero, 0x10
    j           func_800C02C8
    nop
.L800C4994:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s1, $v0, .L800C4A38
    addu        $a0, $s1, $zero
    addiu       $a1, $s3, 0x7FF
    andi        $a1, $a1, 0xFFF
    ori         $v0, $a3, 0x40
    jal         func_800C16A0
    sh          $v0, 0x28($s1)
    lbu         $v0, 0x1B($s1)
    bnez        $v0, .L800C49C8
    addiu       $v0, $zero, 0x18
    addiu       $v0, $zero, 0x19
.L800C49C8:
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
    sll         $v0, $s2, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    j           func_800C0314
    addiu       $s2, $v1, -0x15E
    lbu         $v1, 0x64($s1)
    bne         $v1, $v0, .L800C4A38
    addu        $a0, $s1, $zero
    lhu         $v0, 0x28($s1)
    addiu       $a1, $s3, 0x7FF
    andi        $a1, $a1, 0xFFF
    ori         $v0, $v0, 0x40
    jal         func_800C16A0
    sh          $v0, 0x28($s1)
    lui         $v1, 0xF
    ori         $v1, $v1, 0x1
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    addiu       $a0, $v0, -0x113
    lui         $at, 0x8008
    sw          $v1, 0x7B60($at)
    bltzl       $a0, .L800C4A34
    addiu       $a0, $v0, -0x110
.L800C4A34:
    srl         $s2, $a0, 2
.L800C4A38:
    lhu         $v1, 0x2A($s1)
    ori         $v0, $zero, 0xFFEF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800C4A60
    lui         $v0, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $v0, $v1, $v0
    sh          $v0, 0x2A($s1)
    lui         $v0, 0x1
.L800C4A60:
    ori         $v0, $v0, 0xA8F5
    lbu         $s0, 0xA($s1)
    sll         $v1, $s2, 16
    lhu         $a0, 0x28($s1)
    sra         $v1, $v1, 9
    andi        $a0, $a0, 0x8
    beqz        $a0, .L800C4AA8
    addu        $s2, $v1, $v0
    lbu         $v0, 0x21($s1)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800C4AC4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s1, $v0, .L800C4AC4
    srl         $v0, $s0, 1
    j           func_800C03A0
    addiu       $s0, $v0, 0x80
.L800C4AA8:
    lbu         $v0, 0x21($s1)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800C4AC4
    srl         $v0, $s0, 31
    addu        $v0, $s0, $v0
    sra         $v0, $v0, 1
    addiu       $s0, $v0, 0x80
.L800C4AC4:
    lui         $v0, 0x8007
    lw          $v0, -0x6928($v0)
    bnez        $v0, .L800C4AD8
    addiu       $v0, $zero, -0x180
    addiu       $v0, $zero, -0x140
.L800C4AD8:
    subu        $a1, $v0, $s0
    negu        $a1, $a1
    lui         $t0, 0x8008
    lw          $t0, 0x7B64($t0)
    addiu       $t1, $zero, 0x1745
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008012  # mflo        $s0
    nop
    nop
    sll         $v0, $a1, 7
    sra         $t6, $s0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008012  # mflo        $s0
    nop
    nop
    sll         $v0, $s3, 16
    sra         $s3, $v0, 16
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x10
    jal         func_800B9274
    addu        $a2, $s5, $s0
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addu        $a2, $s0, $zero
    jal         func_800C08BC
    addu        $a3, $s2, $zero
    lhu         $v0, 0x28($s1)
    andi        $v0, $v0, 0x40
    bnez        $v0, .L800C4C88
    nop
    lw          $a0, 0x24($s1)
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    andi        $s0, $v0, 0xFFF
    subu        $v0, $s3, $s0
    andi        $a0, $v0, 0xFFF
    slti        $v0, $a0, 0x801
    beql        $v0, $zero, .L800C4B80
    addiu       $a0, $a0, -0xFFF
.L800C4B80:
    bgez        $a0, .L800C4B8C
    addu        $v0, $a0, $zero
    addiu       $v0, $a0, 0x7
.L800C4B8C:
    sra         $v0, $v0, 3
    addu        $v0, $s0, $v0
    andi        $s0, $v0, 0xFFF
    jal         func_800C157C
    addu        $a0, $s1, $zero
    sll         $v0, $v0, 16
    sra         $s2, $v0, 16
    subu        $v0, $s2, $s0
    andi        $a0, $v0, 0xFFF
    slti        $v0, $a0, 0x800
    bnez        $v0, .L800C4BC8
    andi        $v0, $a0, 0xFFF
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $a0
    andi        $v0, $a0, 0xFFF
.L800C4BC8:
    slti        $v0, $v0, 0x200
    bnez        $v0, .L800C4C1C
    addu        $a0, $s1, $zero
    lbu         $v0, 0xA($s1)
    lui         $v1, 0x2AAA
    ori         $v1, $v1, 0xAAAB
    srl         $v0, $v0, 2
    addiu       $a1, $v0, 0x71
    .word       0x00A30018  # mult        $a1, $v1
    subu        $v0, $s2, $s3
    andi        $a0, $v0, 0xFFF
    sra         $v1, $a1, 31
    .word       0x00004010  # mfhi        $t0
    sra         $v0, $t0, 2
    subu        $v0, $v0, $v1
    addu        $a1, $a1, $v0
    slti        $v0, $a0, 0x800
    bnez        $v0, .L800C4C18
    subu        $s0, $s2, $a1
    addu        $s0, $s2, $a1
.L800C4C18:
    addu        $a0, $s1, $zero
.L800C4C1C:
    sll         $a1, $s0, 16
    jal         func_800C16A0
    sra         $a1, $a1, 16
    jal         func_800C157C
    addu        $a0, $s1, $zero
    lw          $a0, 0x24($s1)
    sll         $v0, $v0, 16
    sra         $s2, $v0, 16
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    subu        $a0, $s2, $v0
    bltzl       $a0, .L800C4C58
    addiu       $a0, $a0, 0xFFF
.L800C4C58:
    slti        $v0, $a0, 0x200
    bnez        $v0, .L800C4C88
    slti        $v0, $a0, 0x600
    bnez        $v0, .L800C4C88
    slti        $v0, $a0, 0xA00
    beqz        $v0, .L800C4C88
    addiu       $v1, $zero, 0x2F
    lhu         $v0, 0x28($s1)
    lui         $at, 0x8008
    sw          $v1, 0x7B60($at)
    ori         $v0, $v0, 0x40
    sh          $v0, 0x28($s1)
.L800C4C88:
    lw          $ra, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800C473C

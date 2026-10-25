.text
.align 2
.set noreorder
.globl func_800C4CB0
.ent func_800C4CB0
func_800C4CB0:
    addiu       $sp, $sp, -0x48
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $a2, $zero
    sw          $ra, 0x40($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s0, 0x20($sp)
    lhu         $v0, 0x28($s1)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    lui         $s5, 0x1
    addu        $s4, $a1, $zero
    addu        $s7, $a3, $zero
    sh          $s4, 0x3C($s1)
    andi        $v0, $v0, 0xFFBF
    bne         $v1, $s1, .L800C4D14
    sh          $v0, 0x28($s1)
    sll         $a0, $a1, 16
    jal         func_800C1F78
    sra         $a0, $a0, 16
.L800C4D14:
    lhu         $v0, 0x28($s1)
    lhu         $s3, 0xC($s1)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800C4D3C
    nop
    lh          $v0, 0x4C($s1)
    beqz        $v0, .L800C4D48
    addiu       $s3, $s3, 0x14
    j           func_800C088C
    sh          $s4, 0x3E($s1)
.L800C4D3C:
    lh          $v0, 0x48($s1)
    bnez        $v0, .L800C4FB0
    nop
.L800C4D48:
    jal         func_800C157C
    addu        $a0, $s1, $zero
    addu        $s0, $v0, $zero
    andi        $a1, $s2, 0xFFF
    addu        $s6, $a1, $zero
    addu        $s2, $s6, $zero
    subu        $v0, $s0, $a1
    andi        $v1, $v0, 0xFFF
    slti        $v0, $v1, 0x800
    bnez        $v0, .L800C4D7C
    addu        $a0, $v1, $zero
    addiu       $v0, $zero, 0xFFF
    subu        $a0, $v0, $v1
.L800C4D7C:
    andi        $a3, $a0, 0xFFF
    slti        $v0, $a3, 0xAB
    bnel        $v0, $zero, .L800C4E28
    addu        $a0, $s1, $zero
    lbu         $v0, 0xA($s1)
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    subu        $v1, $v1, $a1
    andi        $v1, $v1, 0xFFF
    slti        $v1, $v1, 0x800
    srl         $v0, $v0, 3
    addiu       $a2, $v0, 0x66
    slti        $v0, $a3, 0x601
    bnez        $v0, .L800C4DFC
    xori        $v1, $v1, 0x1
    lbu         $a1, 0x64($s1)
    addiu       $v0, $zero, 0x19
    beq         $a1, $v0, .L800C4DF0
    slti        $v0, $a1, 0x19
    bnez        $v0, .L800C4DFC
    slti        $v0, $a1, 0x2E
    beqz        $v0, .L800C4DFC
    slti        $v0, $a1, 0x2B
    bnez        $v0, .L800C4DFC
    nop
    lw          $v0, 0x24($s1)
    lw          $v0, 0x1C($v0)
    j           func_800C06D4
    nor         $v0, $zero, $v0
.L800C4DF0:
    lw          $v0, 0x24($s1)
    lw          $v0, 0x1C($v0)
    srl         $v1, $v0, 31
.L800C4DFC:
    bnez        $v1, .L800C4E08
    addu        $s2, $s0, $a2
    subu        $s2, $s0, $a2
.L800C4E08:
    sll         $a0, $a0, 16
    jal         func_8002E7A0
    lui         $a1, 0x7FF
    bltzl       $v0, .L800C4E1C
    addiu       $v0, $v0, 0x3
.L800C4E1C:
    sra         $v0, $v0, 2
    subu        $s5, $s5, $v0
    addu        $a0, $s1, $zero
.L800C4E28:
    sll         $a1, $s2, 16
    jal         func_800C16A0
    sra         $a1, $a1, 16
    lbu         $v0, 0x21($s1)
    lbu         $s0, 0xA($s1)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800C4E68
    srl         $v0, $s0, 31
    lbu         $v1, 0x1E($s1)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    bne         $v1, $v0, .L800C4E68
    srl         $v0, $s0, 31
    srl         $v0, $s0, 1
    addiu       $s0, $v0, 0x80
    srl         $v0, $s0, 31
.L800C4E68:
    addu        $v0, $s0, $v0
    sra         $v0, $v0, 1
    addiu       $a2, $v0, 0x180
    lui         $v1, 0x1
    ori         $v1, $v1, 0xA8F5
    sll         $v0, $s3, 16
    sra         $v0, $v0, 9
    addu        $s2, $v0, $v1
    sra         $t6, $s2, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00009012  # mflo        $s2
    nop
    nop
    addu        $v1, $s6, $zero
    sll         $v0, $s4, 16
    sra         $a0, $v0, 16
    beq         $v1, $a0, .L800C4ECC
    nop
    sra         $t6, $s2, 8
    sra         $t7, $s5, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00009012  # mflo        $s2
    nop
    nop
.L800C4ECC:
    lui         $t0, 0x8008
    lw          $t0, 0x7B64($t0)
    addiu       $t1, $zero, 0x1745
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008012  # mflo        $s0
    nop
    nop
    sll         $v0, $a2, 7
    sra         $t6, $s0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008012  # mflo        $s0
    nop
    nop
    addiu       $a1, $sp, 0x10
    jal         func_800B9274
    addu        $a2, $s0, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    addu        $a2, $s0, $zero
    jal         func_800C08BC
    addu        $a3, $s2, $zero
    jal         func_800C157C
    addu        $a0, $s1, $zero
    lw          $a0, 0x24($s1)
    addu        $s0, $v0, $zero
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    subu        $v1, $s0, $v0
    sll         $v0, $v1, 16
    bgez        $v0, .L800C4F58
    addu        $a0, $v1, $zero
    addiu       $a0, $v1, 0xFFF
.L800C4F58:
    sll         $v0, $a0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x200
    bnez        $v0, .L800C4FB0
    slti        $v0, $v1, 0x600
    beqz        $v0, .L800C4F80
    slti        $v0, $v1, 0xA00
    lhu         $v0, 0x28($s1)
    j           func_800C087C
    addiu       $v1, $zero, 0x34
.L800C4F80:
    beqz        $v0, .L800C4F94
    slti        $v0, $v1, 0xE00
    lhu         $v0, 0x28($s1)
    j           func_800C087C
    addiu       $v1, $zero, 0x2F
.L800C4F94:
    beqz        $v0, .L800C4FB0
    addiu       $v1, $zero, 0x33
    lhu         $v0, 0x28($s1)
    lui         $at, 0x8008
    sw          $v1, 0x7B60($at)
    ori         $v0, $v0, 0x40
    sh          $v0, 0x28($s1)
.L800C4FB0:
    lw          $ra, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800C4CB0

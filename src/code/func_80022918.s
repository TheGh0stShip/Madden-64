.text
.align 2
.set noreorder
.globl func_80022918
.ent func_80022918
func_80022918:
    addiu       $sp, $sp, -0x38
    sw          $s6, 0x28($sp)
    addu        $s6, $a2, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $zero, $zero
    sw          $s7, 0x2C($sp)
    addiu       $s7, $zero, 0x1
    sw          $s3, 0x1C($sp)
    andi        $s3, $a0, 0xFFFF
    sw          $s5, 0x24($sp)
    andi        $s5, $a1, 0xFFFF
    sw          $ra, 0x30($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    andi        $s1, $s4, 0xFFFF
.L80022958:
    lui         $v0, 0x8009
    lw          $v0, -0x7F6C($v0)
    sll         $v1, $s1, 2
    addu        $v1, $v1, $s1
    sll         $v1, $v1, 3
    addu        $v1, $v1, $v0
    lbu         $v0, 0x4($v1)
    bnel        $v0, $s7, .L800229FC
    addiu       $s4, $s4, 0x1
    addu        $a0, $s3, $zero
    andi        $a1, $s6, 0xFFFF
    jal         func_8002209C
    addu        $a2, $s1, $zero
    andi        $s2, $v0, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    beq         $s2, $v0, .L800229F8
    addu        $a0, $s3, $zero
    addu        $a1, $s5, $zero
    jal         func_8002209C
    addu        $a2, $s1, $zero
    addu        $s0, $v0, $zero
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L800229E4
    addu        $a0, $s3, $zero
    addu        $a1, $s1, $zero
    andi        $s0, $s0, 0xFFFF
    jal         func_80022E74
    addu        $a2, $s0, $zero
    addu        $a0, $s3, $zero
    andi        $a1, $v0, 0xFFFF
    addu        $a2, $s1, $zero
    jal         func_8002212C
    addu        $a3, $s0, $zero
.L800229E4:
    addu        $a0, $s3, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $s1, $zero
    jal         func_8002212C
    addu        $a3, $s2, $zero
.L800229F8:
    addiu       $s4, $s4, 0x1
.L800229FC:
    andi        $v0, $s4, 0xFFFF
    sltiu       $v0, $v0, 0x28
    bnez        $v0, .L80022958
    andi        $s1, $s4, 0xFFFF
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80022918

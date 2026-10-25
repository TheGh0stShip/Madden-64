.text
.align 2
.set noreorder
.globl func_80016A24
.ent func_80016A24
func_80016A24:
    addiu       $sp, $sp, -0x30
    addu        $v0, $a0, $zero
    addiu       $a0, $zero, -0x1
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lbu         $a1, 0x0($s2)
    addu        $s3, $zero, $zero
    beqz        $a1, .L80016B30
    addu        $a3, $zero, $zero
    addiu       $s6, $zero, 0xA
    sll         $v0, $v0, 16
    sra         $s4, $v0, 16
    sll         $v0, $s4, 3
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 3
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x747C
    addu        $s5, $v0, $v1
.L80016A90:
    addiu       $a2, $a1, -0x20
    bne         $a1, $s6, .L80016AC0
    addu        $s0, $a2, $zero
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L80016AB8
    addu        $s3, $a3, $zero
.L80016AB8:
    j .L80016B20
    addu        $a3, $zero, $zero
.L80016AC0:
    addu        $a1, $a2, $zero
    sll         $v0, $a1, 1
    addu        $v0, $v0, $s5
    lhu         $v0, 0x0($v0)
    lui         $v1, 0x8007
    lh          $v1, -0x6D80($v1)
    addu        $s1, $a3, $v0
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80016B20
    addu        $a3, $s1, $zero
    addiu       $v0, $a0, -0x10
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0xA
    bnel        $v0, $zero, .L80016B24
    addiu       $s2, $s2, 0x1
    addiu       $v0, $a2, -0x10
    sltiu       $v0, $v0, 0xA
    bnel        $v0, $zero, .L80016B24
    addiu       $s2, $s2, 0x1
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    jal         func_800165A0
    addu        $a2, $s4, $zero
    subu        $a3, $s1, $v0
.L80016B20:
    addiu       $s2, $s2, 0x1
.L80016B24:
    lbu         $a1, 0x0($s2)
    bnez        $a1, .L80016A90
    addu        $a0, $s0, $zero
.L80016B30:
    sll         $v0, $s3, 16
    beql        $v0, $zero, .L80016B3C
    addu        $s3, $a3, $zero
.L80016B3C:
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80016A24

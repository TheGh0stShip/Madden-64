.text
.align 2
.set noreorder
.globl display_command_finalize
.ent display_command_finalize
display_command_finalize:
    addiu       $sp, $sp, -0x48
    sw          $s3, 0x3C($sp)
    addu        $s3, $a0, $zero
    sw          $s0, 0x30($sp)
    lbu         $s0, 0x5B($sp)
    andi        $a3, $a3, 0xFF
    sll         $a3, $a3, 3
    addiu       $a3, $a3, 0x4
    sw          $s2, 0x38($sp)
    addu        $s2, $a1, $a3
    sw          $ra, 0x40($sp)
    beqz        $a2, .L80043048
    sw          $s1, 0x34($sp)
    addu        $s1, $a2, $a3
    lw          $a0, 0x0($s2)
    lw          $a1, 0x0($s1)
    andi        $s0, $s0, 0xFF
    addu        $a2, $s0, $zero
    sra         $a0, $a0, 20
    jal         func_80042E90
    sra         $a1, $a1, 20
    sw          $v0, 0x10($sp)
    lw          $a0, 0x0($s2)
    addu        $a2, $s0, $zero
    lw          $a1, 0x0($s1)
    sll         $a0, $a0, 12
    sra         $a0, $a0, 20
    sll         $a1, $a1, 12
    jal         func_80042E90
    sra         $a1, $a1, 20
    sw          $v0, 0x14($sp)
    lw          $a0, 0x4($s2)
    lw          $a1, 0x4($s1)
    addu        $a2, $s0, $zero
    sra         $a0, $a0, 20
    jal         func_80042E90
    sra         $a1, $a1, 20
    sw          $v0, 0x18($sp)
    lbu         $a0, 0x3($s2)
    lbu         $a1, 0x3($s1)
    jal         func_80042EC0
    addu        $a2, $s0, $zero
    sw          $v0, 0x20($sp)
    lw          $a0, 0x4($s2)
    addu        $a2, $s0, $zero
    lw          $a1, 0x4($s1)
    srl         $a0, $a0, 12
    andi        $a0, $a0, 0xFF
    srl         $a1, $a1, 12
    jal         func_80042EC0
    andi        $a1, $a1, 0xFF
    sw          $v0, 0x24($sp)
    lw          $a0, 0x4($s2)
    addu        $a2, $s0, $zero
    lw          $a1, 0x4($s1)
    srl         $a0, $a0, 4
    andi        $a0, $a0, 0xFF
    srl         $a1, $a1, 4
    jal         func_80042EC0
    andi        $a1, $a1, 0xFF
    j .L800430A4
    sw          $v0, 0x28($sp)
.L80043048:
    lw          $v0, 0x0($s2)
    sra         $v0, $v0, 20
    sll         $v0, $v0, 20
    sw          $v0, 0x10($sp)
    lw          $v0, 0x0($s2)
    sll         $v0, $v0, 12
    sra         $v0, $v0, 20
    sll         $v0, $v0, 20
    sw          $v0, 0x14($sp)
    lw          $v0, 0x4($s2)
    sra         $v0, $v0, 20
    sll         $v0, $v0, 20
    sw          $v0, 0x18($sp)
    lbu         $v0, 0x3($s2)
    sll         $v0, $v0, 4
    sw          $v0, 0x20($sp)
    lw          $v0, 0x4($s2)
    srl         $v0, $v0, 8
    andi        $v0, $v0, 0xFF0
    sw          $v0, 0x24($sp)
    lw          $v0, 0x4($s2)
    andi        $v0, $v0, 0xFF0
    sw          $v0, 0x28($sp)
.L800430A4:
    lw          $v0, 0x10($sp)
    sw          $v0, 0x0($s3)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x4($s3)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x8($s3)
    lw          $v0, 0x20($sp)
    sw          $v0, 0xC($s3)
    lw          $v0, 0x24($sp)
    sw          $v0, 0x10($s3)
    lw          $v0, 0x28($sp)
    sw          $v0, 0x14($s3)
    lw          $ra, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end display_command_finalize

.text
.align 2
.set noreorder
.globl menu_mode_update
.ent menu_mode_update
menu_mode_update:
    lui         $v0, 0x8007
    lh          $v0, -0x45DE($v0)
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    beqz        $v0, .L800291B8
    sw          $s0, 0x28($sp)
    jal         func_800DD6EC
    nop
    addiu       $a0, $zero, 0x5
    addiu       $s2, $sp, 0x20
    addu        $a1, $s2, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x57B2($v1)
    addiu       $s0, $sp, 0x18
    addiu       $s1, $sp, 0x22
    addu        $v0, $s0, $v0
    sb          $v1, 0x0($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x5280($v1)
    addu        $a2, $s1, $zero
    addu        $v0, $s0, $v0
    jal         func_800291D4
    sb          $v1, 0x0($v0)
    addiu       $a0, $zero, 0x6
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0xA
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0x7
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0xE
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0x8
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0x14
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0x9
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0x11
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0xA
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0x18
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0xB
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0x10
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0xC
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s0, $v0
    lbu         $v0, 0x0($v0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
    addiu       $a0, $zero, 0x31
    addu        $a1, $s2, $zero
    jal         func_800291D4
    addu        $a2, $s1, $zero
    addiu       $a0, $zero, 0xD
    andi        $a2, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s0, $s0, $v0
    lbu         $v0, 0x0($s0)
    lh          $a1, 0x20($sp)
    lhu         $a3, 0x22($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    jal         func_80028CA8
    sw          $v0, 0x10($sp)
.L800291B8:
    lw          $ra, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end menu_mode_update

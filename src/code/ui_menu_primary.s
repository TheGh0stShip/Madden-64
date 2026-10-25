.text
.align 2
.set noreorder
.globl ui_menu_primary
.ent ui_menu_primary
ui_menu_primary:
    addiu       $sp, $sp, -0x8
    lhu         $v0, 0x22($sp)
    lw          $v1, 0x1C($sp)
    lw          $t7, 0x18($sp)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $t0, 0x2($v0)
    lui         $v0, 0x8008
    lbu         $v0, 0x5027($v0)
    sll         $a2, $a2, 24
    lui         $at, 0x8008
    sb          $v0, -0x6B04($at)
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    sb          $v0, -0x6B00($at)
    lhu         $v0, 0x0($v1)
    sra         $t2, $a2, 24
    addiu       $t0, $t0, 0x2
    sll         $v0, $v0, 1
    addu        $t0, $t0, $v0
    addu        $t1, $v1, $t0
    lbu         $t3, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $t5, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $t4, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $t6, 0x0($t1)
    sll         $v1, $a0, 24
    sra         $v1, $v1, 24
    sll         $v0, $t3, 24
    sra         $v0, $v0, 24
    addu        $v1, $v1, $v0
    addu        $v0, $t4, $v1
    slt         $v0, $v0, $t2
    beqz        $v0, .L8001E65C
    addiu       $t1, $t1, 0x1
    bltz        $v1, .L8001E65C
    sll         $v1, $a1, 24
    sra         $v1, $v1, 24
    sll         $v0, $t5, 24
    sra         $v0, $v0, 24
    addu        $t0, $v1, $v0
    addu        $v1, $t6, $t0
    sll         $v0, $a3, 24
    sra         $v0, $v0, 24
    slt         $v1, $v1, $v0
    beqz        $v1, .L8001E65C
    nop
    bltz        $t0, .L8001E65C
    addu        $t9, $t3, $a0
    addu        $t3, $zero, $zero
    addu        $v0, $a1, $t5
    srl         $v1, $a2, 31
    addu        $v1, $t2, $v1
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sra         $a0, $v1, 1
    addu        $v1, $t6, $zero
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00004012  # mflo        $t0
    beqz        $v1, .L8001E65C
    addu        $v0, $zero, $zero
    sltu        $t8, $v0, $t4
    addu        $t6, $a0, $zero
    addu        $t5, $v1, $zero
.L8001E5B8:
    addu        $a2, $t9, $zero
    beqz        $t8, .L8001E648
    addu        $a3, $zero, $zero
    addu        $t2, $t4, $zero
.L8001E5C8:
    lbu         $a1, 0x0($t1)
    beqz        $a1, .L8001E630
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t0, $v0
    addu        $v0, $t7, $v0
    lbu         $v1, 0x0($v0)
    andi        $v0, $a2, 0x1
    beqz        $v0, .L8001E608
    andi        $a0, $v1, 0xF
    lui         $v0, 0x8008
    lbu         $v0, -0x6B04($v0)
    andi        $v1, $v1, 0xF0
    addu        $v0, $a1, $v0
    j .L8001E61C
    addu        $v1, $v1, $v0
.L8001E608:
    lui         $v0, 0x8008
    lbu         $v0, -0x6B00($v0)
    sll         $v1, $a1, 4
    addu        $v0, $v0, $v1
    addu        $v1, $a0, $v0
.L8001E61C:
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t0, $v0
    addu        $v0, $t7, $v0
    sb          $v1, 0x0($v0)
.L8001E630:
    addiu       $t1, $t1, 0x1
    addiu       $a3, $a3, 0x1
    andi        $v0, $a3, 0xFFFF
    sltu        $v0, $v0, $t2
    bnez        $v0, .L8001E5C8
    addiu       $a2, $a2, 0x1
.L8001E648:
    addiu       $t3, $t3, 0x1
    andi        $v0, $t3, 0xFFFF
    sltu        $v0, $v0, $t5
    bnez        $v0, .L8001E5B8
    addu        $t0, $t0, $t6
.L8001E65C:
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end ui_menu_primary

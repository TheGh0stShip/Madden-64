.text
.align 2
.set noreorder
.globl ui_text_line_finalize
.ent ui_text_line_finalize
ui_text_line_finalize:
    addiu       $sp, $sp, -0x10
    lhu         $v0, 0x2A($sp)
    lw          $v1, 0x24($sp)
    lw          $t7, 0x20($sp)
    sw          $s1, 0xC($sp)
    sw          $s0, 0x8($sp)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $t1, 0x2($v0)
    lui         $v0, 0x8008
    lbu         $v0, 0x5027($v0)
    sll         $a2, $a2, 24
    sra         $t2, $a2, 24
    lui         $at, 0x8008
    sb          $v0, -0x6B04($at)
    sll         $v0, $v0, 4
    addu        $t0, $v1, $t1
    lui         $at, 0x8008
    sb          $v0, -0x6B00($at)
    lbu         $t3, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lbu         $t5, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lbu         $t4, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lbu         $t6, 0x0($t0)
    sll         $v1, $a0, 24
    sra         $v1, $v1, 24
    sll         $v0, $t3, 24
    sra         $v0, $v0, 24
    subu        $v1, $v1, $v0
    slt         $v0, $v1, $t2
    beqz        $v0, .L8001D694
    addiu       $t0, $t0, 0x1
    subu        $v0, $v1, $t4
    bltz        $v0, .L8001D694
    sll         $v1, $a1, 24
    sra         $v1, $v1, 24
    sll         $v0, $t5, 24
    sra         $v0, $v0, 24
    addu        $t1, $v1, $v0
    addu        $v1, $t6, $t1
    sll         $v0, $a3, 24
    sra         $v0, $v0, 24
    slt         $v1, $v1, $v0
    beqz        $v1, .L8001D694
    nop
    bltz        $t1, .L8001D694
    subu        $s1, $a0, $t3
    addu        $v0, $a1, $t5
    srl         $v1, $a2, 31
    addu        $v1, $t2, $v1
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sra         $a0, $v1, 1
    addu        $v1, $t6, $zero
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00004812  # mflo        $t1
    beqz        $v1, .L8001D694
    addu        $t3, $zero, $zero
    addu        $s0, $t4, $zero
    addiu       $t6, $zero, 0x80
    addiu       $t5, $zero, 0x8
    addu        $t9, $a0, $zero
    addu        $t8, $v1, $zero
.L8001D5D8:
    addu        $a2, $s1, $zero
    addu        $a3, $zero, $zero
    beqz        $s0, .L8001D678
    addu        $a1, $zero, $zero
    addu        $t2, $t4, $zero
.L8001D5EC:
    lbu         $v0, 0x0($t0)
    srav        $v1, $t6, $a1
    and         $v0, $v0, $v1
    beqz        $v0, .L8001D654
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t1, $v0
    addu        $v0, $t7, $v0
    lbu         $a0, 0x0($v0)
    andi        $v0, $a2, 0x1
    beqz        $v0, .L8001D62C
    andi        $v0, $a0, 0xF0
    lui         $v1, 0x8008
    lbu         $v1, -0x6B04($v1)
    j .L8001D63C
    addiu       $v0, $v0, 0x1
.L8001D62C:
    lui         $v1, 0x8008
    lbu         $v1, -0x6B00($v1)
    andi        $v0, $a0, 0xF
    addiu       $v0, $v0, 0x10
.L8001D63C:
    addu        $a0, $v1, $v0
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t1, $v0
    addu        $v0, $t7, $v0
    sb          $a0, 0x0($v0)
.L8001D654:
    addiu       $a1, $a1, 0x1
    bne         $a1, $t5, .L8001D668
    addiu       $a3, $a3, 0x1
    addu        $a1, $zero, $zero
    addiu       $t0, $t0, 0x1
.L8001D668:
    andi        $v0, $a3, 0xFFFF
    sltu        $v0, $v0, $t2
    bnez        $v0, .L8001D5EC
    addiu       $a2, $a2, -0x1
.L8001D678:
    bnel        $a1, $zero, .L8001D680
    addiu       $t0, $t0, 0x1
.L8001D680:
    addiu       $t3, $t3, 0x1
    andi        $v0, $t3, 0xFFFF
    sltu        $v0, $v0, $t8
    bnez        $v0, .L8001D5D8
    addu        $t1, $t1, $t9
.L8001D694:
    lw          $s1, 0xC($sp)
    lw          $s0, 0x8($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end ui_text_line_finalize

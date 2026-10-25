.text
.align 2
.set noreorder
.globl ui_text_line_update
.ent ui_text_line_update
ui_text_line_update:
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
    addu        $v1, $v1, $v0
    addu        $v0, $t4, $v1
    slt         $v0, $v0, $t2
    beqz        $v0, .L8001D4C0
    addiu       $t0, $t0, 0x1
    bltz        $v1, .L8001D4C0
    sll         $v1, $a1, 24
    sra         $v1, $v1, 24
    sll         $v0, $t5, 24
    sra         $v0, $v0, 24
    addu        $t1, $v1, $v0
    addu        $v1, $t6, $t1
    sll         $v0, $a3, 24
    sra         $v0, $v0, 24
    slt         $v1, $v1, $v0
    beqz        $v1, .L8001D4C0
    nop
    bltz        $t1, .L8001D4C0
    addu        $s1, $t3, $a0
    addu        $v0, $a1, $t5
    srl         $v1, $a2, 31
    addu        $v1, $t2, $v1
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sra         $a0, $v1, 1
    addu        $v1, $t6, $zero
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00004812  # mflo        $t1
    beqz        $v1, .L8001D4C0
    addu        $t3, $zero, $zero
    addu        $s0, $t4, $zero
    addiu       $t6, $zero, 0x80
    addiu       $t5, $zero, 0x8
    addu        $t9, $a0, $zero
    addu        $t8, $v1, $zero
.L8001D404:
    addu        $a2, $s1, $zero
    addu        $a3, $zero, $zero
    beqz        $s0, .L8001D4A4
    addu        $a1, $zero, $zero
    addu        $t2, $t4, $zero
.L8001D418:
    lbu         $v0, 0x0($t0)
    srav        $v1, $t6, $a1
    and         $v0, $v0, $v1
    beqz        $v0, .L8001D480
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t1, $v0
    addu        $v0, $t7, $v0
    lbu         $a0, 0x0($v0)
    andi        $v0, $a2, 0x1
    beqz        $v0, .L8001D458
    andi        $v0, $a0, 0xF0
    lui         $v1, 0x8008
    lbu         $v1, -0x6B04($v1)
    j .L8001D468
    addiu       $v0, $v0, 0x1
.L8001D458:
    lui         $v1, 0x8008
    lbu         $v1, -0x6B00($v1)
    andi        $v0, $a0, 0xF
    addiu       $v0, $v0, 0x10
.L8001D468:
    addu        $a0, $v1, $v0
    andi        $v0, $a2, 0xFF
    srl         $v0, $v0, 1
    addu        $v0, $t1, $v0
    addu        $v0, $t7, $v0
    sb          $a0, 0x0($v0)
.L8001D480:
    addiu       $a1, $a1, 0x1
    bne         $a1, $t5, .L8001D494
    addiu       $a3, $a3, 0x1
    addu        $a1, $zero, $zero
    addiu       $t0, $t0, 0x1
.L8001D494:
    andi        $v0, $a3, 0xFFFF
    sltu        $v0, $v0, $t2
    bnez        $v0, .L8001D418
    addiu       $a2, $a2, 0x1
.L8001D4A4:
    bnel        $a1, $zero, .L8001D4AC
    addiu       $t0, $t0, 0x1
.L8001D4AC:
    addiu       $t3, $t3, 0x1
    andi        $v0, $t3, 0xFFFF
    sltu        $v0, $v0, $t8
    bnez        $v0, .L8001D404
    addu        $t1, $t1, $t9
.L8001D4C0:
    lw          $s1, 0xC($sp)
    lw          $s0, 0x8($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end ui_text_line_update

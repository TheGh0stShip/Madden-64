.text
.align 2
.set noreorder
.globl packed_command_measure
.ent packed_command_measure
packed_command_measure:
    lbu         $a2, 0x0($a0)
    addu        $t6, $zero, $zero
    addu        $v1, $a2, $zero
    beqz        $v1, .L80031AE0
    addu        $t5, $zero, $zero
    addiu       $v0, $zero, 0x1
    beql        $v1, $v0, .L80031AEC
    addu        $t3, $zero, $zero
    j .L80031AF4
    addu        $v0, $a0, $t2
.L80031AE0:
    addu        $t3, $zero, $zero
    j .L80031AF0
    addiu       $t2, $zero, 0x1
.L80031AEC:
    addiu       $t2, $zero, 0x4
.L80031AF0:
    addu        $v0, $a0, $t2
.L80031AF4:
    lbu         $v1, 0x0($v0)
    beqz        $v1, .L80031C18
    addiu       $t2, $t2, 0x1
    addu        $t7, $a2, $zero
    slti        $t8, $t7, 0x2
    addu        $t9, $zero, $zero
    addu        $t1, $t2, $a0
.L80031B10:
    andi        $v0, $v1, 0x80
    beqz        $v0, .L80031B88
    nop
    beql        $t8, $zero, .L80031B34
    addu        $v1, $t6, $zero
    bltz        $t7, .L80031B30
    andi        $v0, $v1, 0x7F
    andi        $t6, $v0, 0xFF
.L80031B30:
    addu        $v1, $t6, $zero
.L80031B34:
    slt         $v0, $t9, $v1
    beqz        $v0, .L80031C08
    addu        $t0, $zero, $zero
    addu        $t4, $v1, $zero
    addu        $a3, $t3, $a1
    addu        $a2, $t2, $a0
.L80031B4C:
    lbu         $v1, 0x0($a2)
    addiu       $a2, $a2, 0x1
    addiu       $t1, $t1, 0x1
    addiu       $t2, $t2, 0x1
    addiu       $t3, $t3, 0x1
    addiu       $v0, $t0, 0x1
    addu        $t0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t4
    sb          $v1, 0x0($a3)
    bnez        $v0, .L80031B4C
    addiu       $a3, $a3, 0x1
    j .L80031C08
    nop
.L80031B88:
    beql        $t8, $zero, .L80031BBC
    addu        $v1, $t6, $zero
    bltzl       $t7, .L80031BBC
    addu        $v1, $t6, $zero
    andi        $t6, $v1, 0xFF
    lbu         $v1, 0x0($t1)
    lbu         $v0, 0x1($t1)
    addiu       $t1, $t1, 0x2
    addiu       $t2, $t2, 0x2
    sll         $v0, $v0, 8
    addu        $t5, $v1, $v0
    subu        $t5, $t3, $t5
    addu        $v1, $t6, $zero
.L80031BBC:
    slt         $v0, $t9, $v1
    beqz        $v0, .L80031C08
    addu        $t0, $zero, $zero
    addu        $a3, $v1, $zero
    addu        $a2, $t3, $a1
.L80031BD0:
    addiu       $t3, $t3, 0x1
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    addu        $v0, $t5, $v0
    addu        $v0, $a1, $v0
    lbu         $v1, 0x0($v0)
    addiu       $v0, $t0, 0x1
    addu        $t0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a3
    sb          $v1, 0x0($a2)
    bnez        $v0, .L80031BD0
    addiu       $a2, $a2, 0x1
.L80031C08:
    lbu         $v1, 0x0($t1)
    addiu       $t1, $t1, 0x1
    bnez        $v1, .L80031B10
    addiu       $t2, $t2, 0x1
.L80031C18:
    jr          $ra
    addu        $v0, $t3, $zero
.end packed_command_measure

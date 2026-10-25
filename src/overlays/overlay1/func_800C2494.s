.text
.align 2
.set noreorder
.globl func_800C2494
.ent func_800C2494
func_800C2494:
    addiu       $sp, $sp, -0x18
    addu        $t0, $a0, $zero
    sw          $ra, 0x10($sp)
    lbu         $v0, 0x1E($t0)
    addu        $t1, $a1, $zero
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $v0, 0x2DB4($at)
    addu        $a2, $zero, $zero
    lbu         $a0, 0x1F($t0)
    lw          $v1, 0x8($v0)
    sll         $v0, $a2, 16
.L800C24E8:
    sra         $v0, $v0, 16
    addu        $v0, $v1, $v0
    lbu         $v0, 0x0($v0)
    beq         $a0, $v0, .L800C2514
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, .L800C24E8
    sll         $v0, $a2, 16
.L800C2514:
    sll         $a1, $a2, 16
    sra         $a1, $a1, 16
    xori        $a1, $a1, 0xA
    sltu        $a1, $zero, $a1
    negu        $a1, $a1
    lbu         $v1, 0x1E($t0)
    and         $a1, $a2, $a1
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x5040
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DB4($at)
    sll         $a0, $a0, 2
    subu        $a0, $a0, $v1
    lw          $a3, 0x8($v0)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sll         $a0, $a0, 3
    addu        $a0, $a0, $a2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $v0, 0x0($v0)
    lbu         $v0, 0x21($v0)
    addu        $a2, $a1, $zero
    addiu       $a1, $zero, 0x40
    andi        $v0, $v0, 0xC0
    bne         $v0, $a1, .L800C2604
    nop
.L800C25B8:
    addiu       $v1, $a2, 0x1
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    xori        $v0, $v0, 0xA
    sltu        $v0, $zero, $v0
    negu        $v0, $v0
    and         $v1, $v1, $v0
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $v0, 0x0($v0)
    lbu         $v0, 0x21($v0)
    andi        $v0, $v0, 0xC0
    beq         $v0, $a1, .L800C25B8
    addu        $a2, $v1, $zero
    lbu         $v1, 0x1E($t0)
.L800C2604:
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5040
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DB4($at)
    sll         $a0, $a0, 2
    subu        $a0, $a0, $v1
    lw          $v1, 0x8($v0)
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    addu        $v1, $v1, $v0
    lbu         $v0, 0x0($v1)
    sll         $a0, $a0, 3
    addu        $a0, $a0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $a0, 0x0($v0)
    jal         func_800BFF9C
    andi        $a1, $t1, 0xFFFF
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C2494

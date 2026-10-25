.text
.align 2
.set noreorder
.globl audio_table_decode_secondary
.ent audio_table_decode_secondary
audio_table_decode_secondary:
    addiu       $sp, $sp, -0x18
    addu        $t3, $a0, $zero
    addu        $t0, $zero, $zero
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x2BF8
    lwl         $v0, 0x0($a1)
    lwr         $v0, 0x3($a1)
    lwl         $v1, 0x4($a1)
    lwr         $v1, 0x7($a1)
    lwl         $a0, 0x8($a1)
    lwr         $a0, 0xB($a1)
    swl         $v0, 0x0($sp)
    swr         $v0, 0x3($sp)
    swl         $v1, 0x4($sp)
    swr         $v1, 0x7($sp)
    swl         $a0, 0x8($sp)
    swr         $a0, 0xB($sp)
    lwl         $v0, 0xC($a1)
    lwr         $v0, 0xF($a1)
    lwl         $v1, 0x10($a1)
    lwr         $v1, 0x13($a1)
    lh          $a0, 0x14($a1)
    swl         $v0, 0xC($sp)
    swr         $v0, 0xF($sp)
    swl         $v1, 0x10($sp)
    swr         $v1, 0x13($sp)
    sh          $a0, 0x14($sp)
    addu        $t2, $zero, $zero
    lui         $t6, 0x8000
    addiu       $t6, $t6, 0x2C10
    addiu       $t5, $zero, 0x1
    addiu       $t4, $zero, 0x2
    andi        $v1, $t2, 0xFFFF
.L8003B424:
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x3F
    addiu       $a2, $v0, -0xA
    sltiu       $v0, $a2, 0xB
    beqz        $v0, .L8003B638
    sll         $v0, $a2, 2
    addu        $v0, $v0, $t6
    lw          $v0, 0x0($v0)
    jr          $v0
    nop
    sll         $v0, $a2, 1
    addu        $t1, $v0, $sp
    lhu         $a3, 0x0($t1)
    beqz        $a3, .L8003B638
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v1, 0x11($v0)
    lbu         $a1, 0x12($v0)
    lbu         $a2, 0x13($v0)
    lbu         $a0, 0x1B($v0)
    addiu       $v0, $a3, -0x1
    sh          $v0, 0x0($t1)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    addu        $v1, $v1, $a2
    sll         $a0, $a0, 1
    j .L8003B634
    addu        $v1, $v1, $a0
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v1, 0x11($v0)
    lbu         $a0, 0x12($v0)
    lbu         $a1, 0x13($v0)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    lbu         $a0, 0x1B($v0)
    sll         $v0, $a2, 1
    addu        $a2, $v0, $sp
    lhu         $a1, 0x0($a2)
    sll         $a0, $a0, 1
    addu        $v0, $v1, $a0
    andi        $a0, $a1, 0xFFFF
    beql        $a0, $t5, .L8003B50C
    addu        $t0, $t0, $v0
    bnel        $a0, $t4, .L8003B63C
    addiu       $t2, $t2, 0x1
    addu        $t0, $t0, $v0
.L8003B50C:
    addiu       $v0, $a1, -0x1
    j .L8003B638
    sh          $v0, 0x0($a2)
    sll         $v0, $a2, 1
    addu        $t1, $v0, $sp
    lhu         $a3, 0x0($t1)
    beqz        $a3, .L8003B638
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v1, 0x14($v0)
    lbu         $a1, 0x12($v0)
    lbu         $a0, 0x13($v0)
    lbu         $a2, 0x1B($v0)
    addiu       $v0, $a3, -0x1
    sh          $v0, 0x0($t1)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    sll         $a0, $a0, 1
    addu        $v1, $v1, $a0
    j .L8003B634
    addu        $v1, $v1, $a2
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v1, 0x14($v0)
    lbu         $a1, 0x12($v0)
    lbu         $a0, 0x13($v0)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    sll         $a0, $a0, 1
    lbu         $a1, 0x1B($v0)
    sll         $v0, $a2, 1
    addu        $a3, $v0, $sp
    lhu         $a2, 0x0($a3)
    addu        $v1, $v1, $a0
    andi        $a0, $a2, 0xFFFF
    beq         $a0, $t5, .L8003B5C8
    addu        $v0, $v1, $a1
    bnel        $a0, $t4, .L8003B63C
    addiu       $t2, $t2, 0x1
    j .L8003B5D0
    addu        $t0, $t0, $v0
.L8003B5C8:
    srl         $v0, $v0, 1
    addu        $t0, $t0, $v0
.L8003B5D0:
    addiu       $v0, $a2, -0x1
    j .L8003B638
    sh          $v0, 0x0($a3)
    sll         $v0, $a2, 1
    addu        $a3, $v0, $sp
    lhu         $a2, 0x0($a3)
    beqz        $a2, .L8003B638
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t3
    lbu         $v1, 0x13($v0)
    lbu         $a0, 0x14($v0)
    lbu         $a1, 0x1B($v0)
    addiu       $v0, $a2, -0x1
    sh          $v0, 0x0($a3)
    sll         $v0, $v1, 1
    addu        $v1, $v0, $v1
    sra         $v1, $v1, 1
    srl         $a0, $a0, 1
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $v0
    sll         $a1, $a1, 1
    addu        $v1, $v1, $a1
.L8003B634:
    addu        $t0, $t0, $v1
.L8003B638:
    addiu       $t2, $t2, 0x1
.L8003B63C:
    andi        $v0, $t2, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L8003B424
    andi        $v1, $t2, 0xFFFF
    sll         $v0, $t0, 1
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    lui         $v1, 0x8184
    ori         $v1, $v1, 0x8DA9
    .word       0x00430019  # multu       $v0, $v1
    .word       0x00007810  # mfhi        $t7
    lui         $v0, 0xD20D
    ori         $v0, $v0, 0x20D3
    srl         $v1, $t7, 8
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00007810  # mfhi        $t7
    srl         $v0, $t7, 5
    sll         $v0, $v0, 1
    addiu       $t0, $v0, -0x23
    sltiu       $v0, $t0, 0x65
    beql        $v0, $zero, .L8003B69C
    addiu       $t0, $zero, 0x64
.L8003B69C:
    andi        $v0, $t0, 0xFFFF
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end audio_table_decode_secondary

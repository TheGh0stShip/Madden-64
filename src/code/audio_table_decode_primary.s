.text
.align 2
.set noreorder
.globl audio_table_decode_primary
.ent audio_table_decode_primary
audio_table_decode_primary:
    addiu       $sp, $sp, -0x18
    addu        $t4, $a0, $zero
    addu        $t0, $zero, $zero
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x2BB8
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
    swl         $v0, 0xC($sp)
    swr         $v0, 0xF($sp)
    swl         $v1, 0x10($sp)
    swr         $v1, 0x13($sp)
    addu        $t3, $zero, $zero
    lui         $t7, 0x8000
    addiu       $t7, $t7, 0x2BD0
    addiu       $t6, $zero, 0x1
    addiu       $t5, $zero, 0x2
    andi        $v1, $t3, 0xFFFF
.L8003B0A8:
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v0, 0xE($v0)
    andi        $a3, $v0, 0x3F
    sltiu       $v0, $a3, 0xA
    beqz        $v0, .L8003B340
    sll         $v0, $a3, 2
    addu        $v0, $v0, $t7
    lw          $v0, 0x0($v0)
    jr          $v0
    nop
    sll         $v0, $a3, 1
    addu        $t1, $v0, $sp
    lhu         $a3, 0x0($t1)
    beqz        $a3, .L8003B340
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x16($v0)
    lbu         $a0, 0x17($v0)
    lbu         $a1, 0x12($v0)
    lbu         $a2, 0x13($v0)
    addiu       $v0, $a3, -0x1
    sh          $v0, 0x0($t1)
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    j .L8003B33C
    addu        $v1, $v1, $a2
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x11($v0)
    lbu         $a0, 0x12($v0)
    lbu         $a1, 0x14($v0)
    lbu         $a2, 0x15($v0)
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    addu        $v1, $v1, $a2
    lbu         $a0, 0x13($v0)
    lbu         $a1, 0x1A($v0)
    sll         $v0, $a3, 1
    addu        $a3, $v0, $sp
    lhu         $a2, 0x0($a3)
    addu        $v1, $v1, $a0
    andi        $v0, $a2, 0xFFFF
    beq         $v0, $t6, .L8003B2D4
    addu        $v1, $v1, $a1
    bnel        $v0, $t5, .L8003B344
    addiu       $t3, $t3, 0x1
    j .L8003B2DC
    addu        $t0, $t0, $v1
    sll         $v0, $a3, 1
    addu        $t2, $v0, $sp
    lhu         $t1, 0x0($t2)
    beqz        $t1, .L8003B340
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x1A($v0)
    lbu         $a0, 0x15($v0)
    lbu         $a1, 0x12($v0)
    lbu         $a2, 0x1D($v0)
    lbu         $a3, 0x1E($v0)
    addiu       $v0, $t1, -0x1
    sh          $v0, 0x0($t2)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    addu        $v1, $v1, $a2
    j .L8003B33C
    addu        $v1, $v1, $a3
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x13($v0)
    lbu         $a0, 0x12($v0)
    lbu         $a1, 0x14($v0)
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $a1
    lbu         $a0, 0x1A($v0)
    sll         $v0, $a3, 1
    addu        $a3, $v0, $sp
    lhu         $a2, 0x0($a3)
    sll         $v1, $v1, 1
    andi        $a1, $a2, 0xFFFF
    beq         $a1, $t5, .L8003B26C
    addu        $v1, $v1, $a0
    slti        $v0, $a1, 0x3
    beql        $v0, $zero, .L8003B24C
    addiu       $v0, $zero, 0x3
    beq         $a1, $t6, .L8003B2D8
    srl         $v0, $v1, 1
    j .L8003B344
    addiu       $t3, $t3, 0x1
.L8003B24C:
    beq         $a1, $v0, .L8003B264
    addiu       $v0, $zero, 0x4
    bnel        $a1, $v0, .L8003B344
    addiu       $t3, $t3, 0x1
    j .L8003B2DC
    addu        $t0, $t0, $v1
.L8003B264:
    j .L8003B2DC
    addu        $t0, $t0, $v1
.L8003B26C:
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    j .L8003B2D8
    srl         $v0, $v0, 2
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x1E($v0)
    lbu         $a0, 0x12($v0)
    lbu         $a1, 0x14($v0)
    sll         $v0, $a3, 1
    addu        $a3, $v0, $sp
    lhu         $a2, 0x0($a3)
    sll         $v1, $v1, 1
    addu        $a0, $a0, $v1
    sll         $v1, $a1, 1
    addu        $v1, $v1, $a1
    andi        $v0, $a2, 0xFFFF
    beq         $v0, $t6, .L8003B2D4
    addu        $v1, $a0, $v1
    bnel        $v0, $t5, .L8003B344
    addiu       $t3, $t3, 0x1
    j .L8003B2DC
    addu        $t0, $t0, $v1
.L8003B2D4:
    srl         $v0, $v1, 1
.L8003B2D8:
    addu        $t0, $t0, $v0
.L8003B2DC:
    addiu       $v0, $a2, -0x1
    j .L8003B340
    sh          $v0, 0x0($a3)
    sll         $v0, $a3, 1
    addu        $t1, $v0, $sp
    lhu         $a3, 0x0($t1)
    beqz        $a3, .L8003B340
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t4
    lbu         $v1, 0x11($v0)
    lbu         $a2, 0x13($v0)
    lbu         $a0, 0x1D($v0)
    lbu         $a1, 0x1E($v0)
    addiu       $v0, $a3, -0x1
    sh          $v0, 0x0($t1)
    addu        $v1, $v1, $a2
    sll         $a0, $a0, 1
    addu        $v1, $v1, $a0
    sll         $a1, $a1, 1
    addu        $v1, $v1, $a1
    sra         $v1, $v1, 1
.L8003B33C:
    addu        $t0, $t0, $v1
.L8003B340:
    addiu       $t3, $t3, 0x1
.L8003B344:
    andi        $v0, $t3, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L8003B0A8
    andi        $v1, $t3, 0xFFFF
    sll         $v0, $t0, 1
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    lui         $v1, 0x8184
    ori         $v1, $v1, 0x8DA9
    .word       0x00430019  # multu       $v0, $v1
    .word       0x0000C010  # mfhi        $t8
    srl         $v0, $t8, 13
    sll         $v0, $v0, 1
    addiu       $t0, $v0, -0x28
    sltiu       $v0, $t0, 0x65
    beql        $v0, $zero, .L8003B390
    addiu       $t0, $zero, 0x64
.L8003B390:
    andi        $v0, $t0, 0xFFFF
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end audio_table_decode_primary

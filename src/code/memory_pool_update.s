.text
.align 2
.set noreorder
.globl memory_pool_update
.ent memory_pool_update
memory_pool_update:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lb          $v0, 0x5($s0)
    bnez        $v0, .L80037024
    addu        $s1, $a1, $zero
    lbu         $v0, 0x4($s0)
    andi        $v1, $v0, 0xF
    addiu       $v0, $v1, -0x7
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80037024
    andi        $v0, $v1, 0xFF
    beqz        $v0, .L80037024
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L80036FFC
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x2988($at)
    jr          $v0
    nop
    addu        $a0, $s0, $zero
    jal         func_8003703C
    addu        $a1, $s1, $zero
    addu        $a0, $s0, $zero
    lhu         $v1, 0x2($s1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 13
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x72C8
    lui         $at, 0x8008
    sh          $v1, 0x7A60($at)
    jal         func_800C7FF8
    addu        $a1, $v0, $a1
    lbu         $v0, 0x4($s0)
    andi        $v0, $v0, 0xF0
    ori         $v0, $v0, 0x2
    j .L80036FFC
    sb          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    jal         func_8003703C
    addu        $a1, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 13
    lbu         $v1, 0x2($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $a0, -0x72C8($at)
    addu        $v1, $v1, $a0
    sb          $v1, 0x2($s0)
    lbu         $v1, 0x4($s0)
    lbu         $a0, 0x3($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $v0, -0x72C7($at)
    andi        $v1, $v1, 0xF0
    j .L80036FF0
    ori         $v1, $v1, 0x3
    addu        $a0, $s0, $zero
    jal         func_8003703C
    addu        $a1, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 13
    lbu         $v1, 0x2($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $a0, -0x72C6($at)
    addu        $v1, $v1, $a0
    sb          $v1, 0x2($s0)
    lbu         $v1, 0x4($s0)
    lbu         $a0, 0x3($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $v0, -0x72C5($at)
    andi        $v1, $v1, 0xF0
    j .L80036FF0
    ori         $v1, $v1, 0x4
    addu        $a0, $s0, $zero
    jal         func_8003703C
    addu        $a1, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 13
    lbu         $v1, 0x2($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $a0, -0x72C4($at)
    addu        $v1, $v1, $a0
    sb          $v1, 0x2($s0)
    lbu         $v1, 0x4($s0)
    lbu         $a0, 0x3($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $v0, -0x72C3($at)
    andi        $v1, $v1, 0xF0
    j .L80036FF0
    ori         $v1, $v1, 0x5
    addu        $a0, $s0, $zero
    jal         func_8003703C
    addu        $a1, $s1, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 13
    lbu         $v1, 0x2($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $a0, -0x72C2($at)
    addu        $v1, $v1, $a0
    sb          $v1, 0x2($s0)
    lbu         $v1, 0x4($s0)
    lbu         $a0, 0x3($s0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lbu         $v0, -0x72C1($at)
    andi        $v1, $v1, 0xF0
    ori         $v1, $v1, 0x7
.L80036FF0:
    addu        $a0, $a0, $v0
    sb          $v1, 0x4($s0)
    sb          $a0, 0x3($s0)
.L80036FFC:
    lui         $v1, 0x8008
    lw          $v1, 0x6DD8($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    beq         $v1, $v0, .L80037024
    nop
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x2980
    jal         func_800370B0
    addiu       $a1, $zero, 0x1
.L80037024:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end memory_pool_update

.text
.align 2
.set noreorder
.globl func_800A3AA0
.ent func_800A3AA0
func_800A3AA0:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s0, 0x18($sp)
    lh          $v0, 0x30($s1)
    slti        $v0, $v0, 0x29
    bnez        $v0, .L800A3B68
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lw          $a2, 0x24($s1)
    lw          $v1, 0x1C($a1)
    lw          $v0, 0x1C($a2)
    subu        $a0, $v1, $v0
    bltzl       $a0, .L800A3AE4
    negu        $a0, $a0
.L800A3AE4:
    lw          $v1, 0x20($a1)
    lw          $v0, 0x20($a2)
    subu        $v1, $v1, $v0
    bltzl       $v1, .L800A3AF8
    negu        $v1, $v1
.L800A3AF8:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800A3B14
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_8009F400
    addu        $v1, $v1, $v0
.L800A3B14:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    lui         $v0, 0x9F
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A3B4C
    addiu       $v1, $zero, 0x40
    lw          $v0, 0x38($s1)
    lbu         $v0, 0x21($v0)
    andi        $v0, $v0, 0xC0
    bne         $v0, $v1, .L800A3B68
    nop
.L800A3B4C:
    addiu       $v0, $zero, 0x38
    sb          $v0, 0x10($sp)
    addu        $a0, $s1, $zero
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    j           func_8009F4BC
    addu        $v0, $zero, $zero
.L800A3B68:
    lbu         $a1, 0x1F($s1)
    lui         $at, 0x8007
    addu        $at, $at, $a1
    lb          $s0, -0x6190($at)
    sltiu       $v1, $s0, 0x1
    slti        $v0, $s0, 0x64
    xori        $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800A3BA0
    nop
    jal         func_8009F4D4
    addu        $a0, $s1, $zero
    j           func_8009F4A4
    addiu       $s0, $s0, 0x1
.L800A3BA0:
    lui         $at, 0x8007
    addu        $at, $at, $a1
    lb          $a1, -0x618C($at)
    bltz        $a1, .L800A3BC4
    addu        $a0, $s1, $zero
    sll         $a1, $a1, 25
    sra         $a1, $a1, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
.L800A3BC4:
    addiu       $s0, $s0, 0x1
    lbu         $v1, 0x1F($s1)
    andi        $s0, $s0, 0x3
    addu        $v0, $zero, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v1
    sb          $s0, -0x6190($at)
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A3AA0

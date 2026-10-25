.text
.align 2
.set noreorder
.globl func_8002B344
.ent func_8002B344
func_8002B344:
    addiu       $sp, $sp, -0x38
    sw          $s5, 0x24($sp)
    addu        $s5, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    andi        $a0, $s5, 0xFFFF
    sw          $ra, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    jal         func_8003AA28
    sw          $s1, 0x14($sp)
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x3F
    bnez        $v0, .L8002B394
    slti        $v0, $v0, 0xA
    j .L8002B3A0
    addu        $a0, $zero, $zero
.L8002B394:
    beqz        $v0, .L8002B3A0
    addiu       $a0, $zero, 0x2
    addiu       $a0, $zero, 0x1
.L8002B3A0:
    addu        $s3, $zero, $zero
    addiu       $s7, $zero, 0x7FFF
    addiu       $s6, $zero, 0xF
    andi        $s4, $s5, 0xFFFF
    addu        $s1, $s0, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x451C
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $s2, $v0, $v1
.L8002B3CC:
    lhu         $a1, 0x0($s2)
    beql        $a1, $s7, .L8002B414
    addiu       $s1, $s1, 0x2
    beq         $a1, $s6, .L8002B3F0
    addu        $a0, $s4, $zero
    jal         func_80023F94
    andi        $a0, $s5, 0xFFFF
    j .L8002B410
    sh          $v0, 0x0($s1)
.L8002B3F0:
    jal         func_80023F94
    addiu       $a1, $zero, 0xF
    addu        $a0, $s4, $zero
    addiu       $a1, $zero, 0xB
    jal         func_80023F94
    addu        $s0, $v0, $zero
    addu        $s0, $s0, $v0
    sh          $s0, 0x0($s1)
.L8002B410:
    addiu       $s1, $s1, 0x2
.L8002B414:
    addiu       $s3, $s3, 0x1
    slti        $v0, $s3, 0x5
    bnez        $v0, .L8002B3CC
    addiu       $s2, $s2, 0x2
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8002B344

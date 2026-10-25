.text
.align 2
.set noreorder
.globl image_block_decode
.ent image_block_decode
image_block_decode:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v0, 0x4($s0)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x18
    addu        $s1, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x304
    sw          $s1, 0x1C4($s0)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x24($s0)
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L8005FDB0
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x3400($at)
    jr          $v0
    nop
    lw          $v1, 0x20($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8005FDD8
    nop
    j .L8005FDBC
    nop
    lw          $v1, 0x20($s0)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L8005FDD8
    nop
    j .L8005FDBC
    nop
    lw          $v1, 0x20($s0)
    addiu       $v0, $zero, 0x4
    beq         $v1, $v0, .L8005FDD8
    nop
    j .L8005FDBC
    nop
.L8005FDB0:
    lw          $v0, 0x20($s0)
    bgtz        $v0, .L8005FDD8
    nop
.L8005FDBC:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x8
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L8005FDD8:
    lw          $a1, 0x28($s0)
    addiu       $v0, $zero, 0x2
    beq         $a1, $v0, .L8005FE7C
    sltiu       $v0, $a1, 0x3
    beqz        $v0, .L8005FE00
    addiu       $v0, $zero, 0x1
    beq         $a1, $v0, .L8005FE14
    nop
    j .L8005FED4
    nop
.L8005FE00:
    addiu       $v0, $zero, 0x4
    beq         $a1, $v0, .L8005FEAC
    addiu       $v0, $zero, 0x5
    j .L8005FED4
    nop
.L8005FE14:
    lw          $v1, 0x24($s0)
    xori        $v0, $v1, 0x1
    sltiu       $v0, $v0, 0x1
    xori        $v1, $v1, 0x3
    sltiu       $v1, $v1, 0x1
    or          $v0, $v0, $v1
    beqz        $v0, .L8005FEFC
    sw          $a1, 0x78($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4A0
    sw          $v0, 0x4($s1)
    lw          $v0, 0x20($s0)
    slt         $v0, $a1, $v0
    beqz        $v0, .L8005FF18
    addiu       $a0, $zero, 0x1
    addiu       $v1, $zero, 0x54
.L8005FE54:
    lw          $v0, 0xD8($s0)
    addu        $v0, $v1, $v0
    sw          $zero, 0x30($v0)
    lw          $v0, 0x20($s0)
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $v0
    bnez        $v0, .L8005FE54
    addiu       $v1, $v1, 0x54
    j .L8005FF18
    nop
.L8005FE7C:
    lw          $v1, 0x24($s0)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8005FE9C
    sw          $v0, 0x78($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x668
    j .L8005FEC4
    sw          $v0, 0x4($s1)
.L8005FE9C:
    beq         $v1, $a1, .L8005FEEC
    nop
    j .L8005FEFC
    nop
.L8005FEAC:
    lw          $v1, 0x24($s0)
    bne         $v1, $v0, .L8005FE9C
    sw          $a1, 0x78($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x464
    sw          $v0, 0x4($s1)
.L8005FEC4:
    jal         func_8005F868
    addu        $a0, $s0, $zero
    j .L8005FF18
    nop
.L8005FED4:
    lw          $v1, 0x28($s0)
    lw          $v0, 0x24($s0)
    bne         $v1, $v0, .L8005FEFC
    nop
    lw          $v0, 0x20($s0)
    sw          $v0, 0x78($s0)
.L8005FEEC:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x52C
    j .L8005FF18
    sw          $v0, 0x4($s1)
.L8005FEFC:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x19
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L8005FF18:
    lw          $v0, 0x54($s0)
    bnez        $v0, .L8005FF28
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x78($s0)
.L8005FF28:
    sw          $v0, 0x7C($s0)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end image_block_decode

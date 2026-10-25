.text
.align 2
.set noreorder
.globl image_table_update
.ent image_table_update
image_table_update:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s1, 0x1C8($s2)
    lw          $v1, 0x58($s2)
    lw          $v0, 0x10($s1)
    sw          $v0, 0x88($s2)
    lw          $v0, 0x14($s1)
    sw          $v0, 0x84($s2)
    addiu       $v0, $zero, 0x1
    beql        $v1, $v0, .L80060E04
    addiu       $v0, $zero, 0x3
    beqz        $v1, .L80060DD4
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L80060E5C
    addiu       $v0, $zero, 0x2F
    j .L80060EBC
    nop
.L80060DD4:
    lw          $v1, 0x78($s2)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L80060DF4
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x7CC
    j .L80060ED4
    sw          $v0, 0x4($s1)
.L80060DF4:
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x734
    j .L80060ED4
    sw          $v0, 0x4($s1)
.L80060E04:
    lw          $v1, 0x78($s2)
    bne         $v1, $v0, .L80060E20
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x99C
    j .L80060E2C
    sw          $v0, 0x4($s1)
.L80060E20:
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x870
    sw          $v0, 0x4($s1)
.L80060E2C:
    lw          $v0, 0x1C($s1)
    bnez        $v0, .L80060E40
    sw          $zero, 0x30($s1)
    jal         func_80060370
    addu        $a0, $s2, $zero
.L80060E40:
    lw          $v0, 0x34($s1)
    bnez        $v0, .L80060ED4
    nop
    jal         func_80060680
    addu        $a0, $s2, $zero
    j .L80060ED4
    nop
.L80060E5C:
    lw          $v1, 0x44($s1)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0xADC
    sw          $v0, 0x4($s1)
    bnez        $v1, .L80060E7C
    sw          $zero, 0x54($s1)
    jal         func_80060CF0
    addu        $a0, $s2, $zero
.L80060E7C:
    lw          $v0, 0x70($s2)
    addu        $s0, $zero, $zero
    lw          $v1, 0x78($s2)
    addiu       $v0, $v0, 0x2
    blez        $v1, .L80060ED4
    sll         $s3, $v0, 1
.L80060E94:
    lw          $a0, 0x44($s1)
    jal         func_800632F4
    addu        $a1, $s3, $zero
    lw          $v0, 0x78($s2)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $v0
    bnez        $v0, .L80060E94
    addiu       $s1, $s1, 0x4
    j .L80060ED4
    nop
.L80060EBC:
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80060ED4:
    lw          $ra, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end image_table_update

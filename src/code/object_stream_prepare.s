.text
.align 2
.set noreorder
.globl object_stream_prepare
.ent object_stream_prepare
object_stream_prepare:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x4($s1)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x2C
    addu        $s2, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x2628
    sw          $s2, 0x1C8($s1)
    sw          $v0, 0x0($s2)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x27E0
    sw          $v0, 0xC($s2)
    sw          $zero, 0x20($s2)
    sw          $zero, 0x28($s2)
    lw          $v1, 0x78($s1)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L8006286C
    addiu       $v0, $zero, 0x2E
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L8006286C:
    lw          $v0, 0x4($s1)
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x0($v0)
    addiu       $a2, $zero, 0x80
    jalr        $v0
    addu        $s0, $zero, $zero
    sw          $v0, 0x18($s2)
.L8006288C:
    lw          $v0, 0x4($s1)
    addu        $a0, $s1, $zero
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x1000
    lw          $a0, 0x18($s2)
    sll         $v1, $s0, 2
    addiu       $s0, $s0, 0x1
    addu        $v1, $v1, $a0
    sw          $v0, 0x0($v1)
    slti        $v0, $s0, 0x20
    bnez        $v0, .L8006288C
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x1C($s2)
    lw          $v0, 0x6C($s1)
    beql        $v0, $zero, .L8006295C
    sw          $zero, 0x10($s2)
    lw          $s0, 0x60($s1)
    slti        $v0, $s0, 0x8
    beqz        $v0, .L80062908
    addiu       $v0, $zero, 0x37
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x8
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80062908:
    slti        $v0, $s0, 0x101
    bnez        $v0, .L80062938
    addiu       $v0, $zero, 0x38
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x100
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80062938:
    lw          $v0, 0x4($s1)
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x8($v0)
    addu        $a2, $s0, $zero
    jalr        $v0
    addiu       $a3, $zero, 0x3
    sw          $v0, 0x10($s2)
    sw          $s0, 0x14($s2)
.L8006295C:
    lw          $v0, 0x58($s1)
    beqz        $v0, .L8006296C
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x58($s1)
.L8006296C:
    lw          $v1, 0x58($s1)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800629AC
    addu        $a0, $s1, $zero
    lw          $v0, 0x70($s1)
    addiu       $a1, $zero, 0x1
    lw          $v1, 0x4($s1)
    addiu       $v0, $v0, 0x2
    sll         $a2, $v0, 1
    lw          $v1, 0x4($v1)
    addu        $a2, $a2, $v0
    jalr        $v1
    sll         $a2, $a2, 1
    addu        $a0, $s1, $zero
    jal         func_800624F8
    sw          $v0, 0x20($s2)
.L800629AC:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_stream_prepare

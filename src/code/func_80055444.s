.text
.align 2
.set noreorder
.globl func_80055444
.ent func_80055444
func_80055444:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $v0, 0x10($s0)
    addiu       $v0, $v0, -0xCD
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800554B8
    nop
    lw          $v0, 0x40($s0)
    bnez        $v0, .L800554B8
    nop
    lw          $v0, 0x8C($s0)
    lw          $v1, 0x74($s0)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L800554A0
    addiu       $v0, $zero, 0x42
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L800554A0:
    lw          $v0, 0x1A0($s0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L800554C8
    addiu       $v0, $zero, 0xD2
.L800554B8:
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xCF
    bne         $v1, $v0, .L800554D0
    addiu       $v0, $zero, 0xD2
.L800554C8:
    j .L80055518
    sw          $v0, 0x10($s0)
.L800554D0:
    beq         $v1, $v0, .L80055518
    addiu       $v0, $zero, 0x12
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L80055518
    nop
.L80055504:
    lw          $v0, 0x0($v1)
    jalr        $v0
    addu        $a0, $s0, $zero
    beqz        $v0, .L80055544
    addu        $v0, $zero, $zero
.L80055518:
    lw          $v1, 0x1B0($s0)
    lw          $v0, 0x14($v1)
    beqz        $v0, .L80055504
    nop
    lw          $v0, 0x14($s0)
    lw          $v0, 0x18($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    jal         func_80063318
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x1
.L80055544:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80055444

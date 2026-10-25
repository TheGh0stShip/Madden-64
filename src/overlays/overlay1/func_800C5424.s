.text
.align 2
.set noreorder
.globl func_800C5424
.ent func_800C5424
func_800C5424:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $a0, 0x24($s0)
    addu        $s1, $a1, $zero
    lw          $v0, 0x14($a0)
    lui         $v1, 0x1
    and         $v0, $v0, $v1
    bnez        $v0, .L800C54DC
    addu        $a1, $zero, $zero
    addu        $a1, $s1, $zero
    jal         func_800352D8
    addu        $a2, $zero, $zero
    addu        $a1, $v0, $zero
    andi        $v1, $a1, 0xFFFF
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800C549C
    slti        $v0, $v1, 0x3
    beql        $v0, $zero, .L800C548C
    addiu       $v0, $zero, 0x3
    bltz        $v1, .L800C54E0
    andi        $v0, $a1, 0xFFFF
    j           func_800C0DB8
    addu        $a1, $zero, $zero
.L800C548C:
    bne         $v1, $v0, .L800C54E0
    andi        $v0, $a1, 0xFFFF
    j           func_800C0DB8
    addu        $a1, $zero, $zero
.L800C549C:
    lw          $a0, 0x24($s0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0xFFC3
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lw          $v0, 0x24($s0)
    lw          $v0, 0x8($v0)
    lhu         $a0, 0x14($v0)
    addiu       $a1, $zero, 0x1
    sll         $v0, $s1, 16
    andi        $v1, $a0, 0xFF00
    or          $v0, $v0, $v1
    andi        $a0, $a0, 0xFF
    or          $v0, $v0, $a0
    sw          $v0, 0x2C($s0)
.L800C54DC:
    andi        $v0, $a1, 0xFFFF
.L800C54E0:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C5424

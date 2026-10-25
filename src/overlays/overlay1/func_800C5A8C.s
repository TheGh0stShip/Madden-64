.text
.align 2
.set noreorder
.globl func_800C5A8C
.ent func_800C5A8C
func_800C5A8C:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x18($sp)
    lui         $s0, 0x8008
    lw          $s0, 0x55F8($s0)
    addiu       $v0, $zero, 0xD
    sw          $ra, 0x20($sp)
    sw          $s1, 0x1C($sp)
    beqz        $s0, .L800C5B0C
    sb          $v0, 0x10($sp)
    lui         $s1, 0x1
.L800C5AB4:
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800C5AD8
    nop
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    and         $v0, $v0, $s1
    beqz        $v0, .L800C5AF8
    addu        $a0, $s0, $zero
.L800C5AD8:
    lbu         $v1, 0x68($s0)
    lbu         $v0, 0x10($sp)
    beq         $v1, $v0, .L800C5B00
    addu        $a0, $s0, $zero
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    j           func_800C13DC
    nop
.L800C5AF8:
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
.L800C5B00:
    lw          $s0, 0x0($s0)
    bnez        $s0, .L800C5AB4
    nop
.L800C5B0C:
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5A8C

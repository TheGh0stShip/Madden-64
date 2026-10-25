.text
.align 2
.set noreorder
.globl func_8009D9D0
.ent func_8009D9D0
func_8009D9D0:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($a0)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8009DA68
    nop
    beqz        $v1, .L8009DA08
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8009DA80
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8009DA80
    nop
.L8009DA08:
    lhu         $v0, 0x3A($s0)
    andi        $v0, $v0, 0x2000
    bnez        $v0, .L8009DA48
    nop
    lw          $a1, 0xC($s0)
    beqz        $a1, .L8009DA30
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0xC($s0)
.L8009DA30:
    lw          $a1, 0x10($s0)
    beqz        $a1, .L8009DA48
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x10($s0)
.L8009DA48:
    lw          $a1, 0x4($s0)
    beqz        $a1, .L8009DA80
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x8($s0)
    j           func_8009935C
    sw          $zero, 0x4($s0)
.L8009DA68:
    lw          $a1, 0xC($s0)
    beqz        $a1, .L8009DA80
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0xC($s0)
.L8009DA80:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009D9D0

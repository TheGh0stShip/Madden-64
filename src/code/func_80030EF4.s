.text
.align 2
.set noreorder
.globl func_80030EF4
.ent func_80030EF4
func_80030EF4:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x20($sp)
    addu        $s0, $a1, $zero
    sw          $s1, 0x24($sp)
    addu        $s1, $a2, $zero
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    bgez        $a0, .L80030F2C
    sw          $ra, 0x28($sp)
    addiu       $a0, $sp, 0x10
    jal         func_8003112C
    addiu       $a1, $sp, 0x11
    j .L80030F38
    nop
.L80030F2C:
    addiu       $a1, $sp, 0x10
    jal         func_80031040
    addiu       $a2, $sp, 0x11
.L80030F38:
    lbu         $v1, 0x10($sp)
    lbu         $v0, 0x11($sp)
    sll         $v1, $v1, 24
    sra         $v1, $v1, 26
    negu        $v0, $v0
    sll         $v0, $v0, 24
    sra         $v0, $v0, 26
    sb          $v1, 0x10($sp)
    bgez        $v1, .L80030F74
    sb          $v0, 0x11($sp)
    addiu       $v0, $v1, 0x2
    blez        $v0, .L80030F84
    sb          $v0, 0x10($sp)
    j .L80030F84
    sb          $zero, 0x10($sp)
.L80030F74:
    addiu       $v0, $v1, -0x2
    bgez        $v0, .L80030F84
    sb          $v0, 0x10($sp)
    sb          $zero, 0x10($sp)
.L80030F84:
    lbu         $v0, 0x10($sp)
    addiu       $v0, $v0, 0x10
    sb          $v0, 0x10($sp)
    sll         $v0, $v0, 24
    bltzl       $v0, .L80030F9C
    sb          $zero, 0x10($sp)
.L80030F9C:
    lb          $v0, 0x10($sp)
    slti        $v0, $v0, 0x20
    bnez        $v0, .L80030FB0
    addiu       $v0, $zero, 0x1F
    sb          $v0, 0x10($sp)
.L80030FB0:
    lb          $v0, 0x11($sp)
    bgez        $v0, .L80030FD8
    addu        $v1, $v0, $zero
    addiu       $v0, $v1, 0x2
    sb          $v0, 0x11($sp)
    sll         $v0, $v0, 24
    blez        $v0, .L80030FEC
    nop
    j .L80030FEC
    sb          $zero, 0x11($sp)
.L80030FD8:
    addiu       $v0, $v1, -0x2
    sb          $v0, 0x11($sp)
    sll         $v0, $v0, 24
    bltzl       $v0, .L80030FEC
    sb          $zero, 0x11($sp)
.L80030FEC:
    lbu         $v0, 0x11($sp)
    addiu       $v0, $v0, 0x10
    sb          $v0, 0x11($sp)
    sll         $v0, $v0, 24
    bltzl       $v0, .L80031004
    sb          $zero, 0x11($sp)
.L80031004:
    lb          $v0, 0x11($sp)
    slti        $v0, $v0, 0x20
    bnez        $v0, .L80031018
    addiu       $v0, $zero, 0x1F
    sb          $v0, 0x11($sp)
.L80031018:
    lbu         $v0, 0x10($sp)
    sb          $v0, 0x0($s0)
    lbu         $v0, 0x11($sp)
    sb          $v0, 0x0($s1)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80030EF4

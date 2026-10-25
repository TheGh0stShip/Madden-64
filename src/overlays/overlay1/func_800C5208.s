.text
.align 2
.set noreorder
.globl func_800C5208
.ent func_800C5208
func_800C5208:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x24($sp)
    lw          $v0, 0x24($s0)
    lw          $v1, 0x2C($v0)
    lw          $v0, 0x30($v0)
    addu        $v1, $v1, $v0
    slti        $v1, $v1, 0x3000
    bnel        $v1, $zero, .L800C5234
    addiu       $a2, $a2, 0x1800
.L800C5234:
    sll         $a0, $a1, 16
    sra         $a0, $a0, 16
    addiu       $a1, $sp, 0x10
    jal         func_800B9274
    addiu       $a2, $a2, 0x1745
    sw          $zero, 0x18($sp)
    lw          $a0, 0x24($s0)
    jal         func_800B9184
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x24($s0)
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    jal         func_800C16A0
    sra         $a1, $v0, 16
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5208

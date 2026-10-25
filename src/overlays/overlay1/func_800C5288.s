.text
.align 2
.set noreorder
.globl func_800C5288
.ent func_800C5288
func_800C5288:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    lui         $v0, 0x2
    addu        $a1, $a1, $v0
    sw          $ra, 0x24($sp)
    sw          $a1, 0x18($sp)
    sw          $zero, 0x10($sp)
    sw          $zero, 0x14($sp)
    lw          $a0, 0x24($s0)
    jal         func_800B9184
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x24($s0)
    lw          $v1, 0x18($sp)
    lw          $v0, 0x24($a0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x24($a0)
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5288

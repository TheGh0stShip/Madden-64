.text
.align 2
.set noreorder
.globl func_8009BFAC
.ent func_8009BFAC
func_8009BFAC:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x14($sp)
    lw          $a1, 0x8($s0)
    addiu       $a2, $zero, 0x14
    jal         func_80033308
    addu        $a3, $zero, $zero
    sw          $zero, 0x24($s0)
    sw          $zero, 0x20($s0)
    sw          $zero, 0x1C($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009BFAC

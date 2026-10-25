.text
.align 2
.set noreorder
.globl func_8009B918
.ent func_8009B918
func_8009B918:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    addu        $a2, $a0, $zero
    addu        $a0, $a1, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, 0x7224
    jal         func_80008F30
    addiu       $a3, $zero, 0x32
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009B918

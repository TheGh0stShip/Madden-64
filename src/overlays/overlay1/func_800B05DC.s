.text
.align 2
.set noreorder
.globl func_800B05DC
.ent func_800B05DC
func_800B05DC:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x22BC
    sw          $zero, 0x10($sp)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x5
    addiu       $a2, $zero, 0x1
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
    j           func_800AC510
    nop
.end func_800B05DC

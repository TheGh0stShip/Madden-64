.text
.align 2
.set noreorder
.globl func_800A36A0
.ent func_800A36A0
func_800A36A0:
    sll         $a0, $a0, 2
    subu        $a0, $a0, $a3
    sll         $a0, $a0, 4
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    addu        $a0, $a0, $v0
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A36A0

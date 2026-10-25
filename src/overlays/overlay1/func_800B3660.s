.text
.align 2
.set noreorder
.globl func_800B3660
.ent func_800B3660
func_800B3660:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_800AD404
    nop
    jal         func_800AD4F8
    nop
    jal         func_800AD460
    nop
    jal         func_800AD49C
    nop
    addiu       $a0, $zero, 0x9
    jal         func_800ABCA0
    addu        $a1, $zero, $zero
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B3660

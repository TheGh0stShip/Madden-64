.text
.align 2
.set noreorder
.globl func_800B69C8
.ent func_800B69C8
func_800B69C8:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $a0, 0x0($s1)
    jal         func_80016FE4
    addu        $s0, $a1, $zero
    lw          $a0, 0x4($s1)
    jal         func_80016FE4
    andi        $s0, $s0, 0xFF
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    lw          $a0, 0x0($s0)
    jal         func_80016FE4
    nop
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B69C8

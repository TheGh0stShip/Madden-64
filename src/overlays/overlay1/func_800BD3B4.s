.text
.align 2
.set noreorder
.globl func_800BD3B4
.ent func_800BD3B4
func_800BD3B4:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $a1, 0xFFFF
    sw          $ra, 0x18($sp)
    jal         func_800B8EB0
    addu        $a1, $s0, $zero
    addu        $a0, $s1, $zero
    jal         func_800B8DD8
    addu        $a1, $s0, $zero
    addu        $a0, $s1, $zero
    jal         func_800B8CE4
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFFFF
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BD3B4

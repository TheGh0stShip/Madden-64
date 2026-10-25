.text
.align 2
.set noreorder
.globl func_800C6570
.ent func_800C6570
func_800C6570:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $ra, 0x1C($sp)
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
.L800C6590:
    addu        $a0, $s1, $zero
.L800C6594:
    addu        $a1, $s0, $zero
    jal         func_800C2210
    addu        $a2, $s2, $zero
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0x37
    bnez        $v0, .L800C6594
    addu        $a0, $s1, $zero
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x2
    bnez        $v0, .L800C6590
    addu        $s0, $zero, $zero
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C6570

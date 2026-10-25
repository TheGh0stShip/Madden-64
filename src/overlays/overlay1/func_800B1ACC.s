.text
.align 2
.set noreorder
.globl func_800B1ACC
.ent func_800B1ACC
func_800B1ACC:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    addu        $a0, $a1, $zero
    sw          $ra, 0x18($sp)
    jal         func_80039750
    sw          $s0, 0x10($sp)
    jal         func_800AE65C
    addu        $s0, $v0, $zero
    andi        $s0, $s0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    bne         $s0, $v0, .L800B1B10
    addu        $v0, $s1, $zero
    jal         func_800AE680
    nop
    addu        $s1, $v0, $zero
    addu        $v0, $s1, $zero
.L800B1B10:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B1ACC

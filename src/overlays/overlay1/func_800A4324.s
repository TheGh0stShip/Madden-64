.text
.align 2
.set noreorder
.globl func_800A4324
.ent func_800A4324
func_800A4324:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    jal         func_800A1844
    addu        $a0, $zero, $zero
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
    addu        $v0, $zero, $zero
    sw          $zero, 0x8C($s0)
    sw          $zero, 0x9C($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A4324

.text
.align 2
.set noreorder
.globl func_800BD370
.ent func_800BD370
func_800BD370:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lhu         $a0, 0x2($s0)
    jal         func_80031A1C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s0
    lw          $v0, 0x4($v0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
    nop
.end func_800BD370

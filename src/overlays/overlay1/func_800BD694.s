.text
.align 2
.set noreorder
.globl func_800BD694
.ent func_800BD694
func_800BD694:
    lw          $v1, 0x30($s1)
    sra         $v0, $v0, 8
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($s1)
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800BD694

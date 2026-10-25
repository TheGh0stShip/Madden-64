.text
.align 2
.set noreorder
.globl func_800B2DF8
.ent func_800B2DF8
func_800B2DF8:
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6CB0($at)
    jal         func_80016FE4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x6CB0($v0)
    lw          $ra, 0x38($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800B2DF8

.text
.align 2
.set noreorder
.globl func_800B7004
.ent func_800B7004
func_800B7004:
    lui         $v1, 0x8009
    lw          $v1, -0x79E0($v1)
    lw          $ra, 0x10($sp)
    addu        $v0, $v1, $zero
    jr          $ra
    addiu       $sp, $sp, 0x18
.end func_800B7004

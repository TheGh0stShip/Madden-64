.text
.align 2
.set noreorder
.globl func_800BD734
.ent func_800BD734
func_800BD734:
    lw          $v0, 0x0($a2)
    lw          $a0, 0x10($sp)
    lui         $v1, 0x8008
    lw          $v1, 0x7A74($v1)
    lw          $a1, 0x14($sp)
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $a1
    sw          $v0, 0x0($a2)
    lui         $at, 0x8008
    sw          $v1, 0x7A74($at)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800BD734

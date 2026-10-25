.text
.align 2
.set noreorder
.globl func_800AA370
.ent func_800AA370
func_800AA370:
    lw          $v1, 0xB8($s1)
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L800AA380
    sw          $v1, 0x20($s1)
.L800AA380:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AA370

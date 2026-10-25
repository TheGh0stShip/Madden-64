.text
.align 2
.set noreorder
.globl func_800B970C
.ent func_800B970C
func_800B970C:
    nop
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lui         $a1, 0x8008
    lw          $a1, 0x7128($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800B970C

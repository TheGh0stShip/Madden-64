.text
.align 2
.set noreorder
.globl func_800B1CAC
.ent func_800B1CAC
func_800B1CAC:
    lui         $v0, 0x8008
    lb          $v0, 0x7AF2($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    bnez        $v0, .L800B1CE0
    sw          $ra, 0x14($sp)
    jal         func_800AD404
    nop
    jal         func_800AD460
    nop
    jal         func_8002FF70
    addu        $a0, $s0, $zero
.L800B1CE0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1CAC

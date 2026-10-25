.text
.align 2
.set noreorder
.globl func_800A0FE8
.ent func_800A0FE8
func_800A0FE8:
    jal         func_8009C9E8
    nop
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F48
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0xF
    jal         func_800AE924
    sh          $v0, 0x20($sp)
    lw          $ra, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800A0FE8

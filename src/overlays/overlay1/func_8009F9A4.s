.text
.align 2
.set noreorder
.globl func_8009F9A4
.ent func_8009F9A4
func_8009F9A4:
    addiu       $sp, $sp, -0x28
    addiu       $a2, $a2, 0x2
    addiu       $v0, $zero, 0x48
    sb          $v0, 0x16($sp)
    addiu       $v0, $zero, 0x8C
    sb          $a1, 0x14($sp)
    addiu       $a1, $sp, 0x10
    sw          $ra, 0x20($sp)
    sw          $zero, 0x10($sp)
    sb          $a2, 0x15($sp)
    sb          $v0, 0x17($sp)
    jal         func_800442F4
    sb          $a3, 0x18($sp)
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8009F9A4

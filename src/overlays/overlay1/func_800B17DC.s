.text
.align 2
.set noreorder
.globl func_800B17DC
.ent func_800B17DC
func_800B17DC:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    jal         func_80028F34
    nop
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F08
    sw          $v0, 0x10($sp)
    jal         func_800AE924
    sh          $zero, 0x20($sp)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B17DC

.text
.align 2
.set noreorder
.globl func_800B1A90
.ent func_800B1A90
func_800B1A90:
    addiu       $sp, $sp, -0x18
    sll         $a0, $a0, 16
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7740
    sra         $a0, $a0, 16
    sw          $ra, 0x14($sp)
    jal         func_800167FC
    addu        $a1, $s0, $zero
    addu        $v0, $s0, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1A90

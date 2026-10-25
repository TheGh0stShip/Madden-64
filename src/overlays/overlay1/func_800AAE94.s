.text
.align 2
.set noreorder
.globl func_800AAE94
.ent func_800AAE94
func_800AAE94:
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $a3, $zero, 0xBFF
    addiu       $v0, $zero, 0x8
    sh          $v0, 0xA($a0)
    jal         func_800A3004
    sw          $v1, 0xC($a0)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AAE94

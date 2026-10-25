.text
.align 2
.set noreorder
.globl func_8009AE7C
.ent func_8009AE7C
func_8009AE7C:
    addiu       $sp, $sp, -0x18
    addu        $v0, $a0, $zero
    addu        $a0, $zero, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $v0, 0xFFFF
    addu        $a1, $s0, $zero
    sw          $ra, 0x14($sp)
    lui         $at, 0x8009
    sh          $v0, -0x503C($at)
    jal         func_80033174
    addiu       $a2, $zero, 0x8
    addu        $a0, $zero, $zero
    sll         $s0, $s0, 2
    lui         $at, 0x8009
    sw          $v0, -0x4F94($at)
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    lui         $at, 0x8008
    sw          $a1, 0x7958($at)
    jal         func_80033308
    addu        $a3, $zero, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009AE7C

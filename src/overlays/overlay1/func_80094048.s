.text
.align 2
.set noreorder
.globl func_80094048
.ent func_80094048
func_80094048:
    addiu       $sp, $sp, -0x18
    addu        $a0, $zero, $zero
    sw          $ra, 0x14($sp)
    jal         func_8000BEE8
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6CE8
    addu        $a0, $s0, $zero
    jal         func_800A6590
    addu        $a1, $zero, $zero
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x6CF4($at)
    jal         func_800A3004
    addiu       $a3, $zero, 0xBFF
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x5
    beq         $v1, $v0, .L800940C0
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    lui         $a1, 0x8008
    lh          $a1, -0x7D14($a1)
    jal         func_80035F88
    nop
.L800940C0:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x460
    addiu       $a1, $zero, 0xA
    jal         func_8002FEA4
    addiu       $a2, $zero, 0x5A
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80094048

.text
.align 2
.set noreorder
.globl func_800AE7F0
.ent func_800AE7F0
func_800AE7F0:
    lui         $at, 0x8007
    sh          $s0, -0x463E($at)
    lui         $at, 0x8007
    sh          $s0, -0x463A($at)
    lui         $at, 0x8007
    sh          $s0, -0x4638($at)
    lui         $at, 0x8008
    sh          $zero, 0x57C0($at)
    lui         $at, 0x8008
    sh          $s0, -0x5E7C($at)
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lui         $a0, 0x800B
    addiu       $a0, $a0, -0x188C
    addiu       $a1, $zero, 0x5
    lui         $at, 0x8009
    sw          $zero, -0x6CB0($at)
    lui         $at, 0x8009
    sh          $zero, -0x6AF0($at)
    lui         $at, 0x8008
    sh          $zero, 0x7914($at)
    lui         $at, 0x8009
    sh          $s0, -0x6CB8($at)
    lui         $at, 0x8009
    sh          $s0, -0x6CB6($at)
    jal         func_8002FEA4
    addiu       $a2, $zero, 0x5
    jal         func_800AE90C
    nop
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x1E
    lui         $at, 0x8008
.end func_800AE7F0

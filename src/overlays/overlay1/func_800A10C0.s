.text
.align 2
.set noreorder
.globl func_800A10C0
.ent func_800A10C0
func_800A10C0:
    lui         $v1, 0x8008
    lh          $v1, 0x616A($v1)
    addiu       $sp, $sp, -0x8
    addiu       $v0, $zero, 0x3E8
    beq         $v1, $v0, .L800A10EC
    addu        $a0, $v1, $zero
    addiu       $v0, $zero, 0x3E8
    lui         $at, 0x8008
    sh          $a0, 0x7758($at)
    lui         $at, 0x8008
    sh          $v0, 0x616A($at)
.L800A10EC:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x400
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end func_800A10C0

.text
.align 2
.set noreorder
.globl func_800A6590
.ent func_800A6590
func_800A6590:
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    jal         func_800A1CDC
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a1, 0x24($v0)
    addiu       $a0, $zero, 0xB
    jal         func_800A3704
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x15
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_800B7DD8
    sw          $zero, 0x10($sp)
    j           func_800A22E0
    nop
.end func_800A6590

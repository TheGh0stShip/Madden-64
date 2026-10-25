.text
.align 2
.set noreorder
.globl func_800918A0
.ent func_800918A0
func_800918A0:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_8000DC7C
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    jal         func_8003456C
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8003456C
    nop
    jal         func_8000BF08
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_800915CC
    addu        $a1, $zero, $zero
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800918A0

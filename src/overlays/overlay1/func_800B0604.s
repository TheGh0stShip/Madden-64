.text
.align 2
.set noreorder
.globl func_800B0604
.ent func_800B0604
func_800B0604:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x22A0
    lui         $s4, 0x8008
    lhu         $s4, 0x57E2($s4)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x9
    j           func_800AC388
    addu        $a2, $zero, $zero
.end func_800B0604

.text
.align 2
.set noreorder
.globl func_800B081C
.ent func_800B081C
func_800B081C:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x21E0
    addu        $a0, $s2, $zero
    addiu       $v0, $zero, 0x68
    beql        $a0, $v0, .L800B0848
    addiu       $a0, $zero, 0x2
    lui         $a1, 0x8008
    lw          $a1, 0x57E4($a1)
    jal         func_800AD3A8
    nop
    addiu       $a0, $zero, 0x2
.L800B0848:
    lui         $a2, 0x8008
    lw          $a2, 0x57E4($a2)
    j           func_800AC388
    addiu       $a1, $zero, 0x7
.end func_800B081C

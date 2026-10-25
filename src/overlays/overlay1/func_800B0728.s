.text
.align 2
.set noreorder
.globl func_800B0728
.ent func_800B0728
func_800B0728:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2188
    lui         $a2, 0x8008
    lw          $a2, 0x57E4($a2)
    lui         $a3, 0x8008
    lw          $a3, 0x57E8($a3)
    addiu       $a0, $zero, 0x2
    j           func_800AC38C
    addiu       $a1, $zero, 0x8
.end func_800B0728

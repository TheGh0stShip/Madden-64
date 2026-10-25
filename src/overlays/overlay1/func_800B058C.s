.text
.align 2
.set noreorder
.globl func_800B058C
.ent func_800B058C
func_800B058C:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2160
    lui         $s4, 0x8008
    lhu         $s4, 0x57E2($s4)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x4
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2014
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC38C
    addu        $a3, $zero, $zero
.end func_800B058C

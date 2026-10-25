.text
.align 2
.set noreorder
.globl func_800B0558
.ent func_800B0558
func_800B0558:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2160
    lui         $s4, 0x8008
    lhu         $s4, 0x57E2($s4)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x4
    addu        $a2, $zero, $zero
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2008
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC38C
    addu        $a3, $zero, $zero
.end func_800B0558

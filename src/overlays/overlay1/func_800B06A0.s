.text
.align 2
.set noreorder
.globl func_800B06A0
.ent func_800B06A0
func_800B06A0:
    lui         $a0, 0x8008
    lh          $a0, 0x57E2($a0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2210
    jal         func_800AD36C
    nop
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0xA
    addu        $a2, $zero, $zero
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2008
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC38C
    addu        $a3, $zero, $zero
.end func_800B06A0

.text
.align 2
.set noreorder
.globl func_800B06E4
.ent func_800B06E4
func_800B06E4:
    lui         $a0, 0x8008
    lh          $a0, 0x57E2($a0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2210
    jal         func_800AD36C
    nop
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0xA
    addiu       $a2, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2014
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC38C
    addu        $a3, $zero, $zero
.end func_800B06E4

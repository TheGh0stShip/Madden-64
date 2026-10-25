.text
.align 2
.set noreorder
.globl func_800C1C84
.ent func_800C1C84
func_800C1C84:
    sll         $v1, $v1, 2
    addu        $v0, $v1, $s5
    sll         $a0, $a0, 1
    addu        $a0, $a0, $v0
    lh          $a0, 0x0($a0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    jal         func_80097D28
    addu        $a2, $zero, $zero
    j           func_800BD644
    sh          $s2, 0x3C($s1)
.end func_800C1C84

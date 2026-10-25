.text
.align 2
.set noreorder
.globl func_8009BBE4
.ent func_8009BBE4
func_8009BBE4:
    addiu       $a2, $zero, 0x20
    jal         func_8000979C
    addiu       $a3, $zero, 0x20
    lui         $t0, 0x1000
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    lui         $a1, 0x8008
    lh          $a1, -0x7B78($a1)
    ori         $t0, $t0, 0x400
    lui         $a3, 0x8008
    lh          $a3, -0x7B74($a3)
    lui         $a0, 0xE400
    addiu       $v0, $a2, 0x8
    addiu       $v1, $a1, 0x7C
    andi        $v1, $v1, 0xFFF
    sll         $v1, $v1, 12
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a3, 0x7C
    andi        $v0, $v0, 0xFFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    andi        $a1, $a1, 0xFFF
.end func_8009BBE4

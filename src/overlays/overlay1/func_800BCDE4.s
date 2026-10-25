.text
.align 2
.set noreorder
.globl func_800BCDE4
.ent func_800BCDE4
func_800BCDE4:
    addiu       $a0, $zero, 0x3
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5BE0
    addiu       $v0, $zero, 0xDD
    jal         func_80031A1C
    sw          $v0, 0x0($s0)
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD3
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sw          $v0, -0x5BD8($at)
    j           func_800B8BB0
    addu        $a0, $s0, $zero
.end func_800BCDE4

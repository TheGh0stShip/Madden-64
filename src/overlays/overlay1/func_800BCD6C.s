.text
.align 2
.set noreorder
.globl func_800BCD6C
.ent func_800BCD6C
func_800BCD6C:
    addiu       $a0, $zero, 0x3
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5BE0
    addiu       $v0, $zero, 0xDC
    jal         func_80031A1C
    sw          $v0, 0x0($s0)
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD6
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sw          $v0, -0x5BD8($at)
    j           func_800B8BB0
    addu        $a0, $s0, $zero
.end func_800BCD6C

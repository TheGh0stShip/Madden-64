.text
.align 2
.set noreorder
.globl func_800BCE88
.ent func_800BCE88
func_800BCE88:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    addiu       $v0, $zero, 0xE6
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    bne         $s0, $v1, .L800BCEB8
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    andi        $v0, $v0, 0xFFFF
    j           func_800B87A4
    addiu       $v0, $v0, 0xD6
.L800BCEB8:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD3
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BD8
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x8
.end func_800BCE88

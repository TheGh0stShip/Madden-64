.text
.align 2
.set noreorder
.globl func_800BCB04
.ent func_800BCB04
func_800BCB04:
    sw          $v0, -0x5BE0($at)
    addiu       $v0, $zero, 0xE8
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lbu         $a0, 0x1E($a0)
    bne         $a0, $v0, .L800BCB3C
    andi        $v1, $v1, 0x1
    xori        $v0, $v1, 0x1
    beqz        $v0, .L800BCB58
    nop
    j           func_800B8420
    nop
.L800BCB3C:
    beqz        $v1, .L800BCB58
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    j           func_800B8444
    addiu       $v0, $v0, 0xD6
.L800BCB58:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD3
    lui         $at, 0x8008
    sw          $v0, -0x5BD8($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BD4
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0xC
.end func_800BCB04

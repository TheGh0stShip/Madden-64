.text
.align 2
.set noreorder
.globl func_800BC840
.ent func_800BC840
func_800BC840:
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5BE0
    addiu       $v0, $zero, 0xE3
    sw          $v0, 0x0($s0)
    addiu       $v0, $zero, 0xE9
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD3
    lui         $at, 0x8008
    sw          $v0, -0x5BD8($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sw          $v0, -0x5BD4($at)
    j           func_800B8BB0
    addu        $a0, $s0, $zero
.end func_800BC840

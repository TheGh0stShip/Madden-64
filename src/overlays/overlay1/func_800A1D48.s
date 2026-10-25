.text
.align 2
.set noreorder
.globl func_800A1D48
.ent func_800A1D48
func_800A1D48:
    lui         $t0, 0xFC40
    sw          $zero, 0x0($s2)
    lh          $v0, 0x4($s0)
    addiu       $t0, $zero, -0x1
    lui         $at, 0x8008
    sh          $t0, 0x7AF0($at)
    sll         $v0, $v0, 16
    j           func_8009D768
    sw          $v0, 0x4($s2)
.end func_800A1D48

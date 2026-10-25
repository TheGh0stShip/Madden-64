.text
.align 2
.set noreorder
.globl func_800A29C0
.ent func_800A29C0
func_800A29C0:
    subu        $v0, $v0, $a0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x2D94($at)
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x100
    bnez        $v0, . + 4 + (0x4 << 2)
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $v1
.end func_800A29C0

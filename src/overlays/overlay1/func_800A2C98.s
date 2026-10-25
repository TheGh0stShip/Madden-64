.text
.align 2
.set noreorder
.globl func_800A2C98
.ent func_800A2C98
func_800A2C98:
    sh          $v0, -0x4854($at)
    lui         $v0, 0xFE20
    lui         $at, 0x8008
    sw          $v0, 0x4F34($at)
    lui         $v0, 0x1000
    or          $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    lui         $a0, 0x8009
    lhu         $a0, -0x7F3C($a0)
    addiu       $v0, $zero, 0x6
    andi        $v1, $a0, 0x6
    beq         $v1, $v0, . + 4 + (0x55 << 2)
    andi        $v0, $a0, 0x2
.end func_800A2C98

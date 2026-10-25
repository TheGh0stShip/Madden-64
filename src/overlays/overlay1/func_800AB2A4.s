.text
.align 2
.set noreorder
.globl func_800AB2A4
.ent func_800AB2A4
func_800AB2A4:
    lw          $a0, 0xA0($s0)
    bltz        $a0, . + 4 + (0xF << 2)
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    andi        $a2, $s1, 0xFFFF
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00001012  # mflo        $v0
    slt         $v0, $a0, $v0
    bnez        $v0, . + 4 + (0x10 << 2)
    nop
.end func_800AB2A4

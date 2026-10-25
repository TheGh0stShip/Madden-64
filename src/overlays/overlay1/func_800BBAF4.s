.text
.align 2
.set noreorder
.globl func_800BBAF4
.ent func_800BBAF4
func_800BBAF4:
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00001012  # mflo        $v0
    andi        $v1, $a3, 0xFFFF
    nop
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L800BBB14
    nop
    break       7
.L800BBB14:
    addiu       $at, $zero, -0x1
.end func_800BBAF4

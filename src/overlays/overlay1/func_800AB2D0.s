.text
.align 2
.set noreorder
.globl func_800AB2D0
.ent func_800AB2D0
func_800AB2D0:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00001012  # mflo        $v0
    j           func_800A6C28
    subu        $v0, $a0, $v0
.end func_800AB2D0

.text
.align 2
.set noreorder
.globl func_800A8CA8
.ent func_800A8CA8
func_800A8CA8:
    lui         $v0, 0x100
    sw          $v0, 0x18($s0)
    j           func_800A45B0
    lui         $v0, 0x6E
.end func_800A8CA8

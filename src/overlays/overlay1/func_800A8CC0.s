.text
.align 2
.set noreorder
.globl func_800A8CC0
.ent func_800A8CC0
func_800A8CC0:
    addiu       $v0, $zero, 0x6
    sh          $v0, 0x54($s0)
    lui         $v0, 0x100
    sw          $v0, 0x18($s0)
    lui         $v0, 0x78
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x48E
    j           func_800A4688
    sh          $v0, 0x20($sp)
.end func_800A8CC0

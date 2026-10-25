.text
.align 2
.set noreorder
.globl func_800A92E8
.ent func_800A92E8
func_800A92E8:
    lui         $v0, 0x150
    sw          $v0, 0x18($s0)
    addiu       $v0, $zero, 0x546
    sh          $v0, 0x20($sp)
    j           func_800A4C88
    lui         $v0, 0x8C
.end func_800A92E8

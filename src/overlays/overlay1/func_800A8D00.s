.text
.align 2
.set noreorder
.globl func_800A8D00
.ent func_800A8D00
func_800A8D00:
    lui         $v0, 0x110
    sw          $v0, 0x18($s0)
    lui         $v0, 0x6E
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x4F2
    j           func_800A4688
    sh          $v0, 0x20($sp)
.end func_800A8D00

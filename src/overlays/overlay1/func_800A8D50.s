.text
.align 2
.set noreorder
.globl func_800A8D50
.ent func_800A8D50
func_800A8D50:
    lui         $v0, 0xC0
    sw          $v0, 0x18($s0)
    lui         $v0, 0x64
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x48E
    sh          $v0, 0x20($sp)
    addiu       $v0, $zero, 0x6
    j           func_800A4688
    sh          $v0, 0x56($s0)
.end func_800A8D50

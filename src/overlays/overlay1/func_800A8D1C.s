.text
.align 2
.set noreorder
.globl func_800A8D1C
.ent func_800A8D1C
func_800A8D1C:
    lui         $v0, 0x130
    sw          $v0, 0x18($s0)
    lui         $v0, 0x6E
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x48E
    sh          $v0, 0x20($sp)
    sh          $zero, 0x4C($s0)
    sh          $zero, 0x4E($s0)
    sh          $zero, 0x50($s0)
    sh          $zero, 0x54($s0)
    sh          $zero, 0x56($s0)
    j           func_800A4688
    sh          $zero, 0x58($s0)
.end func_800A8D1C

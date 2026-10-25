.text
.align 2
.set noreorder
.globl func_800A8CE4
.ent func_800A8CE4
func_800A8CE4:
    lui         $v0, 0x130
    sw          $v0, 0x18($s0)
    lui         $v0, 0x6E
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x488
    j           func_800A4688
    sh          $v0, 0x20($sp)
.end func_800A8CE4

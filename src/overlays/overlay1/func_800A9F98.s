.text
.align 2
.set noreorder
.globl func_800A9F98
.ent func_800A9F98
func_800A9F98:
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    j           func_800A58B8
    addu        $v1, $v1, $v0
.end func_800A9F98

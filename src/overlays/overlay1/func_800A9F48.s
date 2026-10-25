.text
.align 2
.set noreorder
.globl func_800A9F48
.ent func_800A9F48
func_800A9F48:
    lui         $v0, 0x1FF
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L800A9F64
    sw          $v1, 0x18($sp)
    lui         $v0, 0x28
    sw          $v0, 0x18($s0)
.L800A9F64:
    lh          $a0, 0x24($sp)
    lw          $a2, 0x18($s0)
    jal         func_800B9274
.end func_800A9F48

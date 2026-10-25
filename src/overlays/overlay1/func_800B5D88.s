.text
.align 2
.set noreorder
.globl func_800B5D88
.ent func_800B5D88
func_800B5D88:
    nop
    addu        $a0, $zero, $zero
    lw          $v1, 0x0($s0)
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x20
    sw          $v0, 0x1C($sp)
    jal         func_8000D8DC
    sw          $v1, 0x24($sp)
.end func_800B5D88

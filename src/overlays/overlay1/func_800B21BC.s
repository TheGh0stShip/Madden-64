.text
.align 2
.set noreorder
.globl func_800B21BC
.ent func_800B21BC
func_800B21BC:
    sw          $s0, 0x20($sp)
    lui         $s6, 0x800C
    addiu       $s6, $s6, 0x5EE8
    j           func_800ADAEC
    addiu       $v0, $zero, 0x1
.end func_800B21BC

.text
.align 2
.set noreorder
.globl func_800A6F2C
.ent func_800A6F2C
func_800A6F2C:
    addiu       $v0, $zero, 0x8
    beq         $v1, $v0, .L800A6F50
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800A6F50:
    jr          $ra
    nop
.end func_800A6F2C

.text
.align 2
.set noreorder
.globl func_800A1984
.ent func_800A1984
func_800A1984:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    sb          $v0, 0x7AB1($at)
    lui         $at, 0x8008
    sw          $v1, 0x7AB8($at)
    jal         func_800C5F80
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A1984

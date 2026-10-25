.text
.align 2
.set noreorder
.globl func_800AD49C
.ent func_800AD49C
func_800AD49C:
    bgtz        $s0, . + 4 + (-0x9 << 2)
    sw          $v0, 0x20($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    lw          $v1, 0x20($a0)
    addiu       $v0, $zero, 0x8C
    bne         $v1, $v0, . + 4 + (0x37 << 2)
    addiu       $a1, $zero, 0x58
    j           func_800A8E3C
    nop
.end func_800AD49C

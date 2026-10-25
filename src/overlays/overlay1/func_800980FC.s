.text
.align 2
.set noreorder
.globl func_800980FC
.ent func_800980FC
func_800980FC:
    sw          $v1, 0x6E78($at)
    lui         $at, 0x8008
    sw          $a2, 0x6E7C($at)
    jal         func_8000D8DC
    addiu       $a1, $sp, 0x28
    lui         $v1, 0x8008
    lw          $v1, 0x6A2C($v1)
    sw          $v0, 0xB8($v1)
    lui         $at, 0x8008
    sw          $v0, 0x6E74($at)
    lw          $a0, 0xB8($v1)
    jal         func_80016FE4
    nop
    lw          $ra, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800980FC

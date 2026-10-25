.text
.align 2
.set noreorder
.globl func_800A6688
.ent func_800A6688
func_800A6688:
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7FA8
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lw          $a0, 0x0($v0)
    addu        $v1, $v1, $a0
    sw          $v1, 0x0($v0)
    sltiu       $v1, $v1, 0x79
    bnez        $v1, . + 4 + (0xD6 << 2)
    lui         $v1, 0xFFC0
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $a0, 0x8008
    lw          $a0, 0x7FA0($a0)
    addiu       $a1, $sp, 0x20
    addiu       $v0, $zero, 0x7
    jal         func_800E1BCC
    sb          $v0, 0x20($sp)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0x2
    or          $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x6
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x7FA0($v1)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    lw          $a1, 0x24($v1)
    addiu       $a2, $zero, 0x1
    jal         func_800A3704
    addiu       $a0, $zero, 0xB
    j           func_800A22E0
    nop
.end func_800A6688

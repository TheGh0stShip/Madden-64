.text
.align 2
.set noreorder
.globl func_800B685C
.ent func_800B685C
func_800B685C:
    lw          $v0, 0x18E8($v0)
    lhu         $v1, 0xA($v0)
    andi        $a0, $v1, 0xFFFF
    andi        $v0, $a0, 0x7
    bnez        $v0, .L800B6884
    srl         $v0, $a0, 3
    jal         func_800B3A58
    srl         $a0, $a0, 3
    j           func_800B2170
    nop
.L800B6884:
    subu        $v0, $v1, $v0
    addiu       $v0, $v0, -0x1
    jal         func_800B3E78
    andi        $a0, $v0, 0xFFFF
    lui         $v1, 0x8007
    lw          $v1, 0x18E8($v1)
    lhu         $v0, 0xA($v1)
    addiu       $v0, $v0, 0x1
    andi        $a0, $v0, 0xFFFF
    sh          $v0, 0xA($v1)
    addiu       $v0, $zero, 0x250
    bne         $a0, $v0, .L800B68C4
    addiu       $v0, $zero, 0x8
    sh          $v0, 0x8($v1)
    j           func_800B21C4
    sh          $zero, 0xA($v1)
.L800B68C4:
    lhu         $v0, 0x8($v1)
    bne         $a0, $v0, .L800B68E8
    addiu       $v0, $v0, 0x8
    sh          $v0, 0x8($v1)
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x250
    bnez        $v0, .L800B68E8
    addiu       $v0, $zero, 0x8
    sh          $v0, 0x8($v1)
.L800B68E8:
    lui         $at, 0x8008
    sh          $zero, -0x5DBC($at)
    j           func_800B21E4
    nop
.end func_800B685C

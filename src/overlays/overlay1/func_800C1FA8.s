.text
.align 2
.set noreorder
.globl func_800C1FA8
.ent func_800C1FA8
func_800C1FA8:
    lui         $a3, 0x8008
    lw          $a3, 0x7A74($a3)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    sw          $a0, 0x10($sp)
    bne         $v1, $v0, . + 4 + (0x4C << 2)
    sw          $a3, 0x14($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x4
    and         $v0, $v0, $v1
    bnez        $v0, .L800C206C
    andi        $v0, $a1, 0xFFFF
    lui         $v1, 0x8009
    lhu         $v1, -0x7920($v1)
    bne         $v0, $v1, .L800C2044
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lbu         $v1, 0xC22($v1)
    bnel        $v1, $v0, .L800C203C
    sw          $a0, 0x10($sp)
    lui         $v1, 0x8009
    lw          $v1, -0x78EC($v1)
    beql        $v1, $zero, .L800C2028
    sw          $a0, 0x10($sp)
    lw          $v0, 0x24($v1)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x24($v1)
    lw          $v0, 0x20($v0)
    j           func_800BD908
    sw          $v0, 0x14($sp)
.L800C2028:
    sw          $a3, 0x14($sp)
    lui         $at, 0x8008
    sb          $zero, 0xC22($at)
    j           func_800BD9D0
    addiu       $t2, $zero, -0x1
.L800C203C:
    j           func_800BD9CC
    sw          $a3, 0x14($sp)
.L800C2044:
    lui         $a0, 0x8009
    lw          $a0, -0x78EC($a0)
    beqz        $a0, . + 4 + (0x29 << 2)
    addiu       $t2, $zero, -0x1
    lbu         $v0, 0x21($a0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, . + 4 + (0x26 << 2)
    addu        $a3, $zero, $zero
    j           func_800BDAD0
    nop
.L800C206C:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v0, 0x1C($a0)
    lw          $v1, 0x2C($a0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0x20($a0)
    lw          $v1, 0x30($a0)
    addu        $v0, $v0, $v1
    j           func_800BD9CC
    sw          $v0, 0x14($sp)
.end func_800C1FA8

.text
.align 2
.set noreorder
.globl func_800A5C78
.ent func_800A5C78
func_800A5C78:
    lui         $v1, 0x7
    ori         $v1, $v1, 0xFFFF
    bltzl       $v0, .L800A5C88
    negu        $v0, $v0
.L800A5C88:
    slt         $v0, $v1, $v0
    bnez        $v0, .L800A5D04
    nop
    lw          $v0, 0x24($sp)
    bltzl       $v0, .L800A5CA0
    negu        $v0, $v0
.L800A5CA0:
    slt         $v0, $v1, $v0
    bnez        $v0, .L800A5D04
    nop
    lw          $v0, 0x24($s0)
    sw          $zero, 0x2C($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0x30($v0)
    lbu         $v0, 0x1F($s0)
    lw          $v1, 0x24($s0)
    addiu       $v0, $v0, -0x4
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0xC40($at)
    sw          $v0, 0x1C($v1)
    lbu         $v0, 0x1F($s0)
    lw          $v1, 0x24($s0)
    addiu       $v0, $v0, -0x4
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0xC44($at)
    sw          $v0, 0x20($v1)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
.L800A5D04:
    lw          $v0, 0x20($sp)
    beqz        $v0, . + 4 + (0x1F << 2)
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    beqz        $v0, . + 4 + (0x1B << 2)
    addu        $v0, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x741C($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x762C($a1)
    lw          $v0, 0x1C($a0)
    lw          $v1, 0x1C($a1)
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    sw          $v0, 0x30($sp)
    lw          $v0, 0x20($a0)
    lw          $v1, 0x20($a1)
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    sw          $v0, 0x34($sp)
    addiu       $v0, $zero, 0x8
    sw          $v0, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
.end func_800A5C78

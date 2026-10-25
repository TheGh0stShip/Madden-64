.text
.align 2
.set noreorder
.globl func_8009C900
.ent func_8009C900
func_8009C900:
    addu        $v0, $v0, $a0
    sh          $v0, 0x20($v1)
    sh          $v0, 0x10($v1)
    lhu         $v0, 0x40($s1)
    sh          $v0, 0x28($v1)
    sh          $v0, 0x18($v1)
    lhu         $v0, 0x2E($s1)
    sh          $zero, 0x1A($v1)
    sh          $zero, 0xA($v1)
    sh          $v0, 0x12($v1)
    sh          $v0, 0x2($v1)
    lw          $a0, 0x20($s1)
    lhu         $v0, 0x2E($s1)
    addu        $v0, $v0, $a0
    sh          $v0, 0x22($v1)
    sh          $v0, 0x32($v1)
    lhu         $v0, 0x42($s1)
    addiu       $a1, $zero, 0x3
    addiu       $a0, $v1, 0x30
    sh          $v0, 0x2A($v1)
    sh          $v0, 0x3A($v1)
.L8009C954:
    sh          $zero, 0x4($a0)
    sh          $zero, 0x6($a0)
    sb          $a2, 0xF($a0)
    sb          $a2, 0xE($a0)
    sb          $a2, 0xD($a0)
    sb          $a2, 0xC($a0)
    addiu       $a0, $a0, -0x10
    addu        $v0, $a1, $zero
    bnez        $v0, .L8009C954
    addiu       $a1, $a1, -0x1
    addiu       $a3, $a3, -0x4
    addu        $v0, $t0, $zero
    bnez        $v0, . + 4 + (-0x2A << 2)
    addiu       $t0, $t0, -0x1
    j           func_800984C8
    nop
.end func_8009C900

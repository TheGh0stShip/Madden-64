.text
.align 2
.set noreorder
.globl func_800A9170
.ent func_800A9170
func_800A9170:
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0xEE
    jal         func_800A6A70
    addiu       $a2, $zero, 0x11
    lw          $v1, 0xA0($s0)
    lhu         $v0, 0x24($sp)
    addu        $v0, $v0, $v1
    sh          $v0, 0x24($sp)
    addiu       $v0, $zero, 0x5A0
    sh          $v0, 0x20($sp)
    sh          $zero, 0x22($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x1C($v0)
    lui         $v0, 0xD2
    sw          $v0, 0x18($sp)
    sw          $v1, 0x10($sp)
    lw          $v0, 0xC($s0)
    lui         $v1, 0x100
    sw          $v1, 0x18($s0)
    lw          $v0, 0x20($v0)
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    addu        $v0, $v0, $v1
    jal         func_800A2E58
    sw          $v0, 0x14($sp)
    addu        $a0, $s0, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x20
    lw          $ra, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800A9170

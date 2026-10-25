.text
.align 2
.set noreorder
.globl func_800A8D74
.ent func_800A8D74
func_800A8D74:
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0xEE
    lui         $v0, 0x110
    sw          $v0, 0x18($s0)
    lui         $v0, 0x6E
    sw          $v0, 0x18($sp)
    addiu       $v0, $zero, 0x4F2
    addiu       $a2, $zero, 0x11
    jal         func_800A6A70
    sh          $v0, 0x20($sp)
    lw          $v1, 0xA0($s0)
    lhu         $v0, 0x24($sp)
    addu        $v0, $v0, $v1
    sh          $v0, 0x24($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x18($s0)
    lw          $v0, 0x20($v0)
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    subu        $v0, $v0, $v1
    jal         func_800A2E58
    sw          $v0, 0x14($sp)
    addu        $a0, $s0, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x20
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A8D74

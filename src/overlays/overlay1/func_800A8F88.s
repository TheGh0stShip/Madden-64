.text
.align 2
.set noreorder
.globl func_800A8F88
.ent func_800A8F88
func_800A8F88:
    sw          $v0, 0x18($sp)
    sw          $v1, 0x10($sp)
    lw          $v0, 0xC($s0)
    lui         $v1, 0x100
    sw          $v1, 0x18($s0)
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
.end func_800A8F88

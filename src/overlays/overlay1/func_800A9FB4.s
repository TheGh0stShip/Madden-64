.text
.align 2
.set noreorder
.globl func_800A9FB4
.ent func_800A9FB4
func_800A9FB4:
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    subu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    subu        $v1, $v1, $v0
    bltzl       $a0, .L800A9FE4
    addiu       $a0, $a0, 0x7
.L800A9FE4:
    sra         $v0, $a0, 3
    addu        $v0, $v1, $v0
    sw          $v0, 0x14($sp)
    addu        $a0, $s0, $zero
    jal         func_800A2E58
    addiu       $a1, $sp, 0x10
    addu        $a0, $s0, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x20
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A9FB4

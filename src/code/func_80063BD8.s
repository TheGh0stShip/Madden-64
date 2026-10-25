.text
.align 2
.set noreorder
.globl func_80063BD8
.ent func_80063BD8
func_80063BD8:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    lw          $s5, 0x40($sp)
    sw          $s6, 0x28($sp)
    lw          $s6, 0x44($sp)
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    sw          $s3, 0x1C($sp)
    sw          $ra, 0x2C($sp)
    sw          $s2, 0x18($sp)
    lw          $s2, 0x4($s0)
    addiu       $v0, $zero, 0x1
    beq         $s1, $v0, .L80063C44
    addu        $s3, $a3, $zero
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    sw          $s1, 0x18($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L80063C44:
    addu        $a0, $s0, $zero
    addu        $a1, $s1, $zero
    jal         func_800635DC
    addiu       $a2, $zero, 0x80
    sw          $zero, 0x0($v0)
    sw          $s5, 0x4($v0)
    sw          $s3, 0x8($v0)
    sw          $s6, 0xC($v0)
    sw          $s4, 0x20($v0)
    sw          $zero, 0x28($v0)
    lw          $v1, 0x44($s2)
    sw          $v1, 0x2C($v0)
    sw          $v0, 0x44($s2)
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80063BD8

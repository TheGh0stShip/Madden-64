.text
.align 2
.set noreorder
.globl func_80054DB0
.ent func_80054DB0
func_80054DB0:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a2, $zero
    addiu       $a0, $zero, 0x3D
    sw          $ra, 0x18($sp)
    beq         $a1, $a0, .L80054E00
    sw          $zero, 0x4($s1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0xA
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $a0, 0x18($v0)
    lw          $v0, 0x0($s1)
    sw          $a1, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80054E00:
    addiu       $a0, $zero, 0x1D0
    beql        $s0, $a0, .L80054E3C
    addu        $a0, $s1, $zero
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x13
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $a0, 0x18($v0)
    lw          $v0, 0x0($s1)
    sw          $s0, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
.L80054E3C:
    lw          $s0, 0x0($s1)
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x1D0
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, 0x1
    sw          $v0, 0xC($s1)
    jal         func_800647F0
    sw          $s0, 0x0($s1)
    addiu       $a0, $zero, 0x3
    addiu       $v0, $s1, 0xC
    sw          $zero, 0x8($s1)
    sw          $zero, 0x14($s1)
.L80054E70:
    sw          $zero, 0xA4($v0)
    addiu       $a0, $a0, -0x1
    bgez        $a0, .L80054E70
    addiu       $v0, $v0, -0x4
    addu        $a0, $zero, $zero
    addu        $v1, $s1, $zero
.L80054E88:
    sw          $zero, 0xB4($v1)
    sw          $zero, 0xC4($v1)
    addiu       $a0, $a0, 0x1
    slti        $v0, $a0, 0x4
    bnez        $v0, .L80054E88
    addiu       $v1, $v1, 0x4
    jal         func_80058CB0
    addu        $a0, $s1, $zero
    jal         func_80056A08
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, 0xC8
    sw          $v0, 0x10($s1)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80054DB0

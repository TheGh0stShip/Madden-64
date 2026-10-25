.text
.align 2
.set noreorder
.globl func_800A0160
.ent func_800A0160
func_800A0160:
    addiu       $sp, $sp, -0x30
    sw          $s3, 0x1C($sp)
    addiu       $s3, $zero, 0x4
    sw          $s5, 0x24($sp)
    addiu       $s5, $zero, 0x200
    sw          $s4, 0x20($sp)
    lui         $s4, 0xFE70
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    sw          $s0, 0x10($sp)
    addiu       $s0, $v0, 0x2E4
    sw          $s2, 0x18($sp)
    addiu       $s2, $v0, 0x2C0
    sw          $s1, 0x14($sp)
    addiu       $s1, $zero, 0x2C0
    sw          $ra, 0x28($sp)
.L800A01A0:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x7164($at)
    bnel        $v0, $s5, .L800A01E8
    addiu       $s0, $s0, 0xB0
    lw          $v0, 0x0($s0)
    lw          $a1, 0x1C($v0)
    addu        $a0, $s2, $zero
    slt         $a1, $a1, $s4
    xori        $a1, $a1, 0x1
    negu        $a1, $a1
    andi        $a1, $a1, 0xC00
    jal         func_800C16A0
    ori         $a1, $a1, 0x400
    lw          $v0, 0x0($s0)
    lw          $v0, 0x8($v0)
    sh          $zero, 0x60($v0)
    addiu       $s0, $s0, 0xB0
.L800A01E8:
    addiu       $s2, $s2, 0xB0
    addiu       $s3, $s3, 0x1
    sltiu       $v0, $s3, 0x8
    bnez        $v0, .L800A01A0
    addiu       $s1, $s1, 0xB0
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A0160

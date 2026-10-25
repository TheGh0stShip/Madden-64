.text
.align 2
.set noreorder
.globl func_800A67A8
.ent func_800A67A8
func_800A67A8:
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a3, 0x24($v0)
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0xC00
    lw          $v0, 0x14($a3)
    addu        $a2, $zero, $zero
    addiu       $v1, $zero, -0x6
    and         $v0, $v0, $v1
    jal         func_800C0018
    sw          $v0, 0x14($a3)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    jal         func_800B8C90
    addu        $a0, $s1, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    addiu       $s0, $zero, 0x6
    sw          $s0, 0x10($sp)
    sw          $s0, 0x14($sp)
    sw          $s0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    lw          $a0, 0x1C($s1)
    lw          $a1, 0x20($s1)
    lw          $a2, 0x24($s1)
    lw          $a3, 0x28($s1)
    jal         func_8009F1DC
    nop
    lw          $v0, 0x1C($s1)
    lui         $v1, 0xFE70
    slt         $v0, $v0, $v1
    beqz        $v0, . + 4 + (0x77 << 2)
    addiu       $a0, $zero, 0xB
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lui         $at, 0x8008
    sw          $s0, 0x7FA4($at)
    lw          $a1, 0x24($v0)
    jal         func_800A3704
    addiu       $a2, $zero, 0x1
    j           func_800A22E0
    nop
.end func_800A67A8

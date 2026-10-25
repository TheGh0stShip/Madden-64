.text
.align 2
.set noreorder
.globl func_800A65D8
.ent func_800A65D8
func_800A65D8:
    addu        $a0, $s2, $zero
    addiu       $a1, $zero, 0xC00
    jal         func_800C0018
    addu        $a2, $zero, $zero
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    jal         func_800B8C90
    addu        $a0, $s1, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x7FA0($v1)
    addiu       $v0, $zero, 0x6
    sw          $v0, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v1, 0x1C($sp)
    lw          $a0, 0x1C($s1)
    lw          $a1, 0x20($s1)
    lw          $a2, 0x24($s1)
    lw          $a3, 0x28($s1)
    jal         func_8009F1DC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7FB0($v1)
    lw          $a2, 0x24($v0)
    lui         $a0, 0x10
    lw          $v0, 0x1C($s1)
    lw          $a1, 0x1C($a2)
    addu        $v1, $v1, $a0
    addu        $v0, $v0, $v1
    slt         $v0, $v0, $a1
    beqz        $v0, . + 4 + (0xEA << 2)
    addiu       $a0, $zero, 0xB
    addu        $a1, $a2, $zero
    jal         func_800A3704
    addiu       $a2, $zero, 0x1
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    lui         $at, 0x8008
    sw          $zero, 0x7FA8($at)
    j           func_800A22E0
    nop
.end func_800A65D8

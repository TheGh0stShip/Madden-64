.text
.align 2
.set noreorder
.globl func_800BB7E4
.ent func_800BB7E4
func_800BB7E4:
    bnez        $s0, . + 4 + (-0x11 << 2)
    nop
    beqz        $s0, .L800BB88C
    andi        $v0, $s3, 0xFFFF
    lhu         $v1, 0x22($s0)
    beq         $v1, $v0, .L800BB874
    nop
    lw          $v0, 0x4($s0)
    beqz        $v0, .L800BB83C
    nop
    lui         $a0, 0x8007
    lw          $a0, 0x1934($a0)
    lw          $s1, 0x0($v0)
    jal         func_80033298
    addu        $s0, $v0, $zero
    sw          $v0, 0x0($s0)
    sw          $s0, 0x4($v0)
    lw          $s0, 0x0($s0)
    beqz        $s1, .L800BB8AC
    sw          $s1, 0x0($s0)
    j           func_800B7188
    sw          $s0, 0x4($s1)
.L800BB83C:
    lui         $a0, 0x8007
    lw          $a0, 0x1934($a0)
    jal         func_80033298
    nop
    lui         $at, 0x8007
    sw          $v0, 0x1938($at)
    sw          $s0, 0x0($v0)
    lui         $v0, 0x8007
    lw          $v0, 0x1938($v0)
    sw          $v0, 0x4($s0)
    lui         $s0, 0x8007
    lw          $s0, 0x1938($s0)
    j           func_800B7188
    sw          $zero, 0x4($s0)
.L800BB874:
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x1949
    lbu         $v0, 0x0($v1)
    addiu       $v0, $v0, -0x1
    j           func_800B7188
    sb          $v0, 0x0($v1)
.L800BB88C:
    lui         $a0, 0x8007
    lw          $a0, 0x1934($a0)
    jal         func_80033298
    nop
    addu        $s0, $v0, $zero
    sw          $s0, 0x0($s1)
    sw          $zero, 0x0($s0)
    sw          $s1, 0x4($s0)
.L800BB8AC:
    sh          $s3, 0x22($s0)
    lw          $v0, 0x0($s4)
    sw          $v0, 0x8($s0)
    lw          $v0, 0x4($s4)
    sw          $v0, 0xC($s0)
    lw          $v0, 0x8($s4)
    sw          $v0, 0x10($s0)
    lhu         $v0, 0x0($s5)
    sh          $v0, 0x18($s0)
    lhu         $v0, 0x2($s5)
    sh          $v0, 0x1A($s0)
    lhu         $v0, 0x4($s5)
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x1949
    sh          $v0, 0x1C($s0)
    lbu         $v1, 0x0($a0)
    addu        $v0, $s0, $zero
    addiu       $v1, $v1, 0x1
    sb          $v1, 0x0($a0)
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
.end func_800BB7E4

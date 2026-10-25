.text
.align 2
.set noreorder
.globl func_800A6D18
.ent func_800A6D18
func_800A6D18:
    nop
    lui         $v0, 0x8008
    lbu         $v0, 0x7FE3($v0)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sb          $v0, -0x7B78($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sb          $v0, -0x7EF0($at)
    lui         $v1, 0x8008
    lbu         $v1, 0x7FE1($v1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sb          $v0, -0x4870($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v1, 0x5E48($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v1, 0x5C00($at)
    lui         $v1, 0x8008
    lw          $v1, 0x7FA4($v1)
    sltiu       $v0, $v1, 0x8
    beqz        $v0, .L800A6ED0
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xCE0($at)
    jr          $v0
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x834($a0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    j           func_800A26C0
    sw          $v0, 0x14($a0)
    lui         $a0, 0x8008
    lw          $a0, 0x834($a0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    j           func_800A26C0
    sw          $v0, 0x14($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a1, 0x24($v0)
    addiu       $a0, $zero, 0xB
    jal         func_800A3704
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    j           func_800A27AC
    sw          $v0, 0x14($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a1, 0x24($v0)
    addiu       $a0, $zero, 0xB
    jal         func_800A3704
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    j           func_800A27A4
    addiu       $v1, $zero, -0x2
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0xFFC0
    j           func_800A273C
    ori         $v1, $v1, 0xFFFE
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a1, 0x24($v0)
    addiu       $a2, $zero, 0x1
    jal         func_800A3704
    addiu       $a0, $zero, 0xB
    j           func_800A27AC
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x1
    j           func_800A27AC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x5
    sw          $v0, 0x14($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FA0($v0)
    lw          $a0, 0x24($v0)
    lw          $v0, 0x14($a0)
    lui         $v1, 0xFFFD
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
.L800A6ED0:
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A6D18

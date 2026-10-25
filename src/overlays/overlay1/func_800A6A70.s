.text
.align 2
.set noreorder
.globl func_800A6A70
.ent func_800A6A70
func_800A6A70:
    lw          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7FB4($at)
    lw          $v0, 0x20($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7FB8($at)
    lw          $v0, 0x24($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7FBC($at)
    jal         func_8000EC6C
    addiu       $a1, $s1, 0x30
    lw          $a0, 0x0($s0)
    jal         func_8000ED04
    addiu       $a1, $s1, 0x20
    lui         $at, 0x8008
    sh          $zero, 0x7FDC($at)
    jal         func_8003D8C0
    addiu       $a0, $zero, 0x40
    sll         $v0, $v0, 16
    beqz        $v0, .L800A6B28
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lb          $v1, 0x7B50($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7FDC($at)
    bltz        $v1, .L800A6B20
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lbu         $v0, -0x4870($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    lui         $at, 0x8008
    sh          $v0, 0x7FDE($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x5C00($at)
    lui         $at, 0x8008
    sh          $v0, 0x7FE0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lbu         $v0, -0x7EF0($at)
    lui         $at, 0x8008
    sh          $v0, 0x7FE2($at)
.L800A6B20:
    jal         func_8003D0C4
    addiu       $a0, $zero, 0x40
.L800A6B28:
    jal         func_8000BE80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x834($a1)
    jal         func_8000D998
    nop
    lui         $a0, 0x8007
    lhu         $a0, -0x6458($a0)
    lui         $a1, 0x8007
    lhu         $a1, -0x6456($a1)
    jal         func_80035F88
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A6A70

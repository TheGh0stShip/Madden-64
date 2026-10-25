.text
.align 2
.set noreorder
.globl func_800A6C48
.ent func_800A6C48
func_800A6C48:
    addiu       $v0, $zero, 0x1000
    sw          $v0, 0x40($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x44($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    addiu       $v0, $zero, 0x30
    sw          $v0, 0x14($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    addiu       $s0, $s0, -0x24
    sw          $s0, 0x10($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FB4($v0)
    sw          $v0, 0x1C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FB8($v0)
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7FBC($v0)
    sw          $v0, 0x24($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    lui         $v0, 0x800A
    addiu       $v0, $v0, 0x1D28
    sw          $v0, 0xC($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    beqz        $v0, . + 4 + (0x21 << 2)
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7FDC($v0)
    beqz        $v0, . + 4 + (0x1D << 2)
    addiu       $a0, $zero, 0x40
    addiu       $a1, $zero, 0x3C
    addu        $a2, $zero, $zero
    jal         func_8003CEB8
    addiu       $a3, $zero, 0x10
    lui         $a0, 0x8008
    lb          $a0, 0x7B50($a0)
    bltz        $a0, . + 4 + (0x15 << 2)
.end func_800A6C48

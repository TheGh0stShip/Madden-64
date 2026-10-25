.text
.align 2
.set noreorder
.globl func_800A7468
.ent func_800A7468
func_800A7468:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    addu        $a1, $zero, $zero
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x58DC
    sll         $v0, $a1, 16
.L800A7480:
    sra         $v0, $v0, 14
    addu        $v1, $v0, $a2
    lw          $v0, 0x0($v1)
    bnez        $v0, .L800A749C
    addiu       $v0, $a1, 0x1
    j           func_800A2D88
    sw          $a0, 0x0($v1)
.L800A749C:
    addu        $a1, $v0, $zero
    sll         $v0, $v0, 16
    blez        $v0, .L800A7480
    sll         $v0, $a1, 16
    lh          $v0, 0x2($a0)
    lw          $a0, 0x14($a0)
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $a1, -0x5840($at)
    jal         func_8000B7A4
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A7468

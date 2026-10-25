.text
.align 2
.set noreorder
.globl func_800A3330
.ent func_800A3330
func_800A3330:
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D96($at)
    beqz        $v0, .L800A33BC
    lui         $v0, 0x8
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    ori         $v0, $v0, 0x4000
    and         $v0, $v1, $v0
    bnez        $v0, .L800A33C0
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    bnez        $v0, .L800A33A8
    lui         $v0, 0xC000
    lui         $v0, 0x10
    and         $v0, $v1, $v0
    beqz        $v0, .L800A33BC
    lui         $v0, 0xC000
.L800A33A8:
    and         $v0, $v1, $v0
    bnez        $v0, .L800A33C0
    addu        $v0, $zero, $zero
    j           func_8009EC9C
    addiu       $v0, $zero, 0x1
.L800A33BC:
    addu        $v0, $zero, $zero
.L800A33C0:
    jr          $ra
    nop
.end func_800A3330

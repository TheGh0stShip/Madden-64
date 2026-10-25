.text
.align 2
.set noreorder
.globl func_800B2CE8
.ent func_800B2CE8
func_800B2CE8:
    addiu       $sp, $sp, -0x18
    addu        $a1, $a0, $zero
    andi        $v1, $a1, 0xFFFF
    beqz        $v1, .L800B2D70
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x6AF0($v0)
    beq         $v1, $v0, .L800B2D70
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0x2
    bnez        $v0, .L800B2D68
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    lui         $at, 0x8009
    sh          $a1, -0x6AF0($at)
    jal         func_800363F4
    addu        $a1, $zero, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8008
    sh          $v1, 0x7914($at)
    ori         $v0, $v0, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    j           func_800AE64C
    nop
.L800B2D68:
    lui         $at, 0x8009
    sh          $zero, -0x6AF0($at)
.L800B2D70:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B2CE8

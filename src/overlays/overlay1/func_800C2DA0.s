.text
.align 2
.set noreorder
.globl func_800C2DA0
.ent func_800C2DA0
func_800C2DA0:
    beq         $v1, $v0, .L800C2E78
    nop
    j           func_800BE774
    nop
    jal         func_80016FD4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x4CC4($v1)
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lh          $a1, 0x2730($at)
    jal         func_800364E4
    andi        $a0, $v0, 0xFFFF
    bgez        $v0, .L800C2E98
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0xFFFD
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    jal         func_800BE300
    nop
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sh          $v0, 0xC20($at)
    j           func_800BE76C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0x2
    bnez        $v0, .L800C2E98
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, 0xC20($at)
    jal         func_80016FD4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x4CC4($v1)
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lh          $a1, 0x2730($at)
    jal         func_8003647C
    andi        $a0, $v0, 0xFFFF
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    ori         $v0, $v0, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
    j           func_800BE774
    nop
.L800C2E78:
    jal         func_800BE300
    nop
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    jal         func_8002FFEC
    nop
.L800C2E98:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C2DA0

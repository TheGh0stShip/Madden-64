.text
.align 2
.set noreorder
.globl func_800B03C4
.ent func_800B03C4
func_800B03C4:
    lui         $v1, 0x8007
    lh          $v1, -0x4640($v1)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800B03F4
    sw          $ra, 0x18($sp)
    jal         func_800AD460
    nop
.L800B03F4:
    andi        $a2, $s0, 0xFFFF
    beqz        $a2, .L800B0410
    nop
    lui         $a0, 0x800B
    addiu       $a0, $a0, -0x2A78
    jal         func_8002FEA4
    addiu       $a1, $zero, 0x4
.L800B0410:
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4674
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x0($a1)
    andi        $v0, $s1, 0xFFFF
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x251C($at)
    addiu       $a0, $zero, 0x98
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    lui         $at, 0x8007
    sh          $v0, -0x4640($at)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B03C4

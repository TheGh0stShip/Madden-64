.text
.align 2
.set noreorder
.globl func_800C28D4
.ent func_800C28D4
func_800C28D4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    andi        $v0, $v0, 0x2000
    bnez        $v0, .L800C2A14
    sw          $ra, 0x10($sp)
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
    lui         $at, 0x8009
    sh          $zero, -0x5C04($at)
    beql        $v1, $zero, .L800C29E4
    addiu       $v0, $zero, 0x4
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4C($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x6D48($v1)
    subu        $v0, $v0, $v1
    j           func_800BE214
    addiu       $v0, $v0, 0xFF
.L800C292C:
    lui         $v0, 0x8009
    lhu         $v0, -0x4CC4($v0)
    addiu       $v0, $v0, 0xFFF
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
    sll         $v0, $v0, 16
    bltz        $v0, .L800C292C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x4CC4($v0)
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    srl         $v0, $v0, 9
    andi        $v0, $v0, 0x7
    sltiu       $v1, $v1, 0x180
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
    beqz        $v1, .L800C2980
    addiu       $v0, $v0, 0x8
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
.L800C2980:
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0x2
    bnez        $v0, .L800C29E4
    addiu       $v0, $zero, 0x1
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
    j           func_800BE2C8
    nop
.L800C29E4:
    lui         $at, 0x8008
    sh          $v0, 0xC20($at)
    lui         $a0, 0x800C
    addiu       $a0, $a0, -0x19BC
    addiu       $a1, $zero, 0x1
    jal         func_8002FEA4
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x2000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800C2A14:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C28D4

.text
.align 2
.set noreorder
.globl func_8003FD94
.ent func_8003FD94
func_8003FD94:
    lui         $v1, 0x8008
    lb          $v1, 0x7AFC($v1)
    lui         $a1, 0x8008
    lb          $a1, 0x76F4($a1)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x1C($sp)
    sw          $s0, 0x18($sp)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x2D86($at)
    lw          $v1, 0x24($a0)
    sll         $v0, $v0, 3
    lw          $v1, 0x14($v1)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $a0, 0x3E28($at)
    lui         $v0, 0x10
    and         $v1, $v1, $v0
    beqz        $v1, .L8003FE20
    sll         $v0, $a0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s0, 0x3DCC($at)
    j .L8003FE2C
    nop
.L8003FE20:
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s0, 0x3DF8($at)
.L8003FE2C:
    jal         func_80093F0C
    nop
    beqz        $v0, .L8003FE7C
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L8003FE80
    addu        $v0, $s0, $zero
    lui         $v0, 0x8009
    lb          $v0, -0x7B7C($v0)
    bnez        $v0, .L8003FE80
    addu        $v0, $zero, $zero
    sw          $zero, 0x10($sp)
    addiu       $a0, $zero, 0x2
    addiu       $a1, $zero, 0x14
    addu        $a2, $zero, $zero
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
.L8003FE7C:
    addu        $v0, $zero, $zero
.L8003FE80:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8003FD94

.text
.align 2
.set noreorder
.globl func_800BA0E4
.ent func_800BA0E4
func_800BA0E4:
    lui         $v0, 0x8009
    lhu         $v0, -0x502E($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x502E($at)
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    lui         $a2, 0x8007
    lw          $a2, 0x18E8($a2)
    sll         $v0, $a0, 4
    addu        $v0, $a2, $v0
    lw          $v0, 0x48($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x502E($v1)
    srl         $v0, $v0, 7
    andi        $a1, $v0, 0xF
    addu        $v0, $v1, $zero
    slt         $v1, $v1, $a1
    bnez        $v1, .L800BA198
    subu        $v0, $v0, $a1
    lhu         $v1, 0xA($a2)
    lui         $at, 0x8009
    sh          $v0, -0x502E($at)
    beq         $a0, $v1, .L800BA188
    addiu       $v0, $zero, 0x1
    jal         func_800B5028
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B5D88
    nop
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    jal         func_800B74FC
    nop
    j           func_800B59E4
    nop
.L800BA188:
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
.L800BA198:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BA0E4

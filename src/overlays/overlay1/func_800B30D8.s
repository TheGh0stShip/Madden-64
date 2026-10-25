.text
.align 2
.set noreorder
.globl func_800B30D8
.ent func_800B30D8
func_800B30D8:
    lui         $v0, 0x8008
    lh          $v0, 0x7752($v0)
    addiu       $sp, $sp, -0x20
    addu        $a2, $a0, $zero
    sw          $ra, 0x18($sp)
    bnez        $v0, .L800B30FC
    addu        $v1, $v0, $zero
    j           func_800AEA38
    sw          $zero, 0x0($a2)
.L800B30FC:
    addiu       $v0, $v1, -0x1
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x5D80
    lui         $at, 0x8008
    sh          $v0, 0x7752($at)
    lw          $v0, 0x0($a3)
    lw          $v1, 0x4($a3)
    lw          $a0, 0x8($a3)
    lw          $a1, 0xC($a3)
    sw          $v0, 0x0($a2)
    sw          $v1, 0x4($a2)
    sw          $a0, 0x8($a2)
    sw          $a1, 0xC($a2)
    lw          $v0, 0x10($a3)
    sw          $v0, 0x10($a2)
    lui         $v0, 0x8008
    lh          $v0, 0x7752($v0)
    beqz        $v0, .L800B315C
    sll         $a2, $v0, 2
    addu        $a2, $a2, $v0
    addu        $a0, $a3, $zero
    addiu       $a1, $a0, 0x14
    jal         func_8002E17C
    sll         $a2, $a2, 2
.L800B315C:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B30D8

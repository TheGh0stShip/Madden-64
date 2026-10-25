.text
.align 2
.set noreorder
.globl func_800B2E98
.ent func_800B2E98
func_800B2E98:
    lui         $v1, 0x8008
    lhu         $v1, 0x7914($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B2EDC
    sw          $ra, 0x10($sp)
    jal         func_80036540
    addiu       $a0, $zero, 0x1
    bnez        $v0, .L800B2EDC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    lui         $at, 0x8008
    sh          $zero, 0x7914($at)
    andi        $v0, $v0, 0xFFFD
    lui         $at, 0x8009
    sh          $v0, -0x58E4($at)
.L800B2EDC:
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800B2EF8
    lui         $a0, 0x4
    j           func_800AE7D8
    ori         $a0, $a0, 0x4
.L800B2EF8:
    addiu       $a0, $zero, 0x4
    jal         func_8002E9E8
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B2E98

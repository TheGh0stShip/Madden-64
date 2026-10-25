.text
.align 2
.set noreorder
.globl func_800B0304
.ent func_800B0304
func_800B0304:
    lui         $v1, 0x8007
    lh          $v1, -0x4644($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    sw          $ra, 0x14($sp)
    bne         $v1, $v0, .L800B03B0
    sw          $s0, 0x10($sp)
    lui         $a1, 0x8008
    lh          $a1, 0x76DC($a1)
    slti        $v0, $a1, 0x5
    beqz        $v0, .L800B035C
    addiu       $v0, $zero, 0x5
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x6A78
    jal         func_800AB2D0
    addu        $a0, $s0, $zero
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2070
    j           func_800ABC68
    addu        $a0, $v0, $s0
.L800B035C:
    bne         $a1, $v0, .L800B037C
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6A78
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2068
    j           func_800ABC68
    nop
.L800B037C:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6A78
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4008
    jal         func_8002E65C
    nop
    addiu       $a0, $zero, 0xE8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4634
    jal         func_800AACE8
    addiu       $a2, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4644($at)
.L800B03B0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B0304

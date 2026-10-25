.text
.align 2
.set noreorder
.globl func_80095C60
.ent func_80095C60
func_80095C60:
    lui         $v0, 0x8008
    lb          $v0, 0x7AF2($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    bnez        $v0, .L80095CDC
    sw          $ra, 0x14($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lw          $v1, 0x8($s0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x8($s0)
    slti        $v0, $v0, 0x1E1
    bnez        $v0, .L80095CDC
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x6BE4($a0)
    jal         func_800AADA8
    nop
    jal         func_8002FF70
    addu        $a0, $s0, $zero
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
    jal         func_800AE700
    nop
    lui         $at, 0x8007
    sw          $zero, -0x468C($at)
    lui         $at, 0x8007
    sw          $zero, -0x4690($at)
    lui         $at, 0x8007
    sw          $zero, -0x4688($at)
.L80095CDC:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80095C60

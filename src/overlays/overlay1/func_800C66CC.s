.text
.align 2
.set noreorder
.globl func_800C66CC
.ent func_800C66CC
func_800C66CC:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x1C($sp)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800C6800
    sw          $s0, 0x18($sp)
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800C6800
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beqz        $v0, .L800C67E8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7B58($a0)
    bne         $a0, $v0, .L800C67B0
    addiu       $s0, $zero, -0x1
    lui         $v0, 0x8009
    lh          $v0, -0x49D6($v0)
    beq         $v0, $s0, .L800C673C
    addu        $v1, $v0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $v0, $v1, $v0
    lui         $at, 0x8009
    sh          $v0, -0x49D6($at)
.L800C673C:
    jal         func_800A29C0
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    lh          $v1, 0x30($v1)
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6AE0($at)
    beqz        $v1, .L800C6788
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F50($v0)
    slt         $v0, $v0, $a0
    beqz        $v0, .L800C6800
    nop
.L800C6778:
    jal         func_800C20F0
    nop
    j           func_800C20DC
    nop
.L800C6788:
    lui         $v0, 0x8009
    lh          $v0, -0x49D6($v0)
    beq         $v0, $s0, .L800C6778
    slti        $v0, $v0, 0x6
    beqz        $v0, .L800C6778
    nop
    lui         $at, 0x8008
    sw          $a0, 0x4F50($at)
    j           func_800C20DC
    nop
.L800C67B0:
    jal         func_800C1EB8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lui         $at, 0x8008
    sw          $a0, 0x7B58($at)
    jal         func_800A29C0
    nop
    lui         $at, 0x8009
    sw          $v0, -0x6AE0($at)
    lui         $at, 0x8008
    sw          $v0, 0x4F50($at)
    j           func_800C20DC
    nop
.L800C67E8:
    lui         $v0, 0x8008
    lw          $v0, 0x7B58($v0)
    beqz        $v0, .L800C6800
    nop
    jal         func_800C1EB8
    nop
.L800C6800:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C66CC

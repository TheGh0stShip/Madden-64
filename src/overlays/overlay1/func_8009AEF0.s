.text
.align 2
.set noreorder
.globl func_8009AEF0
.ent func_8009AEF0
func_8009AEF0:
    lui         $v0, 0x8009
    lhu         $v0, -0x503C($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    beqz        $v0, .L8009AF50
    sw          $ra, 0x14($sp)
.L8009AF0C:
    lui         $v0, 0x8008
    lw          $v0, 0x7958($v0)
    andi        $a0, $s0, 0xFFFF
    sll         $v1, $a0, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($v1)
    beqz        $v0, .L8009AF34
    nop
    jal         func_80096964
    nop
.L8009AF34:
    lui         $v1, 0x8009
    lhu         $v1, -0x503C($v1)
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8009AF0C
    nop
.L8009AF50:
    lui         $a0, 0x8009
    lw          $a0, -0x4F94($a0)
    jal         func_80033258
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x7958($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sh          $zero, -0x503C($at)
    lui         $at, 0x8009
    sw          $zero, -0x4F94($at)
    lui         $at, 0x8008
    sw          $zero, 0x7958($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009AEF0

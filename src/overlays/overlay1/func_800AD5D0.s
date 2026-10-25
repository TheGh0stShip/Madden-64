.text
.align 2
.set noreorder
.globl func_800AD5D0
.ent func_800AD5D0
func_800AD5D0:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    andi        $v0, $v1, 0x200
    beqz        $v0, .L800AD5FC
    addiu       $v0, $zero, -0x201
    and         $v0, $v1, $v0
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sh          $v0, -0x483E($at)
.L800AD5FC:
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x483C
    lb          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x30
    bne         $v1, $v0, .L800AD638
    addiu       $v0, $zero, 0x2D
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x8
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
    j           func_800A8F74
    nop
.L800AD638:
    beq         $v1, $v0, .L800AD698
    nop
    lui         $v0, 0x8008
    lhu         $v0, -0x5EA0($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x5EA0($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L800AD698
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x8
    lbu         $v1, 0x0($s0)
    lui         $v0, 0x8008
    lhu         $v0, -0x5EA0($v0)
    addiu       $v1, $v1, -0x1
    addiu       $v0, $v0, 0x3B
    lui         $at, 0x8008
    sh          $v0, -0x5EA0($at)
    sb          $v1, 0x0($s0)
.L800AD698:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AD5D0

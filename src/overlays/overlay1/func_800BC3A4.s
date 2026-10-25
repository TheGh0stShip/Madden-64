.text
.align 2
.set noreorder
.globl func_800BC3A4
.ent func_800BC3A4
func_800BC3A4:
    lui         $v1, 0x8009
    lw          $v1, -0x6D64($v1)
    addiu       $sp, $sp, -0x18
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L800BC4AC
    sw          $ra, 0x10($sp)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x25A0($at)
    jr          $v0
    nop
    lui         $v1, 0x8007
    lw          $v1, 0x34F8($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L800BC4AC
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sb          $zero, 0x6188($at)
    lui         $at, 0x8009
    sw          $v0, -0x6D64($at)
    j           func_800B7D88
    nop
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8009
    sw          $v0, -0x6D64($at)
    j           func_800B7D88
    nop
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8009
    sh          $zero, -0x5030($at)
    lui         $at, 0x8009
    sw          $v0, -0x6D64($at)
    j           func_800B7D88
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5030($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $a1, 0x8007
    lw          $a1, 0x34F8($a1)
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x5030($at)
    addiu       $v0, $zero, -0x1
    bne         $a1, $v0, .L800BC4AC
    nop
    lui         $v0, 0x8008
    lbu         $v0, 0x6188($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5C08($at)
    bne         $a0, $a1, .L800BC490
    nop
    lui         $at, 0x8009
    sw          $zero, -0x6D64($at)
    j           func_800B7D88
    nop
.L800BC490:
    jal         func_8003D464
    nop
    lui         $v0, 0x8008
    lbu         $v0, 0x6188($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x6188($at)
.L800BC4AC:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BC3A4

.text
.align 2
.set noreorder
.globl display_object_transform
.ent display_object_transform
display_object_transform:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lb          $v0, 0x242($a0)
    bgez        $v0, .L8000D050
    addiu       $v0, $zero, 0xFF
    lbu         $v0, 0x241($a0)
    bnez        $v0, .L8000D068
    nop
    lhu         $v0, 0x206($a0)
    j .L8000D064
    andi        $v0, $v0, 0xFBF7
.L8000D050:
    lbu         $v1, 0x241($a0)
    bne         $v1, $v0, .L8000D068
    nop
    lhu         $v0, 0x206($a0)
    andi        $v0, $v0, 0xFBFF
.L8000D064:
    sh          $v0, 0x206($a0)
.L8000D068:
    lb          $v1, 0x242($a0)
    bgez        $v1, .L8000D090
    addu        $a1, $v1, $zero
    lbu         $a2, 0x241($a0)
    negu        $v0, $v1
    slt         $v0, $v0, $a2
    bnez        $v0, .L8000D0AC
    addu        $v0, $a2, $a1
    j .L8000D0B0
    sb          $zero, 0x241($a0)
.L8000D090:
    lbu         $a2, 0x241($a0)
    addiu       $v0, $zero, 0xFF
    subu        $v0, $v0, $a2
    slt         $v0, $v1, $v0
    bnez        $v0, .L8000D0AC
    addu        $v0, $a2, $a1
    addiu       $v0, $zero, 0xFF
.L8000D0AC:
    sb          $v0, 0x241($a0)
.L8000D0B0:
    lbu         $v1, 0x240($a0)
    beqz        $v1, .L8000D0CC
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8000D0DC
    nop
    j .L8000D100
    nop
.L8000D0CC:
    lbu         $v0, 0x241($a0)
    nor         $s1, $zero, $v0
    j .L8000D100
    addu        $s0, $s1, $zero
.L8000D0DC:
    lbu         $v1, 0x241($a0)
    sltiu       $v0, $v1, 0x80
    beqz        $v0, .L8000D0F4
    sll         $v0, $v1, 1
    j .L8000D0F8
    nor         $s0, $zero, $v0
.L8000D0F4:
    addu        $s0, $zero, $zero
.L8000D0F8:
    lbu         $v0, 0x241($a0)
    nor         $s1, $zero, $v0
.L8000D100:
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C810
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $a0, 0x40
    ori         $a0, $a0, 0x41C8
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x41C8
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3001
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    jal         func_8000A22C
    addiu       $a0, $zero, 0x80
    jal         func_8000A984
    lui         $a0, 0x8
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFE
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0x793C
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A270
    sw          $a1, 0x4($v1)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_80009E9C
    addiu       $a0, $zero, 0x20
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    sll         $v0, $v0, 6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $s0, 0x7FFF($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    sll         $v0, $v0, 6
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $s0, -0x7FF1($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $a1, 0x400
    sll         $v0, $v0, 6
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $s1, -0x7FE1($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    ori         $a1, $a1, 0x103F
    lui         $a2, 0xB100
    sll         $v0, $v0, 6
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $s1, -0x7FD1($at)
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    ori         $a2, $a2, 0x206
    addiu       $v0, $a0, 0x8
    sll         $v1, $v1, 6
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7FF0
    addu        $v1, $v1, $v0
    addiu       $v0, $a0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x604
    sw          $a1, 0x0($a0)
    sw          $v1, 0x4($a0)
    sw          $a2, 0x8($a0)
    sw          $v0, 0xC($a0)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end display_object_transform

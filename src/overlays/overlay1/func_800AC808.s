.text
.align 2
.set noreorder
.globl func_800AC808
.ent func_800AC808
func_800AC808:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $a0, 0x8008
    lh          $a0, -0x5E98($a0)
    addiu       $sp, $sp, -0x18
    addiu       $v1, $zero, 0x1
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    sh          $v1, -0x5EA2($at)
    lui         $at, 0x8008
    sh          $v1, -0x5EA4($at)
    beqz        $a0, .L800AC9B8
    andi        $s0, $v0, 0xFFFF
    blez        $s0, .L800AC8B0
    nop
.L800AC848:
    lui         $v0, 0x8008
    lw          $v0, -0x5F04($v0)
    lw          $a0, 0x20($v0)
    jal         func_800A82B0
    addiu       $a1, $zero, -0x8C
    lui         $v1, 0x8008
    lw          $v1, -0x5F04($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5EFC($a0)
    sw          $v0, 0x20($v1)
    lw          $a0, 0x1C($a0)
    jal         func_800A82B0
    addiu       $a1, $zero, 0x140
    lui         $v1, 0x8008
    lw          $v1, -0x5EFC($v1)
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    sw          $v0, 0x1C($v1)
    lw          $a0, 0x20($a0)
    jal         func_800A82B0
    addiu       $a1, $zero, 0x8C
    lui         $v1, 0x8008
    lw          $v1, -0x5F00($v1)
    addiu       $s0, $s0, -0x1
    bgtz        $s0, .L800AC848
    sw          $v0, 0x20($v1)
.L800AC8B0:
    lui         $v0, 0x8008
    lw          $v0, -0x5F04($v0)
    lui         $v1, 0x8008
    lw          $v1, -0x5EFC($v1)
    lui         $a1, 0x8008
    lw          $a1, -0x5F00($a1)
    lw          $a0, 0x20($v0)
    lw          $v0, 0x1C($v1)
    lw          $v1, 0x20($a1)
    addiu       $s0, $a0, 0x8C
    addiu       $v0, $v0, -0x140
    or          $s0, $s0, $v0
    addiu       $v1, $v1, -0x8C
    or          $s0, $s0, $v1
    bnez        $s0, .L800AC9C0
    nop
    jal         func_8003190C
    addiu       $a0, $zero, 0x1000
    lui         $a0, 0x8008
    lw          $a0, -0x5EF8($a0)
    jal         func_80016FF4
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5EF4($a0)
    jal         func_80016FF4
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5EF0($a0)
    jal         func_80016FF4
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5EEC($a0)
    jal         func_80016FF4
    nop
    jal         func_800A9154
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F30($a0)
    jal         func_8001AEA8
    nop
    lui         $v1, 0x8007
    lhu         $v1, -0x4858($v1)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800AC9B0
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7758($v0)
    beqz        $v0, .L800AC98C
    nop
    jal         func_8009CA08
    nop
    beqz        $v0, .L800AC98C
    nop
    jal         func_8009C99C
    nop
.L800AC98C:
    lui         $v0, 0x8007
    lh          $v0, -0x483E($v0)
    beqz        $v0, .L800AC9B0
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x200
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800AC9B0:
    jal         func_800AAC94
    nop
.L800AC9B8:
    lui         $at, 0x8007
    sh          $zero, -0x4858($at)
.L800AC9C0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AC808

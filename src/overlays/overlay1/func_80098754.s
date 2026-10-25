.text
.align 2
.set noreorder
.globl func_80098754
.ent func_80098754
func_80098754:
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800987F0
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8008
    lhu         $v0, 0x79A0($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, 0x79A0($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x64
    bnez        $v0, .L800987F0
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7948($v0)
    beqz        $v0, .L800987CC
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7AC8($a0)
    jal         func_80016FF4
    nop
    lui         $at, 0x8008
    sh          $zero, 0x7948($at)
    j           func_800940C4
    nop
.L800987CC:
    lui         $a0, 0x8008
    lw          $a0, 0x7AC8($a0)
    jal         func_80016FE4
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x7948($at)
    lui         $at, 0x8008
    sh          $zero, 0x79A0($at)
.L800987F0:
    lui         $v1, 0x8009
    lhu         $v1, -0x72D8($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8009887C
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x5128($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x593C($v0)
    addiu       $a0, $v1, 0x13C6
    sltu        $v0, $v0, $a0
    bnez        $v0, .L8009887C
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    bnez        $v0, .L8009887C
    nop
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6A3C
    lhu         $v1, 0x0($v0)
    lui         $at, 0x8008
    sw          $a0, 0x5128($at)
    addiu       $v1, $v1, 0x1
    sh          $v1, 0x0($v0)
    andi        $v1, $v1, 0xFF
    addiu       $v0, $zero, 0x80
    bne         $v1, $v0, .L8009887C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5070($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x5070($at)
    jal         func_80097120
    andi        $a0, $v0, 0xFF
.L8009887C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80098754

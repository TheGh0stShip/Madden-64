.text
.align 2
.set noreorder
.globl func_80096F54
.ent func_80096F54
func_80096F54:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sw          $ra, 0x18($sp)
    bne         $a0, $v0, .L80096FCC
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0xFFFF
    ori         $v1, $v1, 0x7E36
    lui         $at, 0x8009
    sw          $zero, -0x78EC($at)
    ori         $v0, $v0, 0x800
    and         $v1, $v0, $v1
    andi        $v0, $v0, 0x2
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    beqz        $v0, .L80096FB8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5026($at)
.L80096FB8:
    lui         $v0, 0x8008
    lhu         $v0, 0x7758($v0)
    addiu       $v0, $v0, -0x3
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
.L80096FCC:
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x57CA
    lh          $v0, 0x0($v1)
    bgtzl       $v0, .L80096FE0
    sh          $zero, 0x0($v1)
.L80096FE0:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80097020
    sll         $v0, $s1, 16
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sra         $v0, $v0, 16
    beq         $v0, $v1, .L80097018
    addiu       $a0, $zero, 0xC
    lui         $v0, 0x8008
    lb          $v0, 0x5026($v0)
    bnez        $v0, .L80097020
    addu        $a0, $zero, $zero
.L80097018:
    jal         func_80041718
    nop
.L80097020:
    lui         $at, 0x8008
    sw          $zero, 0xC1C($at)
    jal         func_8003890C
    nop
    sll         $v0, $s1, 16
    sra         $s0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v1, 0x6DDC($at)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80097068
    nop
    jal         func_80038150
    andi        $a0, $s1, 0xFFFF
    jal         func_800E1EF8
    addu        $a0, $s0, $zero
    jal         func_800D62A8
    nop
.L80097068:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L80097084
    nop
    jal         func_800A365C
    addu        $a0, $zero, $zero
.L80097084:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80096F54

.text
.align 2
.set noreorder
.globl func_80098DC0
.ent func_80098DC0
func_80098DC0:
    swr         $a0, 0x2F($sp)
    swl         $a1, 0x30($sp)
    swr         $a1, 0x33($sp)
    lwl         $v1, 0xC($a2)
    lwr         $v1, 0xF($a2)
    lh          $a0, 0x10($a2)
    swl         $v1, 0x34($sp)
    swr         $v1, 0x37($sp)
    sh          $a0, 0x38($sp)
    lui         $at, 0x8007
    sw          $s2, -0x6434($at)
    ori         $v0, $v0, 0x2000
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
.L80098DF8:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6444
    jal         func_8000D740
    addiu       $a1, $zero, 0xC
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xFA
    lw          $a0, 0x8($s2)
    lhu         $v1, 0x18($s1)
    lhu         $v0, 0x2E($a0)
    addu        $v0, $v0, $v1
    sh          $v0, 0x2E($a0)
    lw          $a0, 0x8($s2)
    lhu         $v1, 0x0($s1)
    lhu         $v0, 0x2C($a0)
    addu        $s0, $s3, $zero
    addu        $v0, $v0, $v1
    sh          $v0, 0x2C($a0)
    lw          $a0, 0x8($s2)
    addiu       $s3, $s3, -0x1
    jal         func_80098178
    addiu       $s1, $s1, -0x2
    bnez        $s0, .L80098DF8
    addiu       $v0, $zero, 0x800
    lui         $at, 0x8007
    sh          $v0, -0x6430($at)
    lui         $at, 0x8007
    sh          $v0, -0x642E($at)
    addiu       $v0, $zero, 0x4000
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    lui         $at, 0x8007
    sw          $zero, -0x6434($at)
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L80098F8C
    addiu       $a0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    beq         $v1, $a0, .L80098ED8
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x5A40($v0)
    beq         $v0, $a0, .L80098ED8
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L80098F8C
    nop
.L80098ED8:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x57C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lui         $v1, 0x8008
    lh          $v1, 0x5A40($v1)
    addu        $a0, $v0, $zero
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80098F20
    nop
    lb          $v0, 0x4($a0)
    slti        $v0, $v0, 0x5
    bnez        $v0, .L80098F20
    addiu       $v0, $zero, 0x2
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    bne         $v1, $v0, .L80098F8C
    nop
.L80098F20:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xC
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x643C
    addiu       $a2, $v1, -0x8
    addiu       $v0, $zero, 0xB
    jal         func_8000D740
    sh          $v0, 0x0($v1)
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF9
    lw          $v1, 0x8($s2)
    lhu         $v0, 0x2E($v1)
    addiu       $v0, $v0, 0xA33
    sh          $v0, 0x2E($v1)
    lw          $v1, 0x8($s2)
    lhu         $v0, 0x2C($v1)
    addiu       $v0, $v0, -0x99
    sh          $v0, 0x2C($v1)
    lw          $a0, 0x8($s2)
    jal         func_80098178
    nop
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0xFF
.L80098F8C:
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800990E4
    addiu       $v0, $zero, 0x6
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x643A
    lhu         $v1, 0x0($s0)
    bne         $v1, $v0, .L8009904C
    addiu       $v0, $zero, 0xF00
    lui         $at, 0x8007
    sh          $v0, -0x6442($at)
    addiu       $v0, $zero, 0x2400
    lui         $at, 0x8007
    sh          $v0, -0x6440($at)
    addiu       $v0, $zero, 0x1000
    lui         $at, 0x8007
    sh          $v0, -0x642E($at)
    addiu       $v0, $zero, 0xA00
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    addiu       $v0, $zero, 0xC
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v1, 0x8007
    lhu         $v1, -0x643C($v1)
    addiu       $a1, $zero, 0xC
    addu        $v1, $v1, $v0
    lui         $at, 0x8007
    sh          $v1, -0x643C($at)
    jal         func_8000D740
    addiu       $a2, $s0, -0xA
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF5
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x80
.L8009904C:
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800990E4
    addiu       $v0, $zero, 0xF00
    lui         $at, 0x8007
    sh          $v0, -0x6442($at)
    addiu       $v0, $zero, 0x2400
    lui         $at, 0x8007
    sh          $v0, -0x6440($at)
    addiu       $v0, $zero, 0x1000
    lui         $at, 0x8007
    sh          $v0, -0x642E($at)
    addiu       $v0, $zero, 0xA00
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    addiu       $v0, $zero, 0x10
    lui         $at, 0x8007
    sh          $v0, -0x643C($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v1, 0x8007
    lhu         $v1, -0x643C($v1)
    addiu       $a1, $zero, 0xC
    addu        $v1, $v1, $v0
    lui         $at, 0x8007
    sh          $v1, -0x643C($at)
    jal         func_8000D740
    addiu       $a2, $s0, -0xA
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF5
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x80
.L800990E4:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xC
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x6444
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x0($s0)
    lui         $at, 0x8007
    sh          $zero, -0x643C($at)
    jal         func_8000D740
    addu        $a2, $s0, $zero
    jal         func_80016FD4
    addu        $s5, $v0, $zero
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x57C
    lui         $at, 0x8007
    sh          $v0, -0x643E($at)
    addiu       $v0, $zero, 0x300
    sh          $zero, 0x0($s0)
    lui         $at, 0x8007
    sh          $v0, -0x6442($at)
    addiu       $v0, $zero, 0xF00
    lui         $at, 0x8007
    sh          $v0, -0x6440($at)
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addu        $a0, $v0, $zero
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8009918C
    addiu       $v0, $zero, 0x14
    lb          $v1, 0x4($a0)
    bne         $v1, $v0, .L8009917C
    addiu       $v0, $zero, 0x15
    addiu       $s3, $zero, 0x146
    j           func_80094A84
    addiu       $s4, $zero, 0x147
.L8009917C:
    bne         $v1, $v0, .L8009918C
    addiu       $s3, $zero, 0x145
    j           func_80094A84
    addiu       $s4, $zero, 0x149
.L8009918C:
    lui         $v0, 0x8008
    lbu         $v0, 0xC90($v0)
    addiu       $s4, $zero, 0x148
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $s3, 0x1B3C($at)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xC
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x643C
    addiu       $s1, $s0, -0x8
    ori         $v0, $zero, 0xC100
    sh          $s3, 0x0($s0)
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    jal         func_8000D740
    addu        $a2, $s1, $zero
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF8
    lw          $v1, 0x8($s2)
    lhu         $v0, 0x2C($v1)
    addiu       $v0, $v0, 0x1080
    sh          $v0, 0x2C($v1)
    lw          $a0, 0x8($s2)
    jal         func_80098178
    nop
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x96
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xC
    addiu       $v0, $zero, 0x100
    sh          $s3, 0x0($s0)
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    jal         func_8000D740
    addu        $a2, $s1, $zero
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF8
    lw          $v1, 0x8($s2)
    lhu         $v0, 0x2C($v1)
    addiu       $v0, $v0, -0x1080
    sh          $v0, 0x2C($v1)
    lw          $a0, 0x8($s2)
    jal         func_80098178
    nop
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x96
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xC
    addiu       $v0, $zero, 0x4000
    sh          $s4, 0x0($s0)
    lui         $at, 0x8007
    sh          $v0, -0x6436($at)
    addiu       $v0, $zero, 0x3
    sh          $v0, -0x8($s0)
    addiu       $v0, $zero, 0x2D9
    lui         $at, 0x8007
    sh          $v0, -0x6440($at)
    lui         $at, 0x8007
    sh          $v0, -0x6442($at)
    addiu       $v0, $zero, 0x800
    lui         $at, 0x8007
    sh          $v0, -0x642E($at)
    lui         $at, 0x8007
    sh          $v0, -0x6430($at)
    jal         func_8000D740
    addu        $a2, $s1, $zero
    addu        $s2, $v0, $zero
    addu        $a0, $s2, $zero
    jal         func_80098DB4
    addiu       $a1, $zero, 0xF6
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x78
    addiu       $v0, $zero, 0x149
    bne         $s4, $v0, .L800992F4
    addu        $a0, $s2, $zero
    jal         func_80098DC0
    addiu       $a1, $zero, 0x64
    addu        $a0, $s2, $zero
.L800992F4:
    jal         func_8009A50C
    addu        $a1, $s5, $zero
    lui         $at, 0x8007
    sh          $zero, -0x6436($at)
    lw          $ra, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end func_80098DC0

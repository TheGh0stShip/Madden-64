.text
.align 2
.set noreorder
.globl func_80090B14
.ent func_80090B14
func_80090B14:
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 20
    negu        $v0, $v0
    sw          $v0, 0x20($v1)
    andi        $v0, $a1, 0xFFFF
    sltu        $v0, $v0, $a2
    bnez        $v0, . + 4 + (-0x10 << 2)
    andi        $a0, $a1, 0xFFFF
    jal         func_800373B4
    addu        $a0, $zero, $zero
    jal         func_800373B4
    addiu       $a0, $zero, 0x1
    jal         func_80021EE0
    addu        $a0, $zero, $zero
    jal         func_80021EE0
    addiu       $a0, $zero, 0x1
    jal         func_80025AB8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    jal         func_800BF6E8
    nop
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sh          $v0, 0x2D96($at)
    lui         $at, 0x8008
    sh          $v0, 0x4EE2($at)
    lui         $at, 0x8008
    sh          $v0, 0x2DA4($at)
    addiu       $v0, $zero, 0x24
    lui         $at, 0x8008
    sh          $v0, 0x2D98($at)
    addiu       $v0, $zero, 0x11
    lui         $at, 0x8008
    sh          $v0, 0x2DA8($at)
    addiu       $v0, $zero, 0x38
    lui         $at, 0x8008
    sh          $v0, 0x2D9C($at)
    addiu       $v0, $zero, 0x12
    lui         $at, 0x8008
    sh          $v0, 0x2DAC($at)
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8008
    sh          $v0, 0x2DA0($at)
    addiu       $v0, $zero, 0x6
    lui         $at, 0x8008
    sh          $v0, 0x2D9A($at)
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sh          $v0, 0x2D9E($at)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8008
    sh          $zero, 0x2D94($at)
    lui         $at, 0x8008
    sh          $zero, 0x4EE0($at)
    lui         $at, 0x8008
    sh          $zero, 0x2DB0($at)
    lui         $at, 0x8008
    sh          $zero, 0x4EFC($at)
.end func_80090B14

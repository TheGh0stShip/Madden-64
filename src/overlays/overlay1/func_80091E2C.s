.text
.align 2
.set noreorder
.globl func_80091E2C
.ent func_80091E2C
func_80091E2C:
    bne         $v1, $v0, . + 4 + (0xC7 << 2)
    nop
    lui         $a0, 0x8008
    lw          $a0, 0xC10($a0)
    andi        $v0, $a0, 0x800
    beqz        $v0, . + 4 + (0xC2 << 2)
    nop
    lui         $a1, 0x8008
    lh          $a1, 0x7758($a1)
    lui         $v0, 0x8009
    lh          $v0, -0x6CAC($v0)
    slt         $v0, $v0, $a1
    bnez        $v0, .L80091F08
    addu        $v1, $a1, $zero
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80091EB0
    andi        $v0, $a0, 0x2
    bnez        $v0, .L80091EF8
    addiu       $v0, $zero, -0x1
    jal         func_8008F318
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80091ED0
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x7758($v0)
    addiu       $v0, $v0, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CAC($at)
    j           func_8008D96C
    nop
.L80091EB0:
    andi        $v0, $a0, 0x4
    bnez        $v0, .L80091EF8
    addiu       $v0, $zero, -0x1
    jal         func_8008F318
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L80091EE0
    nop
.L80091ED0:
    jal         func_8008F624
    nop
    j           func_8008D96C
    nop
.L80091EE0:
    lui         $v0, 0x8008
    lhu         $v0, 0x7758($v0)
    lui         $at, 0x8009
    sh          $v0, -0x6CAC($at)
    j           func_8008D96C
    nop
.L80091EF8:
    lui         $at, 0x8009
    sh          $v0, -0x6CAC($at)
    j           func_8008D96C
    nop
.L80091F08:
    lui         $v0, 0x8008
    lh          $v0, 0x69D6($v0)
    slt         $v0, $v0, $a1
    bnez        $v0, .L80092090
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
    jal         func_8008F318
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L80092090
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CAC($v0)
    bnez        $v0, .L80091FA8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0xC10($a0)
    andi        $a0, $a0, 0x20
    sltiu       $a0, $a0, 0x1
    negu        $a0, $a0
    andi        $a0, $a0, 0x7
    jal         func_80031A1C
    ori         $a0, $a0, 0x2
    lui         $v1, 0x8008
    lhu         $v1, 0x7758($v1)
    addiu       $v1, $v1, -0x1
    subu        $v1, $v1, $v0
    addu        $a0, $v1, $zero
    sll         $v1, $v1, 16
    blezl       $v1, .L80091F88
    addiu       $a0, $zero, 0x1
.L80091F88:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, 0x1200
    andi        $v0, $v0, 0x1200
    beql        $v0, $v1, .L80091FA0
    addiu       $a0, $zero, 0x2
.L80091FA0:
    lui         $at, 0x8009
    sh          $a0, -0x6CAC($at)
.L80091FA8:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L8009202C
    nop
    jal         func_8008F414
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    beqz        $v0, .L80092090
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8008
    sh          $v0, 0x5BFE($at)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L80092008
    nop
    jal         func_800A365C
    addu        $a0, $zero, $zero
.L80092008:
    jal         func_8003CBC8
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80092090
    nop
    jal         func_800416A4
    addiu       $a0, $zero, 0x9
    j           func_8008D96C
    nop
.L8009202C:
    jal         func_8008F414
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80092090
    nop
    jal         func_8008F600
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80092090
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
    jal         func_8003CBB8
    nop
    addiu       $a0, $zero, 0x17
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $a1, $v0, 2
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 1
    addiu       $a1, $a1, 0x57
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
.L80092090:
    lui         $v0, 0x8008
    lhu         $v0, 0x6CB0($v0)
    lui         $v1, 0x8008
    lh          $v1, 0x69D6($v1)
    addiu       $v0, $v0, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x6CB0($at)
    bgez        $v1, . + 4 + (0x27 << 2)
    nop
    lui         $v0, 0x8008
.end func_80091E2C

.text
.align 2
.set noreorder
.globl runtime_flags_update
.ent runtime_flags_update
runtime_flags_update:
    sll         $v0, $a1, 24
    sra         $a3, $v0, 24
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x7F90
    sll         $v0, $a3, 2
    addu        $v0, $v0, $v1
    lui         $v1, 0x8009
    lw          $v1, -0x6CA8($v1)
    lw          $a2, 0x0($v0)
    sw          $a0, 0x0($v0)
    and         $v1, $v1, $a2
    nor         $v1, $zero, $v1
    and         $t0, $v1, $a0
    andi        $v0, $t0, 0x200
    beqz        $v0, .L80031D20
    addiu       $sp, $sp, -0x60
    sll         $v1, $a3, 1
    addiu       $v0, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sh          $v0, -0x49B8($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x4C78
    addu        $a2, $v1, $v0
    lh          $a3, 0x0($a2)
    lui         $t1, 0x8009
    lh          $t1, -0x7F58($t1)
    addu        $a0, $a3, $zero
    slt         $v0, $a3, $t1
    bnez        $v0, .L80031CF4
    addu        $v1, $t1, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a2)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, .L80031D18
    addiu       $v0, $zero, -0x101
.L80031CEC:
    j .L80031D14
    sh          $zero, 0x0($a2)
.L80031CF4:
    addiu       $v0, $zero, -0x1516
    beq         $a3, $v0, .L80031CEC
    addiu       $v1, $zero, -0x201
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    sh          $v0, 0x0($a2)
.L80031D14:
    addiu       $v0, $zero, -0x101
.L80031D18:
    j .L80031D34
    and         $t0, $t0, $v0
.L80031D20:
    sll         $v1, $a3, 1
    addiu       $v0, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sh          $v0, -0x4C78($at)
.L80031D34:
    andi        $v0, $t0, 0x100
    beqz        $v0, .L80031DC4
    sll         $v0, $a1, 24
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x4C78($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x49B8
    addu        $a2, $v0, $v1
    lh          $a3, 0x0($a2)
    lui         $t1, 0x8009
    lh          $t1, -0x7F58($t1)
    addu        $a0, $a3, $zero
    slt         $v0, $a3, $t1
    bnez        $v0, .L80031DA0
    addu        $v1, $t1, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a2)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, .L80031DDC
    andi        $v0, $t0, 0x800
.L80031D98:
    j .L80031DD8
    sh          $zero, 0x0($a2)
.L80031DA0:
    addiu       $v0, $zero, -0x1516
    beq         $a3, $v0, .L80031D98
    addiu       $v1, $zero, -0x101
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    j .L80031DD8
    sh          $v0, 0x0($a2)
.L80031DC4:
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x49B8($at)
.L80031DD8:
    andi        $v0, $t0, 0x800
.L80031DDC:
    beqz        $v0, .L80031E70
    sll         $v0, $a1, 24
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x4D60($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x49D0
    addu        $a2, $v0, $v1
    lh          $a3, 0x0($a2)
    lui         $t1, 0x8009
    lh          $t1, -0x7F58($t1)
    addu        $a0, $a3, $zero
    slt         $v0, $a3, $t1
    bnez        $v0, .L80031E44
    addu        $v1, $t1, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a2)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, .L80031E68
    addiu       $v0, $zero, -0x401
.L80031E3C:
    j .L80031E64
    sh          $zero, 0x0($a2)
.L80031E44:
    addiu       $v0, $zero, -0x1516
    beq         $a3, $v0, .L80031E3C
    addiu       $v1, $zero, -0x801
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    sh          $v0, 0x0($a2)
.L80031E64:
    addiu       $v0, $zero, -0x401
.L80031E68:
    j .L80031E84
    and         $t0, $t0, $v0
.L80031E70:
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x49D0($at)
.L80031E84:
    andi        $v0, $t0, 0x400
    beqz        $v0, .L80031F14
    sll         $v0, $a1, 24
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x49D0($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4D60
    addu        $a2, $v0, $v1
    lh          $a3, 0x0($a2)
    lui         $t1, 0x8009
    lh          $t1, -0x7F58($t1)
    addu        $a0, $a3, $zero
    slt         $v0, $a3, $t1
    bnez        $v0, .L80031EF0
    addu        $v1, $t1, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a2)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, .L80031F2C
    andi        $v0, $t0, 0x2020
.L80031EE8:
    j .L80031F28
    sh          $zero, 0x0($a2)
.L80031EF0:
    addiu       $v0, $zero, -0x1516
    beq         $a3, $v0, .L80031EE8
    addiu       $v1, $zero, -0x401
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    j .L80031F28
    sh          $v0, 0x0($a2)
.L80031F14:
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x4D60($at)
.L80031F28:
    andi        $v0, $t0, 0x2020
.L80031F2C:
    beqz        $v0, .L80031FC0
    sll         $v0, $a1, 24
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x49C0($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x4C80
    addu        $a2, $v0, $v1
    lh          $a3, 0x0($a2)
    lui         $t1, 0x8009
    lh          $t1, -0x7F58($t1)
    addu        $a0, $a3, $zero
    slt         $v0, $a3, $t1
    bnez        $v0, .L80031F94
    addu        $v1, $t1, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a2)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, .L80031FB8
    addiu       $v0, $zero, -0x11
.L80031F8C:
    j .L80031FB4
    sh          $zero, 0x0($a2)
.L80031F94:
    addiu       $v0, $zero, -0x1516
    beq         $a3, $v0, .L80031F8C
    addiu       $v1, $zero, -0x2021
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    sh          $v0, 0x0($a2)
.L80031FB4:
    addiu       $v0, $zero, -0x11
.L80031FB8:
    j .L80031FD4
    and         $t0, $t0, $v0
.L80031FC0:
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x4C80($at)
.L80031FD4:
    andi        $v0, $t0, 0x10
    beqz        $v0, .L80032064
    sll         $v0, $a1, 24
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x4C80($at)
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x49C0
    addu        $a1, $v0, $v1
    lh          $a2, 0x0($a1)
    lui         $a3, 0x8009
    lh          $a3, -0x7F58($a3)
    addu        $a0, $a2, $zero
    slt         $v0, $a2, $a3
    bnez        $v0, .L80032040
    addu        $v1, $a3, $zero
    subu        $v0, $a0, $v1
    sh          $v0, 0x0($a1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a3
    bnez        $v0, .L8003207C
    addu        $v0, $t0, $zero
.L80032038:
    j .L80032078
    sh          $zero, 0x0($a1)
.L80032040:
    addiu       $v0, $zero, -0x1516
    beq         $a2, $v0, .L80032038
    addiu       $v1, $zero, -0x11
    lui         $v0, 0x8008
    lw          $v0, 0x76FC($v0)
    and         $t0, $t0, $v1
    addu        $v0, $a0, $v0
    j .L80032078
    sh          $v0, 0x0($a1)
.L80032064:
    sra         $v0, $v0, 23
    addiu       $v1, $zero, -0x1516
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $v1, -0x49C0($at)
.L80032078:
    addu        $v0, $t0, $zero
.L8003207C:
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end runtime_flags_update

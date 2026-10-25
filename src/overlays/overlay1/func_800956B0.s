.text
.align 2
.set noreorder
.globl func_800956B0
.ent func_800956B0
func_800956B0:
    sb          $v0, 0x28($sp)
    sb          $zero, 0x29($sp)
    addiu       $a0, $sp, 0x68
    addiu       $a1, $sp, 0x50
    addiu       $s1, $sp, 0x40
    addu        $a2, $s1, $zero
    addiu       $a3, $zero, 0xA0
    jal         func_8003DDF8
    sw          $zero, 0x10($sp)
    lw          $a1, 0x44($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5AD0
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    lw          $a1, 0x48($sp)
    beqz        $a1, .L800956FC
    nop
    jal         func_8002E65C
    addiu       $a0, $s0, 0x28
.L800956FC:
    lw          $a1, 0x4C($sp)
    beqz        $a1, .L80095710
    nop
    jal         func_8002E65C
    addiu       $a0, $s0, 0x50
.L80095710:
    jal         func_8003E23C
    addu        $a0, $s1, $zero
    lui         $a0, 0x8009
    lbu         $a0, -0x7518($a0)
    jal         func_800167FC
    addiu       $a1, $s0, -0x78
    lui         $v0, 0x8009
    lh          $v0, -0x7512($v0)
    bltz        $v0, .L8009575C
    addu        $v1, $v0, $zero
    lui         $a0, 0x8009
    lhu         $a0, -0x7510($a0)
    addiu       $a1, $s0, -0x28
    subu        $a0, $a0, $v1
    sll         $a0, $a0, 16
    jal         func_800AAEF0
    sra         $a0, $a0, 16
    j           func_8009105C
    addu        $s0, $zero, $zero
.L8009575C:
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x5B4
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5AA8
    lwl         $v0, 0x0($a1)
    lwr         $v0, 0x3($a1)
    swl         $v0, 0x0($a0)
    swr         $v0, 0x3($a0)
    addu        $s0, $zero, $zero
    addiu       $v1, $sp, 0x18
.L80095784:
    sw          $zero, 0x88($v1)
    sw          $zero, 0x78($v1)
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0x3
    bnez        $v0, .L80095784
    addiu       $v1, $v1, 0x4
    jal         func_80029944
    addu        $s0, $zero, $zero
    andi        $v0, $v0, 0xFF
    blez        $v0, .L8009586C
    andi        $a0, $s0, 0xFF
    addiu       $s4, $zero, 0x2
    addiu       $s3, $zero, 0x1
    addiu       $s2, $zero, 0x9
    addu        $s1, $v0, $zero
.L800957C0:
    jal         func_80029954
    addiu       $a1, $sp, 0xB0
    lbu         $v0, 0xB0($sp)
    andi        $v1, $v0, 0xF
    beq         $v1, $s4, .L80095820
    slti        $v0, $v1, 0x3
    beqz        $v0, .L800957F0
    nop
    beq         $v1, $s3, .L80095800
    nop
    j           func_8009113C
    addiu       $s0, $s0, 0x1
.L800957F0:
    beq         $v1, $s2, .L80095840
    nop
    j           func_8009113C
    addiu       $s0, $s0, 0x1
.L80095800:
    lw          $v0, 0x90($sp)
    lb          $a0, 0xB1($sp)
    lw          $v1, 0xA0($sp)
    addiu       $v0, $v0, 0x1
    addu        $v1, $v1, $a0
    sw          $v0, 0x90($sp)
    j           func_80091138
    sw          $v1, 0xA0($sp)
.L80095820:
    lw          $v0, 0x94($sp)
    lb          $a0, 0xB1($sp)
    lw          $v1, 0xA4($sp)
    addiu       $v0, $v0, 0x1
    addu        $v1, $v1, $a0
    sw          $v0, 0x94($sp)
    j           func_80091138
    sw          $v1, 0xA4($sp)
.L80095840:
    lw          $v0, 0x98($sp)
    lb          $a0, 0xB1($sp)
    lw          $v1, 0xA8($sp)
    addiu       $v0, $v0, 0x1
    addu        $v1, $v1, $a0
    sw          $v0, 0x98($sp)
    sw          $v1, 0xA8($sp)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $s1
    bnez        $v0, .L800957C0
    andi        $a0, $s0, 0xFF
.L8009586C:
    lw          $a1, 0x90($sp)
    beqz        $a1, .L800958BC
    addiu       $s0, $zero, 0x6
    addiu       $v0, $zero, 0x1
    beql        $a1, $v0, .L800958A0
    addiu       $a1, $zero, 0x1
    lw          $a2, 0xA0($sp)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5B48
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24EC
    j           func_80091190
    nop
.L800958A0:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5B48
    lw          $a2, 0xA0($sp)
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24E0
    jal         func_80090C00
    addiu       $s0, $s0, 0x1
.L800958BC:
    lw          $a1, 0x94($sp)
    beqz        $a1, .L80095920
    addiu       $v0, $zero, 0x1
    beq         $a1, $v0, .L800958F4
    sll         $a0, $s0, 2
    addu        $a0, $a0, $s0
    sll         $a0, $a0, 3
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5A58
    lw          $a2, 0xA4($sp)
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24D4
    j           func_800911F4
    addu        $a0, $a0, $v0
.L800958F4:
    addu        $a0, $a0, $s0
    sll         $a0, $a0, 3
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5A58
    addu        $a0, $a0, $v0
    lw          $a2, 0xA4($sp)
    addiu       $a1, $zero, 0x1
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24C4
    jal         func_80090C00
    addiu       $s0, $s0, 0x1
.L80095920:
    lw          $a1, 0x98($sp)
    beqz        $a1, .L80095984
    addiu       $v0, $zero, 0x1
    beq         $a1, $v0, .L80095958
    sll         $a0, $s0, 2
    addu        $a0, $a0, $s0
    sll         $a0, $a0, 3
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5A58
    lw          $a2, 0xA8($sp)
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24A8
    j           func_80091258
    addu        $a0, $a0, $v0
.L80095958:
    addu        $a0, $a0, $s0
    sll         $a0, $a0, 3
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5A58
    addu        $a0, $a0, $v0
    lw          $a2, 0xA8($sp)
    addiu       $a1, $zero, 0x1
    lui         $a3, 0x8007
    addiu       $a3, $a3, -0x24B8
    jal         func_80090C00
    nop
.L80095984:
    lw          $v0, 0x90($sp)
    lw          $v1, 0x94($sp)
    lw          $a0, 0x98($sp)
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    beqz        $v0, .L800959D0
    nop
    lw          $a0, 0xA0($sp)
    lw          $v0, 0xA4($sp)
    lw          $v1, 0xA8($sp)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5A80
    addu        $a0, $a0, $v0
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 16
    jal         func_800167FC
    sra         $a0, $a0, 16
    j           func_800912C0
    addiu       $a0, $zero, 0x28
.L800959D0:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A80
    jal         func_8002E65C
    addiu       $a1, $sp, 0x38
    addiu       $a0, $zero, 0x28
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4674
    addiu       $a2, $zero, 0x7
    addiu       $v0, $zero, 0xA
    jal         func_800AACE8
    sw          $v0, 0x0($a1)
    lui         $a0, 0x8009
    addiu       $a0, $a0, 0x153C
    addiu       $a1, $zero, 0xA
    lui         $at, 0x8008
    sh          $v0, 0x6BE4($at)
    jal         func_8002FEA4
    addiu       $a2, $zero, 0x1
    jal         func_80028144
    sw          $zero, 0x8($v0)
    jal         func_800C12E4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L80095A44
    nop
    jal         func_800BC98C
    nop
.L80095A44:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80095B08
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x51B8
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DB8($at)
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x5134
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DB4($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x510C
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DB8($at)
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x5088
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DB4($at)
    j           func_80091484
    nop
.L80095B08:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $a0, 0x800C
    addiu       $a0, $a0, 0x336C
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x2F58
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, 0x2DB8($at)
    addiu       $a0, $a0, -0x18C
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a1, 0x2DB4($at)
    addiu       $a1, $a1, -0x78
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, 0x2DB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a1, 0x2DB4($at)
    jal         func_80038150
    addu        $a0, $zero, $zero
    jal         func_80038150
    addiu       $a0, $zero, 0x1
    jal         func_800BE784
    addu        $s0, $zero, $zero
    jal         func_800BCFAC
    nop
    jal         func_800E1EF8
    addu        $a0, $zero, $zero
    jal         func_800E1EF8
    addiu       $a0, $zero, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    blez        $v0, .L80095C2C
    nop
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5040
    addiu       $s2, $v0, 0x58
    addu        $s1, $v0, $zero
.L80095BFC:
    lw          $a0, 0x0($s1)
    jal         func_800BFF60
    addiu       $s1, $s1, 0x4
    lw          $a0, 0x0($s2)
    jal         func_800BFF60
    addiu       $s0, $s0, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    slt         $v0, $s0, $v0
    bnez        $v0, .L80095BFC
    addiu       $s2, $s2, 0x4
.L80095C2C:
    jal         func_800A365C
    addu        $a0, $zero, $zero
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0xE4($sp)
    lw          $s4, 0xE0($sp)
    lw          $s3, 0xDC($sp)
    lw          $s2, 0xD8($sp)
    lw          $s1, 0xD4($sp)
    lw          $s0, 0xD0($sp)
    addiu       $sp, $sp, 0xE8
    jr          $ra
    nop
.end func_800956B0

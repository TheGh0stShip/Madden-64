.text
.align 2
.set noreorder
.globl func_800945D4
.ent func_800945D4
func_800945D4:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5958
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3DB8
    jal         func_8002E65C
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D6C
    jal         func_8002E65C
    addu        $s0, $zero, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L800946B8
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x5A0($at)
    jr          $v0
    nop
    lui         $v1, 0x8008
    lbu         $v1, 0x2E3F($v1)
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00004010  # mfhi        $t0
    srl         $v0, $t0, 4
    andi        $v0, $v0, 0xFF
    j           func_8008FF94
    addiu       $s0, $v0, 0x44
    j           func_8008FF94
    addiu       $s0, $zero, 0x44
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D5C
    jal         func_8002E65C
    addiu       $s0, $zero, 0x3C
    j           func_8008FF94
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D54
    jal         func_8002E65C
    addiu       $s0, $zero, 0x16
    lui         $v1, 0x8008
    lbu         $v1, 0x2E42($v1)
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00004010  # mfhi        $t0
    srl         $v0, $t0, 4
    andi        $v0, $v0, 0xFF
    subu        $s0, $s0, $v0
.L800946B8:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x15
    lui         $a0, 0x8008
    lh          $a0, 0x7A92($a0)
    ori         $v1, $zero, 0xFFF6
    addu        $v0, $v0, $v1
    addu        $s1, $s0, $v0
    jal         func_8003E498
    addu        $s0, $s1, $zero
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L800946E8
    addiu       $s0, $s1, -0xA
.L800946E8:
    lui         $a0, 0x8008
    lh          $a0, 0x7A92($a0)
    xori        $v1, $a0, 0x16
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x1C
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    bnel        $v1, $zero, .L80094718
    addiu       $s0, $s0, 0xA
    addiu       $v0, $zero, 0xE
    beql        $a0, $v0, .L80094718
    addiu       $s0, $s0, 0xA
.L80094718:
    lui         $v1, 0x8008
    lh          $v1, 0x7A92($v1)
    addiu       $v0, $zero, 0x1E
    bne         $v1, $v0, .L80094748
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x48
    beqz        $v0, .L80094748
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x10
    addiu       $s0, $v0, 0x48
.L80094748:
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x8
    lui         $at, 0x8006
    sh          $v0, 0x4A48($at)
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800947A8
    sll         $v0, $s0, 16
    addiu       $s0, $zero, 0x44
    lui         $at, 0x8008
    sh          $zero, 0x7A68($at)
    sll         $v0, $s0, 16
.L800947A8:
    sra         $s0, $v0, 16
    addu        $a0, $s0, $zero
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x58D8
    jal         func_800167FC
    addu        $a1, $s1, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3DC4
    jal         func_8002E688
    addu        $a0, $s1, $zero
    xori        $v1, $s0, 0x1
    sltiu       $v1, $v1, 0x1
    nor         $v0, $zero, $s0
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80094800
    nop
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $zero, -0x58D9($at)
.L80094800:
    lui         $v0, 0x8008
    lh          $v0, 0x7A68($v0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x4
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80094880
    slti        $v0, $s0, 0x4E
    bnez        $v0, .L80094840
    slti        $v0, $s0, 0x44
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D70
    j           func_80090154
    nop
.L80094840:
    bnez        $v0, .L80094860
    slti        $v0, $s0, 0x29
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D6C
    j           func_80090154
    nop
.L80094860:
    bnez        $v0, .L80094880
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D64
    jal         func_8002E65C
    nop
.L80094880:
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4E($v0)
    lui         $s0, 0xAF28
    ori         $s0, $s0, 0x6BCB
    .word       0x00500019  # multu       $v0, $s0
    addiu       $s1, $sp, 0x50
    addu        $a1, $s1, $zero
    .word       0x00002010  # mfhi        $a0
    subu        $v0, $v0, $a0
    srl         $v0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 12
    jal         func_800167FC
    sra         $a0, $a0, 16
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4E($v0)
    .word       0x00500019  # multu       $v0, $s0
    .word       0x00008010  # mfhi        $s0
    subu        $v0, $v0, $s0
    srl         $v0, $v0, 1
    addu        $s0, $s0, $v0
    srl         $s0, $s0, 4
    andi        $s0, $s0, 0xFFFF
    beqz        $s0, .L80094940
    nop
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4C($v0)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x58F8
    addiu       $v0, $v0, 0xFF
    andi        $v0, $v0, 0xFFF
    bltzl       $v0, .L80094904
    addiu       $v0, $v0, 0x1FF
.L80094904:
    sra         $v0, $v0, 9
    sll         $v0, $v0, 2
    addu        $v0, $sp, $v0
    lw          $a1, 0x30($v0)
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    jal         func_8002E688
    addu        $a1, $s1, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D98
    jal         func_8002E688
    addu        $a0, $s0, $zero
    j           func_80090234
    nop
.L80094940:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x58F8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D44
    jal         func_8002E65C
    nop
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    lui         $v0, 0xAF28
    ori         $v0, $v0, 0x6BCB
    .word       0x00620019  # multu       $v1, $v0
    .word       0x00001010  # mfhi        $v0
    subu        $v1, $v1, $v0
    srl         $v1, $v1, 1
    addu        $v0, $v0, $v1
    srl         $v0, $v0, 4
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x14
    beqz        $v0, .L800949A0
    addiu       $v0, $zero, 0x2
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    bne         $v1, $v0, .L800949B8
    nop
.L800949A0:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6CD8
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x3D4C
    jal         func_8002E65C
    nop
.L800949B8:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x4F14($v1)
    lui         $a3, 0x8008
    lw          $a3, 0x2DC8($a3)
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8008
    sw          $v0, 0x7780($at)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x4A54
    lui         $at, 0x8008
    sw          $v0, 0x7784($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x5958
    lui         $at, 0x8008
    sw          $v0, 0x7788($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x58D8
    lui         $at, 0x8008
    sw          $v0, 0x778C($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x58F8
    lui         $at, 0x8008
    sw          $v0, 0x7790($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6CD8
    lui         $at, 0x8008
    sw          $v0, 0x7794($at)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sw          $v0, 0x6E30($at)
    lui         $at, 0x8008
    sw          $v1, 0x6E34($at)
    lui         $at, 0x8008
    sw          $a3, 0x6E38($at)
    jal         func_8000D740
    addiu       $a2, $sp, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x7990($at)
    lui         $at, 0x8008
    sh          $zero, 0x7A90($at)
    jal         func_8003DDA4
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x3523($at)
    andi        $v0, $v0, 0x20
    bnez        $v0, .L80094A90
    addiu       $v0, $zero, 0x37
    addiu       $v0, $zero, 0x36
.L80094A90:
    lui         $at, 0x8008
    sh          $v0, -0x7D14($at)
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    lui         $a1, 0x8008
    lh          $a1, -0x7D14($a1)
    jal         func_80035EF0
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6CE8
    addu        $a0, $s0, $zero
    jal         func_800A64A0
    addu        $a1, $v0, $zero
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x4
    jal         func_800A2F10
    addu        $a3, $zero, $zero
    jal         func_8000BEE8
    addiu       $a0, $zero, 0x2
    j           func_80090404
    nop
.end func_800945D4

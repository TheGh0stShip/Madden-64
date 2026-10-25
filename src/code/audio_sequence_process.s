.text
.align 2
.set noreorder
.globl audio_sequence_process
.ent audio_sequence_process
audio_sequence_process:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $a0, 0x8007
    lh          $a0, -0x4844($a0)
    addiu       $sp, $sp, -0x28
    addiu       $v1, $zero, -0x1C1
    sw          $ra, 0x20($sp)
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L80038980
    addu        $a1, $a0, $zero
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    sh          $a1, 0x2DC0($at)
    j .L800389CC
    nop
.L80038980:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $v1, 0x2DBC($at)
    lbu         $v1, 0x0($v1)
    andi        $v1, $v1, 0x1F
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DC0($at)
.L800389CC:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L80038A80
    lui         $v1, 0x1000
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L80038A3C
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $a0, 0x8007
    lhu         $a0, -0x4842($a0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $a0, 0x2DC0($at)
    j .L80038ACC
    nop
.L80038A3C:
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x2DC0($at)
    j .L80038ACC
    nop
.L80038A80:
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
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
    lw          $v1, 0x2DBC($at)
    lbu         $v1, 0x0($v1)
    andi        $v1, $v1, 0x1F
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DC0($at)
.L80038ACC:
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    andi        $v0, $v0, 0x2000
    bnez        $v0, .L80038B70
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x2DC0($v1)
    lui         $a1, 0x8008
    lw          $a1, 0x7894($a1)
    lui         $a0, 0x8009
    lw          $a0, -0x7F6C($a0)
    lui         $at, 0x8009
    sb          $zero, -0x49E8($at)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $a1, $v0
    lui         $at, 0x8008
    sw          $v0, 0x2DB8($at)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    lui         $v1, 0x8008
    lh          $v1, 0x4F0C($v1)
    sll         $v0, $v0, 3
    addu        $v0, $a0, $v0
    lui         $at, 0x8008
    sw          $v0, 0x2DB4($at)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a1, $a1, $v0
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $a0, $a0, $v0
    lui         $at, 0x8008
    sw          $a1, 0x4F04($at)
    lui         $at, 0x8008
    sw          $a0, 0x4F00($at)
    j .L80038DF0
    nop
.L80038B70:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a0, 0x2DC1($at)
    jal         func_800393E0
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80038CD4
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a0, 0x2DC0($at)
    lui         $a2, 0x8008
    lw          $a2, 0x7894($a2)
    lui         $a1, 0x8009
    lw          $a1, -0x7F6C($a1)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a0, 0x2DC0($at)
    sll         $v0, $v0, 2
    addu        $v0, $a2, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x2DB8($at)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v0, $v0, 3
    addu        $v0, $a1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x2DB4($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $a0, 0x2DC0($at)
    lui         $at, 0x8009
    sb          $zero, -0x49E8($at)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $a0, 0x2DC0($at)
    sll         $v1, $v1, 2
    addu        $a2, $a2, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a2, 0x2DB8($at)
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 3
    addu        $a1, $a1, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a1, 0x2DB4($at)
    j .L80038DF0
    nop
.L80038CD4:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a0, 0x2DC0($at)
    lui         $a2, 0x8009
    lw          $a2, -0x7F6C($a2)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    lui         $a0, 0x8008
    lw          $a0, 0x5A30($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a1, 0x2DC0($at)
    sll         $v0, $v0, 2
    addu        $a0, $a0, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x2DB8($at)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v0, $v0, 3
    addu        $v0, $a2, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x2DB4($at)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a0, 0x2DC0($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x49E8($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    lui         $a0, 0x8008
    lw          $a0, 0x7894($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $a1, 0x2DC0($at)
    sll         $v0, $v0, 2
    addu        $a0, $a0, $v0
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $a2, $a2, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x2DB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a2, 0x2DB4($at)
.L80038DF0:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $v1, 0x2DBC($at)
    lui         $at, 0x8008
    sh          $zero, 0x5024($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x57B4($at)
    lbu         $a1, 0x0($v1)
    addiu       $v0, $zero, 0x20
    andi        $a0, $a1, 0x60
    bne         $a0, $v0, .L80038F28
    addiu       $v0, $zero, -0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addu        $a1, $zero, $zero
    ori         $v0, $v0, 0x40
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L80038E68:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $v0, 0x2DBC($at)
    andi        $a0, $a1, 0xFFFF
    addu        $v0, $v0, $a0
    lbu         $v0, 0x1($v0)
    srl         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x7FE4($at)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $v0, 0x2DBC($at)
    addu        $v0, $v0, $a0
    lbu         $v0, 0x1($v0)
    addiu       $a1, $a1, 0x1
    andi        $v0, $v0, 0xF
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x79A4($at)
    andi        $v0, $a1, 0xFFFF
    sltiu       $v0, $v0, 0x5
    beqz        $v0, .L80038FF8
    nop
    j .L80038E68
    nop
.L80038F28:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L80039000
    addiu       $v0, $zero, 0x60
    beq         $a0, $v0, .L80039000
    andi        $v0, $a1, 0x1F
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v1, -0x49CC($at)
    addu        $a1, $zero, $zero
    lhu         $t0, 0x0($v1)
    addu        $a2, $zero, $zero
    andi        $a0, $t0, 0xFFFF
    beqz        $a0, .L80038FA8
    addiu       $v1, $v1, 0x2
    lui         $a3, 0x8009
    lw          $a3, -0x6A24($a3)
    addiu       $t1, $zero, 0x20
.L80038F74:
    lhu         $v0, 0x0($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    lw          $a2, 0x4($v0)
    lbu         $v0, 0x0($a2)
    andi        $v0, $v0, 0x60
    beq         $v0, $t1, .L80038FAC
    andi        $v0, $a1, 0xFFFF
    addiu       $a1, $a1, 0x1
    andi        $v0, $a1, 0xFFFF
    sltu        $v0, $v0, $a0
    bnez        $v0, .L80038F74
    addiu       $v1, $v1, 0x2
.L80038FA8:
    andi        $v0, $a1, 0xFFFF
.L80038FAC:
    beq         $v0, $t0, .L80039000
    addu        $a1, $zero, $zero
    andi        $v1, $a1, 0xFFFF
.L80038FB8:
    addu        $a0, $a2, $v1
    lbu         $v0, 0x1($a0)
    srl         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, 0x7FE4($at)
    lbu         $v0, 0x1($a0)
    addiu       $a1, $a1, 0x1
    andi        $v0, $v0, 0xF
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, 0x79A4($at)
    andi        $v0, $a1, 0xFFFF
    sltiu       $v0, $v0, 0x5
    bnez        $v0, .L80038FB8
    andi        $v1, $a1, 0xFFFF
.L80038FF8:
    lui         $at, 0x8008
    sh          $a1, 0x5024($at)
.L80039000:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $a0, 0x2DBC($at)
    lbu         $v0, 0x0($a0)
    addiu       $v1, $zero, 0x40
    andi        $v0, $v0, 0x60
    bne         $v0, $v1, .L8003907C
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    andi        $v0, $v0, 0x2000
    bnez        $v0, .L8003906C
    addiu       $v0, $zero, 0x9
    lbu         $v0, 0x1($a0)
    j .L80039074
    nop
.L8003906C:
    lbu         $v1, 0x1($a0)
    subu        $v0, $v0, $v1
.L80039074:
    lui         $at, 0x8008
    sb          $v0, 0x76D0($at)
.L8003907C:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a0, 0x2DC1($at)
    jal         func_800393E0
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L8003927C
    nop
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L8003927C
    nop
    jal         func_800DEC38
    nop
    addu        $v1, $v0, $zero
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L8003911C
    slti        $v0, $v1, 0x4
    beql        $v0, $zero, .L8003910C
    addiu       $v0, $zero, 0x4
    bltz        $v1, .L8003927C
    nop
    j .L80039218
    nop
.L8003910C:
    beq         $v1, $v0, .L8003917C
    nop
    j .L8003927C
    nop
.L8003911C:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lh          $v1, 0x2DC0($at)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v1, 0x2E08($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4E70
    beq         $v1, $v0, .L80039218
    nop
.L8003917C:
    lui         $v1, 0x8008
    lh          $v1, 0x5024($v1)
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L8003927C
    nop
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x79A7
    lbu         $t0, 0x0($a2)
    lui         $a3, 0x8008
    lbu         $a3, 0x79A8($a3)
    lui         $a1, 0x8008
    lbu         $a1, 0x7FE8($a1)
    lui         $v1, 0x8008
    lbu         $v1, 0x79A6($v1)
    lui         $v0, 0x8008
    lbu         $v0, 0x7FE6($v0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x7FE7
    lui         $at, 0x8008
    sb          $t0, 0x79A8($at)
    lbu         $t0, 0x0($a0)
    lui         $at, 0x8008
    sb          $t0, 0x7FE8($at)
    lui         $t0, 0x8008
    lbu         $t0, 0x79A4($t0)
    lui         $at, 0x8008
    sb          $t0, 0x79A6($at)
    lui         $t0, 0x8008
    lbu         $t0, 0x7FE4($t0)
    sb          $a3, 0x0($a2)
    sb          $a1, 0x0($a0)
    lui         $at, 0x8008
    sb          $v1, 0x79A4($at)
    lui         $at, 0x8008
    sb          $v0, 0x7FE4($at)
    lui         $at, 0x8008
    sb          $t0, 0x7FE6($at)
    j .L8003927C
    nop
.L80039218:
    lui         $v1, 0x8008
    lh          $v1, 0x5024($v1)
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L8003927C
    nop
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x79A7
    lbu         $a3, 0x0($a1)
    lui         $a2, 0x8008
    lbu         $a2, 0x79A8($a2)
    lui         $a0, 0x8008
    lbu         $a0, 0x7FE8($a0)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7FE7
    lui         $at, 0x8008
    sb          $a3, 0x79A8($at)
    lbu         $a3, 0x0($v0)
    lui         $at, 0x8008
    sb          $a3, 0x7FE8($at)
    lbu         $a3, -0x3($v0)
    lbu         $v1, -0x1($v0)
    sb          $a2, 0x0($a1)
    sb          $a0, 0x0($v0)
    sb          $v1, -0x3($v0)
    sb          $a3, -0x1($v0)
.L8003927C:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lw          $v0, 0x2DBC($at)
    lbu         $v0, 0x0($v0)
    addiu       $v1, $zero, 0x60
    andi        $v0, $v0, 0x60
    bne         $v0, $v1, .L80039318
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L8003932C
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    ori         $a0, $v0, 0x100
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $a0, 0xC10($at)
    bne         $v1, $v0, .L80039318
    andi        $v0, $a0, 0x2
    beqz        $v0, .L80039310
    nop
    jal         func_800BE1B0
    nop
.L80039310:
    jal         func_800A365C
    addiu       $a0, $zero, 0x3
.L80039318:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L8003936C
    nop
.L8003932C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    ori         $a0, $v0, 0x100
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $a0, 0xC10($at)
    bne         $v1, $v0, .L8003936C
    andi        $v0, $a0, 0x4
    beqz        $v0, .L80039364
    nop
    jal         func_800BE1B0
    nop
.L80039364:
    jal         func_800A365C
    addiu       $a0, $zero, 0x3
.L8003936C:
    lui         $v1, 0x8007
    lhu         $v1, -0x4856($v1)
    addiu       $v0, $v1, -0x13
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80039390
    addiu       $v0, $v1, -0x18
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800393D0
    nop
.L80039390:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    ori         $a0, $v0, 0x100
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sw          $a0, 0xC10($at)
    bne         $v1, $v0, .L800393D0
    andi        $v0, $a0, 0x2
    beqz        $v0, .L800393C8
    nop
    jal         func_800BE1B0
    nop
.L800393C8:
    jal         func_800A365C
    addiu       $a0, $zero, 0x3
.L800393D0:
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_sequence_process

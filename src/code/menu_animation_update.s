.text
.align 2
.set noreorder
.globl menu_animation_update
.ent menu_animation_update
menu_animation_update:
    lui         $v0, 0x8008
    lh          $v0, 0x7768($v0)
    addiu       $sp, $sp, -0x18
    bnez        $v0, .L8002061C
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    blez        $v0, .L800203C4
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x58C0($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v1, -0x612B($at)
    sltiu       $v0, $v1, 0x7
    beqz        $v0, .L800203DC
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xD00($at)
    jr          $v0
    nop
    lui         $v1, 0x8008
    lhu         $v1, 0x777C($v1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    lui         $at, 0x8008
    sw          $zero, 0x776C($at)
    ori         $v1, $v1, 0x8
    lui         $at, 0x8008
    sh          $v1, 0x777C($at)
    j .L800203DC
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x777C($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x4F34($a0)
    addiu       $v1, $zero, 0x1
    lui         $at, 0x8008
    sh          $v1, 0x777E($at)
    lui         $at, 0x8008
    sw          $zero, 0x776C($at)
    ori         $v0, $v0, 0x8
    lui         $at, 0x8008
    sh          $v0, 0x777C($at)
    lui         $at, 0x8008
    sw          $a0, 0x7770($at)
    j .L800203DC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x6CE0($v0)
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    j .L800203DC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x6CE0($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    lui         $at, 0x8008
    sw          $v1, 0x7770($at)
    j .L800203DC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x777C
    lhu         $v1, 0x0($a0)
    andi        $v0, $v1, 0x8
    bnez        $v0, .L800203DC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x6CE0($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x5
    bnez        $v0, .L800203DC
    ori         $v0, $v1, 0x4
    sh          $v0, 0x0($a0)
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    j .L800203DC
    nop
    lui         $a0, 0x31F
    lui         $v1, 0x8008
    lhu         $v1, 0x777C($v1)
    lui         $a1, 0x8009
    lw          $a1, -0x58B8($a1)
    ori         $a0, $a0, 0xFFFF
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
    lui         $at, 0x8008
    sw          $zero, 0x776C($at)
    ori         $v1, $v1, 0x8
    slt         $a0, $a0, $a1
    lui         $at, 0x8008
    sh          $v1, 0x777C($at)
    lui         $at, 0x8008
    sw          $a1, 0x7770($at)
    bnez        $a0, .L80020398
    lui         $v0, 0x310
    lui         $v0, 0xFCE0
    slt         $v0, $v0, $a1
    bnez        $v0, .L800203A0
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
.L80020398:
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
.L800203A0:
    lui         $v0, 0x8008
    lhu         $v0, 0x777C($v0)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800203DC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7770($v0)
    j .L800203D4
    negu        $v0, $v0
.L800203C4:
    bnez        $v0, .L800203DC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
.L800203D4:
    lui         $at, 0x8008
    sw          $v0, 0x7770($at)
.L800203DC:
    lui         $v1, 0x8009
    lhu         $v1, -0x58C0($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $v1, -0x612C($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x777C($v0)
    sll         $a3, $v1, 20
    lui         $v1, 0x8009
    lw          $v1, -0x58BC($v1)
    lui         $a0, 0x8009
    lh          $a0, -0x58B0($a0)
    srl         $v0, $v0, 1
    lbu         $v1, 0x1E($v1)
    andi        $v0, $v0, 0x1
    beq         $a0, $v1, .L80020440
    addu        $a1, $v0, $zero
    xori        $v0, $v0, 0x1
    beqz        $v0, .L80020494
    nop
    j .L80020448
    nop
.L80020440:
    beqz        $a1, .L80020494
    nop
.L80020448:
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0x7770
    lw          $a1, 0x0($t0)
    lui         $v0, 0x31F
    subu        $v0, $v0, $a1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v1, $v0, 1
    slt         $v0, $a3, $v1
    bnez        $v0, .L800204E0
    addu        $a2, $a1, $a3
    addiu       $a0, $zero, 0x31F
    addu        $v0, $a1, $v1
    sra         $a1, $v0, 16
    jal         func_800278D8
    sw          $v0, 0x0($t0)
    sll         $v0, $v0, 16
    j .L80020504
    sra         $v0, $v0, 16
.L80020494:
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0x7770
    lw          $a0, 0x0($t0)
    lui         $v0, 0x31F
    addu        $v0, $a0, $v0
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v1, $v0, 1
    slt         $v0, $a3, $v1
    bnez        $v0, .L800204E0
    subu        $a2, $a0, $a3
    subu        $v0, $a0, $v1
    sra         $a0, $v0, 16
    addiu       $a1, $zero, -0x31F
    jal         func_800278D8
    sw          $v0, 0x0($t0)
    sll         $v0, $v0, 16
    j .L80020504
    sra         $v0, $v0, 16
.L800204E0:
    lui         $v0, 0x8009
    lhu         $v0, -0x58C0($v0)
    sw          $a2, 0x0($t0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v0, -0x612C($at)
.L80020504:
    lui         $at, 0x8009
    sw          $v0, -0x4FA4($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x58C0($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v0, -0x612C($at)
    bnez        $v0, .L8002055C
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x7770($a0)
    lui         $a1, 0x8008
    lh          $a1, 0x4F34($a1)
    jal         func_800278D8
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8009
    sw          $v0, -0x4FA4($at)
.L8002055C:
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x777C
    lhu         $a0, 0x0($a1)
    andi        $v0, $a0, 0x2
    bnez        $v0, .L800205AC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7770($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x793C($v1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800205A4
    andi        $v0, $a0, 0xFFFB
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L800205F0
    andi        $v0, $a0, 0xFFFB
.L800205A4:
    j .L800205E0
    ori         $v0, $v0, 0x8
.L800205AC:
    lui         $v1, 0x8008
    lw          $v1, 0x7770($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x793C($v0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800205D8
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    bne         $v1, $v0, .L800205F0
    nop
.L800205D8:
    ori         $v0, $a0, 0x8
    andi        $v0, $v0, 0xFFFB
.L800205E0:
    sh          $v0, 0x0($a1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x777E($at)
.L800205F0:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L8002061C
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x777C($v0)
    lui         $at, 0x8008
    sh          $zero, 0x777E($at)
    andi        $v0, $v0, 0xFFF7
    lui         $at, 0x8008
    sh          $v0, 0x777C($at)
.L8002061C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end menu_animation_update

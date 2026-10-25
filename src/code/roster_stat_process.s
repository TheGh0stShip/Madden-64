.text
.align 2
.set noreorder
.globl roster_stat_process
.ent roster_stat_process
roster_stat_process:
    lui         $v0, 0x8007
    lhu         $v0, -0x4628($v0)
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    bnez        $v0, .L800244AC
    sw          $s1, 0x14($sp)
    andi        $v0, $s0, 0xFFFF
    addiu       $v1, $v0, -0x17
    sltiu       $v0, $v1, 0xB
    beql        $v0, $zero, .L80024460
    andi        $v1, $s2, 0xFFFF
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1030($at)
    jr          $v0
    nop
    andi        $s0, $s2, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_800241A0
    addiu       $a1, $zero, 0xA
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    jal         func_800241A0
    addu        $s0, $v0, $zero
    j .L800244A0
    subu        $s1, $s0, $v0
    andi        $v1, $s2, 0xFFFF
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
    lhu         $s1, 0x2D94($at)
    j .L800244A4
    sll         $v0, $s1, 16
    xori        $v1, $s2, 0x1
    andi        $v1, $v1, 0xFFFF
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
    lhu         $s1, 0x2D22($at)
    j .L800244A4
    sll         $v0, $s1, 16
    xori        $v1, $s2, 0x1
    andi        $v1, $v1, 0xFFFF
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
    lhu         $s1, 0x2D24($at)
    j .L800244A4
    sll         $v0, $s1, 16
    xori        $v1, $s2, 0x1
    andi        $v1, $v1, 0xFFFF
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
    lhu         $s1, 0x2D26($at)
    j .L800244A4
    sll         $v0, $s1, 16
    xori        $v1, $s2, 0x1
    andi        $v1, $v1, 0xFFFF
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
    lhu         $s1, 0x2D28($at)
    j .L800244A4
    sll         $v0, $s1, 16
    andi        $s0, $s2, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_800241A0
    addiu       $a1, $zero, 0x1C
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1D
    jal         func_800241A0
    addu        $s0, $v0, $zero
    j .L800244A0
    addu        $s1, $s0, $v0
    addu        $s1, $zero, $zero
    addu        $s0, $zero, $zero
    ori         $s3, $zero, 0x8000
    andi        $a0, $s2, 0xFFFF
.L80024394:
    andi        $a1, $s0, 0xFFFF
    jal         func_80023C60
    addiu       $a2, $zero, 0x9
    addu        $v1, $v0, $zero
    andi        $v0, $v1, 0xFFFF
    bnel        $v0, $s3, .L800243B0
    addu        $s1, $s1, $v1
.L800243B0:
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80024394
    andi        $a0, $s2, 0xFFFF
    j .L800244A4
    sll         $v0, $s1, 16
    addu        $s1, $zero, $zero
    addu        $s0, $zero, $zero
    ori         $s3, $zero, 0x8000
    andi        $a0, $s2, 0xFFFF
.L800243DC:
    andi        $a1, $s0, 0xFFFF
    jal         func_80023C60
    addiu       $a2, $zero, 0x3
    addu        $v1, $v0, $zero
    andi        $v0, $v1, 0xFFFF
    bnel        $v0, $s3, .L800243F8
    addu        $s1, $s1, $v1
.L800243F8:
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800243DC
    andi        $a0, $s2, 0xFFFF
    j .L800244A4
    sll         $v0, $s1, 16
    addu        $s1, $zero, $zero
    addu        $s0, $zero, $zero
    ori         $s3, $zero, 0x8000
    andi        $a0, $s2, 0xFFFF
.L80024424:
    andi        $a1, $s0, 0xFFFF
    jal         func_80023C60
    addiu       $a2, $zero, 0x27
    addu        $v1, $v0, $zero
    andi        $v0, $v1, 0xFFFF
    bnel        $v0, $s3, .L80024440
    addu        $s1, $s1, $v1
.L80024440:
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80024424
    andi        $a0, $s2, 0xFFFF
    j .L800244A4
    sll         $v0, $s1, 16
    andi        $v1, $s2, 0xFFFF
.L80024460:
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    andi        $v1, $s0, 0xFFFF
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x2D22
    sll         $v1, $v1, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    lhu         $s1, 0x0($v1)
.L800244A0:
    sll         $v0, $s1, 16
.L800244A4:
    j .L800244E4
    sra         $v0, $v0, 16
.L800244AC:
    jal         func_80028A58
    andi        $a0, $s2, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 5
    subu        $v1, $v1, $v0
    lui         $a0, 0x8007
    lw          $a0, -0x4624($a0)
    sll         $v1, $v1, 1
    addiu       $v1, $v1, 0x5358
    andi        $v0, $s0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $a0, $a0, $v1
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
.L800244E4:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end roster_stat_process

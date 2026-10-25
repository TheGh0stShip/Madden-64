.text
.align 2
.set noreorder
.globl scheduler_queue_update
.ent scheduler_queue_update
scheduler_queue_update:
    addiu       $sp, $sp, -0x58
    sw          $s0, 0x30($sp)
    addu        $s0, $a1, $zero
    sw          $s2, 0x38($sp)
    addu        $s2, $a2, $zero
    sw          $s1, 0x34($sp)
    addu        $s1, $a3, $zero
    sw          $fp, 0x50($sp)
    addu        $fp, $a0, $zero
    sw          $ra, 0x54($sp)
    sw          $s7, 0x4C($sp)
    sw          $s6, 0x48($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    jal         func_800448C4
    sw          $s3, 0x3C($sp)
    lui         $at, 0x8009
    sw          $s0, -0x5C20($at)
    jal         func_8004295C
    addu        $s3, $zero, $zero
    addiu       $a0, $sp, 0x18
    addiu       $v0, $zero, 0x6
    sh          $fp, 0x18($sp)
    sw          $zero, 0x28($sp)
    jal         func_8000E558
    sh          $v0, 0x1A($sp)
    andi        $s7, $fp, 0xFFFF
    addu        $s4, $s1, $zero
    addu        $s1, $zero, $zero
    addu        $s6, $zero, $zero
    lui         $s5, 0x8007
    addiu       $s5, $s5, 0x48FC
    lui         $at, 0x8008
    sw          $v0, -0x5650($at)
    lui         $at, 0x8008
    sh          $fp, -0x565C($at)
    addu        $s0, $zero, $zero
.L8004496C:
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    lhu         $a1, 0x0($s5)
    andi        $a2, $s3, 0xFFFF
    andi        $a3, $s0, 0xFFFF
    jal         func_800447C4
    addiu       $s0, $s0, 0x1
    sltiu       $v0, $s0, 0x4
    bnez        $v0, .L8004496C
    nop
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    lui         $at, 0x8007
    addu        $at, $at, $s6
    lhu         $a1, 0x4904($at)
    andi        $s0, $s3, 0xFFFF
    addu        $a2, $s0, $zero
    addiu       $s6, $s6, 0x2
    jal         func_80044694
    addiu       $s5, $s5, 0x2
    jal         func_8004445C
    addu        $a0, $s0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, -0x56F8($at)
    lhu         $a2, 0x0($s2)
    lbu         $a3, 0x1($s4)
    andi        $s0, $s3, 0xFF
    addiu       $s3, $s3, 0x1
    addu        $a1, $s7, $zero
    sw          $s0, 0x10($sp)
    jal         func_80044530
    sw          $zero, 0x14($sp)
    addu        $a1, $s7, $zero
    lbu         $a3, 0x1($s4)
    addiu       $s4, $s4, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, -0x56F4($at)
    lhu         $a2, 0x0($s2)
    addiu       $s2, $s2, 0x2
    addiu       $s1, $s1, 0x2C
    addiu       $v0, $zero, 0x1
    sw          $s0, 0x10($sp)
    jal         func_80044530
    sw          $v0, 0x14($sp)
    sltiu       $v0, $s3, 0x4
    bnel        $v0, $zero, .L8004496C
    addu        $s0, $zero, $zero
    andi        $a0, $fp, 0xFFFF
    jal         func_800420B0
    addiu       $a1, $zero, 0x1C
    jal         func_8004291C
    nop
    addu        $a0, $zero, $zero
    jal         func_80032E00
    ori         $a1, $zero, 0xC480
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x5AA8($at)
    addiu       $v0, $v0, 0x6240
    lui         $at, 0x8008
    sw          $v0, -0x5AA4($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x3120
    lui         $at, 0x8008
    sw          $v0, -0x5668($at)
    addiu       $v0, $v0, 0x1890
    lui         $at, 0x8008
    sw          $v0, -0x5664($at)
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end scheduler_queue_update

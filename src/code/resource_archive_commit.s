.text
.align 2
.set noreorder
.globl resource_archive_commit
.ent resource_archive_commit
resource_archive_commit:
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x8($a0)
    lw          $v0, 0x40($s2)
    bnez        $v0, .L80017FDC
    addu        $s3, $a1, $zero
    lhu         $v1, 0x1E($s2)
    addiu       $v0, $zero, 0x800
    sll         $v1, $v1, 16
    sra         $a0, $v1, 16
    .word       0x0044001A  # div         $zero, $v0, $a0
    bnez        $a0, .L80017F18
    nop
    break       7
.L80017F18:
    addiu       $at, $zero, -0x1
    bne         $a0, $at, .L80017F30
    lui         $at, 0x8000
    bne         $v0, $at, .L80017F30
    nop
    break       6
.L80017F30:
    .word       0x00002012  # mflo        $a0
    lw          $v0, 0x30($s2)
    sra         $v1, $v1, 19
    sll         $v1, $v1, 1
    ori         $v0, $v0, 0x8000
    sw          $v0, 0x30($s2)
    lui         $at, 0x8006
    addu        $at, $at, $v1
    lhu         $v1, 0x4AB0($at)
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80017F60
    addu        $a0, $v1, $zero
.L80017F60:
    lh          $v0, 0x1C($s2)
    .word       0x0044001A  # div         $zero, $v0, $a0
    bnez        $a0, .L80017F74
    nop
    break       7
.L80017F74:
    addiu       $at, $zero, -0x1
    bne         $a0, $at, .L80017F8C
    lui         $at, 0x8000
    bne         $v0, $at, .L80017F8C
    nop
    break       6
.L80017F8C:
    .word       0x00001012  # mflo        $v0
    .word       0x00001810  # mfhi        $v1
    addu        $a0, $zero, $zero
    addiu       $s1, $v0, 0x1
    sltu        $v1, $zero, $v1
    addu        $s1, $s1, $v1
    sll         $s1, $s1, 1
    sll         $s0, $s1, 5
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    sw          $v0, 0x40($s2)
    lw          $a1, 0x40($s2)
    sll         $v1, $s1, 4
    addu        $v0, $v0, $v1
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $v0, 0x44($s2)
    sh          $s1, 0x10($s2)
.L80017FDC:
    lhu         $s1, 0x10($s2)
    lw          $v1, 0x40($s2)
    addu        $v0, $s1, $zero
    beqz        $v0, .L80018028
    addiu       $s1, $s1, -0x1
    addiu       $a0, $zero, 0xFF
    addiu       $v1, $v1, 0x1C
.L80017FF8:
    sb          $s3, -0xD($v1)
    sb          $s3, 0x3($v1)
    sb          $a0, -0xE($v1)
    sb          $a0, -0xF($v1)
    sb          $a0, -0x10($v1)
    sb          $a0, 0x2($v1)
    sb          $a0, 0x1($v1)
    sb          $a0, 0x0($v1)
    addiu       $v1, $v1, 0x20
    addu        $v0, $s1, $zero
    bnez        $v0, .L80017FF8
    addiu       $s1, $s1, -0x1
.L80018028:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end resource_archive_commit

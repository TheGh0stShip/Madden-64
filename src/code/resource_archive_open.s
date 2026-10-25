.text
.align 2
.set noreorder
.globl resource_archive_open
.ent resource_archive_open
resource_archive_open:
    addiu       $sp, $sp, -0x48
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $a1, $zero
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x14
    sw          $ra, 0x44($sp)
    sw          $fp, 0x40($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s1, 0x24($sp)
    sh          $zero, 0x38($s0)
    sw          $zero, 0x20($s0)
    sw          $zero, 0x24($s0)
    lw          $s1, 0x5C($sp)
    addu        $s6, $a2, $zero
    lhu         $s5, 0x5A($sp)
    jal         func_80032E00
    addu        $s7, $a3, $zero
    addiu       $fp, $zero, 0x100
    sw          $v0, 0x28($s0)
    andi        $v0, $s1, 0x2000
    beqz        $v0, .L800178F8
    addu        $s4, $s1, $zero
    j .L80017988
    sw          $s2, 0x20($s0)
.L800178F8:
    andi        $v0, $s1, 0x200
    beqz        $v0, .L80017974
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    jal         func_80035598
    addu        $a1, $s2, $zero
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $v0, 0x800
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    addu        $a1, $s2, $zero
    jal         func_80035598
    sw          $v0, 0x20($s0)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $v0, 0x800
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    lw          $a2, 0x20($s0)
    addu        $a1, $s2, $zero
    jal         func_80036268
    sw          $v0, 0x24($s0)
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    lw          $a2, 0x24($s0)
    jal         func_80036268
    addiu       $a1, $s2, 0x1
    j .L80017988
    nop
.L80017974:
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    jal         func_80035D7C
    addu        $a1, $s2, $zero
    sw          $v0, 0x20($s0)
.L80017988:
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    jal         func_80035598
    addu        $a1, $s2, $zero
    lw          $a0, 0x20($s0)
    lw          $a2, 0x28($s0)
    jal         func_8001A724
    addu        $a1, $v0, $zero
    andi        $v0, $s4, 0x200
    bnez        $v0, .L800179C4
    sh          $zero, 0x3E($s0)
    lw          $v0, 0x28($s0)
    lw          $v1, 0xC($v0)
    j .L800179D0
    addiu       $v0, $s2, 0x1
.L800179C4:
    lw          $v0, 0x28($s0)
    lw          $v1, 0xC($v0)
    addiu       $v0, $s2, 0x2
.L800179D0:
    sw          $v0, 0x18($v1)
    lw          $v0, 0x28($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0xC($v0)
    sll         $a3, $s7, 16
    sra         $a3, $a3, 16
    lhu         $s2, 0xC($v0)
    lhu         $s3, 0xE($v0)
    sll         $v0, $s5, 16
    sra         $v0, $v0, 16
    addu        $a1, $s2, $zero
    addu        $a2, $s3, $zero
    sh          $s2, 0x1E($s0)
    sw          $v0, 0x10($sp)
    sll         $v0, $s6, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x8
    jal         func_80017840
    sw          $v0, 0x18($sp)
    andi        $v0, $s4, 0x80
    beqz        $v0, .L80017A38
    sll         $v0, $s2, 16
    lw          $t3, 0x64($sp)
    j .L80017A58
    sw          $t3, 0x4($s0)
.L80017A38:
    sra         $v0, $v0, 16
    sll         $a1, $s3, 16
    sra         $a1, $a1, 16
    .word       0x00450018  # mult        $v0, $a1
    .word       0x00002812  # mflo        $a1
    jal         func_80032E00
    addu        $a0, $zero, $zero
    sw          $v0, 0x4($s0)
.L80017A58:
    andi        $v0, $s4, 0x8
    beqz        $v0, .L80017A74
    addu        $a0, $zero, $zero
    lw          $t3, 0x60($sp)
    lw          $v0, 0x8($t3)
    j .L80017A88
    sw          $v0, 0x8($s0)
.L80017A74:
    sll         $a1, $fp, 16
    sra         $a1, $a1, 16
    jal         func_80032E00
    sll         $a1, $a1, 1
    sw          $v0, 0x8($s0)
.L80017A88:
    lw          $v1, 0x28($s0)
    lbu         $s1, 0x0($v1)
    andi        $v0, $s1, 0x2
    beqz        $v0, .L80017AC0
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    sll         $a2, $s3, 16
    sra         $a2, $a2, 16
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00003012  # mflo        $a2
    lw          $a0, 0x4($s0)
    lw          $a1, 0x4($v1)
    jal         func_8002E17C
    nop
.L80017AC0:
    andi        $v0, $s1, 0x4
    beqz        $v0, .L80017B4C
    nop
    lw          $v0, 0x28($s0)
    lw          $t2, 0x8($s0)
    lw          $a3, 0x8($v0)
    sll         $v0, $fp, 16
    sra         $v0, $v0, 16
    beqz        $v0, .L80017B4C
    addu        $t0, $zero, $zero
    addu        $t1, $v0, $zero
.L80017AEC:
    lbu         $v0, 0x0($a3)
    addiu       $a3, $a3, 0x1
    lbu         $a1, 0x0($a3)
    addiu       $a3, $a3, 0x1
    lbu         $a2, 0x0($a3)
    addiu       $a3, $a3, 0x1
    andi        $v1, $t0, 0xFFFF
    addiu       $t0, $t0, 0x1
    sltu        $a0, $zero, $v1
    sll         $v1, $v1, 1
    addu        $v1, $v1, $t2
    srl         $v0, $v0, 3
    srl         $a1, $a1, 3
    srl         $a2, $a2, 3
    sll         $v0, $v0, 11
    sll         $a1, $a1, 6
    or          $v0, $v0, $a1
    sll         $a2, $a2, 1
    or          $v0, $v0, $a2
    or          $a0, $a0, $v0
    andi        $v0, $t0, 0xFFFF
    slt         $v0, $v0, $t1
    bnez        $v0, .L80017AEC
    sh          $a0, 0x0($v1)
.L80017B4C:
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end resource_archive_open

.text
.align 2
.set noreorder
.globl interface_runtime_update
.ent interface_runtime_update
interface_runtime_update:
    addu        $s5, $a1, $zero
    sw          $ra, 0xCC($sp)
    sw          $fp, 0xC8($sp)
    sw          $s7, 0xC4($sp)
    sw          $s6, 0xC0($sp)
    sw          $s4, 0xB8($sp)
    sw          $s3, 0xB4($sp)
    sw          $s2, 0xB0($sp)
    sw          $s1, 0xAC($sp)
    sw          $s0, 0xA8($sp)
    lw          $s7, 0x8($a0)
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x1
    sb          $v0, 0x18($s7)
    lhu         $s2, 0x0($s5)
    lhu         $s1, 0x2($s5)
    lhu         $v0, 0xA($s5)
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    sh          $zero, 0x16($s7)
    jal         func_8000D5BC
    sh          $v0, 0x14($s7)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    addu        $s4, $v0, $zero
    jal         func_8000D5BC
    sw          $v0, 0x4($s7)
    sw          $v0, 0x8($s7)
    lhu         $s0, 0x8($s5)
    andi        $s1, $s1, 0xFFFF
    addu        $a0, $s1, $zero
    sw          $v0, 0xA4($sp)
    jal         func_80035598
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $v0, $zero
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    addu        $s6, $v0, $zero
    addu        $a2, $s6, $zero
    jal         func_80036268
    sw          $s6, 0x0($s7)
    lh          $v1, 0x4($s6)
    lh          $v0, 0x6($s6)
    addu        $a0, $zero, $zero
    addu        $s3, $v1, $v0
    addu        $s0, $s3, $zero
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $s3, $v0, 4
    jal         func_80032E00
    addu        $a1, $s3, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s3, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0xC($s7)
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s0
    sll         $s0, $v0, 2
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $fp, $v0, $zero
    addu        $a1, $fp, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $fp, 0x10($s7)
    jal         func_80016FD4
    addu        $s3, $zero, $zero
    addu        $a0, $s1, $zero
    jal         func_80016FC4
    sh          $v0, 0x9E($sp)
    addiu       $v0, $zero, 0x18A
    sw          $v0, 0x34($sp)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x2C($sp)
    sh          $s2, 0x10($sp)
    sh          $zero, 0x14($sp)
    sw          $zero, 0x20($sp)
    lw          $v0, 0x4($s5)
    lhu         $v0, 0x0($v0)
    beqz        $v0, .L8004078C
    sh          $v0, 0x12($sp)
    addu        $s2, $fp, $zero
    addu        $s1, $zero, $zero
.L80040644:
    lw          $v0, 0x10($s5)
    beqz        $v0, .L80040700
    addu        $v0, $s1, $v0
    lhu         $v0, 0x0($v0)
    beqz        $v0, .L800406E0
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x800
    sw          $v0, 0x1C($sp)
    sw          $v0, 0x98($s2)
    sw          $v0, 0x4C($sp)
    lw          $v0, 0x10($s5)
    addu        $a0, $s4, $zero
    addu        $v0, $s1, $v0
    lhu         $v0, 0x0($v0)
    addiu       $a1, $zero, 0x8
    addiu       $a2, $sp, 0x10
    jal         func_8000D740
    sw          $v0, 0x28($sp)
    lw          $v1, 0x10($s5)
    addu        $s0, $v0, $zero
    lw          $a1, 0x8($s0)
    lw          $a0, 0xA4($sp)
    addu        $v1, $s1, $v1
    lbu         $v1, 0x2($v1)
    addiu       $v0, $sp, 0x50
    sw          $v0, 0x40($sp)
    sh          $v1, 0x2E($sp)
    lw          $v0, 0xC($a1)
    addiu       $a2, $sp, 0x28
    addu        $a1, $zero, $zero
    jal         func_8000D740
    sw          $v0, 0x58($sp)
    addu        $a0, $v0, $zero
    addiu       $a1, $zero, 0x1
    jal         func_80017CDC
    sw          $a0, 0x94($s2)
    j .L80040714
    nop
.L800406E0:
    addu        $a0, $s4, $zero
    addiu       $a1, $zero, 0x8
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    addu        $s0, $v0, $zero
    sw          $zero, 0x98($s2)
    j .L80040714
    sw          $zero, 0x94($s2)
.L80040700:
    addu        $a0, $s4, $zero
    addiu       $a1, $zero, 0x8
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    addu        $s0, $v0, $zero
.L80040714:
    lw          $v0, 0x18($s5)
    lw          $a1, 0x8($s0)
    beqz        $v0, .L80040740
    addu        $v0, $s1, $v0
    lw          $v0, 0x0($v0)
    sw          $v0, 0xF8($a1)
    lw          $v0, 0x18($s5)
    addu        $v0, $s1, $v0
    lw          $a0, 0x0($v0)
    j .L80040748
    nop
.L80040740:
    sw          $zero, 0xF8($a1)
    addu        $a0, $zero, $zero
.L80040748:
    jal         func_8000DE34
    addiu       $s3, $s3, 0x1
    jal         func_8000EC58
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    jal         func_8000F330
    addiu       $a1, $zero, 0x4
    lhu         $v0, 0x1C($s5)
    sh          $v0, 0xA2($s2)
    lw          $v1, 0x4($s5)
    sll         $v0, $s3, 1
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    addiu       $s1, $s1, 0x4
    addiu       $s2, $s2, 0xA4
    bnez        $v0, .L80040644
    sh          $v0, 0x12($sp)
.L8004078C:
    lhu         $a0, 0x9E($sp)
    jal         func_80016FC4
    nop
    lh          $v0, 0x4($s6)
    lh          $v1, 0x6($s6)
    addu        $s3, $v0, $v1
    addu        $v0, $s3, $zero
    beqz        $v0, .L80040804
    addiu       $s3, $s3, -0x1
    sll         $v0, $s3, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addiu       $a1, $v0, 0x8
.L800407C8:
    addiu       $s0, $zero, 0xB
    addu        $v0, $s6, $a1
    addiu       $v1, $v0, 0x50
.L800407D4:
    lw          $v0, 0x0($v1)
    beqz        $v0, .L800407E8
    addu        $a0, $s0, $zero
    addu        $v0, $v0, $s6
    sw          $v0, 0x0($v1)
.L800407E8:
    addiu       $v1, $v1, -0x4
    bnez        $a0, .L800407D4
    addiu       $s0, $s0, -0x1
    addiu       $a1, $a1, -0x54
    addu        $v0, $s3, $zero
    bnez        $v0, .L800407C8
    addiu       $s3, $s3, -0x1
.L80040804:
    lh          $v0, 0x4($s6)
    lh          $v1, 0x6($s6)
    addu        $s3, $v0, $v1
    addu        $v0, $s3, $zero
    beqz        $v0, .L8004087C
    addiu       $s3, $s3, -0x1
    sll         $v0, $s3, 2
    addu        $v0, $v0, $s3
    sll         $v1, $v0, 3
    addu        $v1, $v1, $s3
    sll         $s4, $v1, 2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addiu       $s2, $v0, 0x8
.L80040840:
    addu        $s0, $fp, $s4
    addu        $a0, $s0, $zero
    addu        $s1, $s6, $s2
    addu        $a1, $s1, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x24
    addiu       $a0, $s0, 0x6C
    addu        $a1, $s1, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x24
    addiu       $s4, $s4, -0xA4
    addiu       $s2, $s2, -0x54
    addu        $v0, $s3, $zero
    bnez        $v0, .L80040840
    addiu       $s3, $s3, -0x1
.L8004087C:
    lw          $a0, 0xC($s5)
    lw          $a1, 0x10($s7)
    jal         func_800408C8
    nop
    lui         $at, 0x8009
    sw          $zero, -0x58AC($at)
    lw          $ra, 0xCC($sp)
    lw          $fp, 0xC8($sp)
    lw          $s7, 0xC4($sp)
    lw          $s6, 0xC0($sp)
    lw          $s5, 0xBC($sp)
    lw          $s4, 0xB8($sp)
    lw          $s3, 0xB4($sp)
    lw          $s2, 0xB0($sp)
    lw          $s1, 0xAC($sp)
    lw          $s0, 0xA8($sp)
    addiu       $sp, $sp, 0xD0
    jr          $ra
    nop
.end interface_runtime_update

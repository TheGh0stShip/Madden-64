.text
.align 2
.set noreorder
.globl func_800B3A58
.ent func_800B3A58
func_800B3A58:
    addiu       $a1, $a1, 0x1530
    lwl         $v0, 0x0($a1)
    lwr         $v0, 0x3($a1)
    swl         $v0, 0x18($sp)
    swr         $v0, 0x1B($sp)
    jal         func_800B0690
    addu        $s2, $zero, $zero
    jal         func_800B0870
    addiu       $s0, $zero, 0xCE
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x418($v1)
.L800B3A8C:
    lui         $a0, 0x8007
    lw          $a0, -0x158C($a0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4060
    jal         func_8002E65C
    addu        $a0, $a0, $s0
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    sll         $a0, $s2, 2
    addiu       $s2, $s2, 0x1
    addu        $v1, $v0, $s0
    addu        $v0, $v0, $a0
    sw          $v1, 0x41C($v0)
    sltiu       $v0, $s2, 0xC
    bnez        $v0, .L800B3A8C
    addiu       $s0, $s0, 0x46
    addu        $s2, $zero, $zero
    addiu       $t1, $sp, 0x54
    lui         $t2, 0x8008
    addiu       $t2, $t2, 0xD6A
    addiu       $v0, $zero, 0xA
    sw          $v0, 0x20($sp)
    addiu       $v0, $zero, 0x4
    sw          $t1, 0xB4($sp)
    sw          $zero, 0xBC($sp)
    sw          $t2, 0xC4($sp)
    sw          $zero, 0xCC($sp)
    sw          $zero, 0xD4($sp)
    sw          $v0, 0x50($sp)
.L800B3B00:
    lw          $t2, 0xD4($sp)
    addu        $s3, $zero, $zero
    sll         $t1, $s2, 3
    sw          $t1, 0x94($sp)
    sll         $t1, $s2, 1
    lw          $s7, 0xC4($sp)
    xori        $s5, $s2, 0x1
    addiu       $v0, $s2, 0x1
    sw          $t2, 0x9C($sp)
    lw          $t2, 0xCC($sp)
    andi        $s4, $v0, 0x1
    addu        $fp, $zero, $zero
    sw          $t1, 0xA4($sp)
    sw          $t2, 0xAC($sp)
.L800B3B38:
    lui         $a3, 0x8007
    lw          $a3, -0x158C($a3)
    lw          $t1, 0x94($sp)
    sll         $v1, $s3, 2
    lw          $t2, 0x9C($sp)
    addu        $v0, $t1, $a3
    addu        $v0, $v0, $v1
    lw          $a0, 0xB4($v0)
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0xC91
    addu        $v0, $t2, $t1
    lw          $t2, 0xA4($sp)
    lw          $t1, 0xAC($sp)
    addu        $s0, $zero, $zero
    sw          $v0, 0x24($sp)
    addu        $a1, $t2, $a3
    addu        $v0, $a1, $s3
    lbu         $v0, 0xC4($v0)
    addu        $a1, $a1, $s3
    lui         $t2, 0x8008
    addiu       $t2, $t2, 0xD6A
    addu        $t0, $a3, $t1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    addu        $v0, $a3, $v0
    lbu         $v1, 0xA($v0)
    lbu         $a2, 0xB($v0)
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0xC91
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $s7, $v0
    sw          $v0, 0x28($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v0, $s7, $v0
    sw          $v0, 0x2C($sp)
    lbu         $a1, 0xC8($a1)
    sll         $v0, $s5, 3
    addu        $v0, $v0, $s5
    sll         $v0, $v0, 3
    sll         $v1, $s5, 5
    addu        $v1, $v1, $s5
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s5
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s5
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s5
    sll         $a1, $a1, 2
    addu        $a1, $a1, $v0
    addu        $a1, $a3, $a1
    lbu         $a2, 0xB($a1)
    lbu         $a1, 0xA($a1)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t2
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $v0, $v1, $v0
    sw          $v0, 0x38($sp)
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    sw          $v1, 0x3C($sp)
    lbu         $a1, 0x4E($t0)
    sll         $v1, $s4, 5
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s4
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t1
    sw          $v0, 0x34($sp)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $v0, $s7, $v0
    sw          $v0, 0x30($sp)
    sll         $v0, $s4, 3
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 3
    addu        $a3, $a3, $v0
    lbu         $a2, 0x4E($a3)
    lw          $s1, 0xB4($sp)
    addu        $v1, $v1, $t2
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v0, $v1, $v0
    sw          $v0, 0x40($sp)
    lbu         $a2, 0x4A($t0)
    lw          $t2, 0xBC($sp)
    addiu       $a1, $sp, 0x20
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v0, $s7, $v0
    sw          $v0, 0x44($sp)
    lbu         $a2, 0x4A($a3)
    addu        $s6, $t2, $fp
    addiu       $a3, $zero, 0xAA
    sll         $v0, $a2, 2
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    addiu       $a2, $sp, 0x50
    sw          $v1, 0x48($sp)
    jal         func_8003DDF8
    sw          $zero, 0x10($sp)
.L800B3D08:
    lw          $a1, 0x0($s1)
    beqz        $a1, .L800B3D50
    addu        $v0, $s6, $s0
    addiu       $s1, $s1, 0x4
    addiu       $s0, $s0, 0x1
    sll         $a0, $v0, 3
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    subu        $a0, $a0, $v0
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    sll         $a0, $a0, 1
    addiu       $a0, $a0, 0xCE
    jal         func_8002E65C
    addu        $a0, $v0, $a0
    sltiu       $v0, $s0, 0x3
    bnez        $v0, .L800B3D08
    nop
.L800B3D50:
    jal         func_8003E23C
    addiu       $a0, $sp, 0x50
    addiu       $s3, $s3, 0x1
    sltiu       $v0, $s3, 0x2
    bnez        $v0, .L800B3B38
    addiu       $fp, $fp, 0x3
    lw          $t1, 0xBC($sp)
    lw          $t2, 0xC4($sp)
    addiu       $t1, $t1, 0x6
    sw          $t1, 0xBC($sp)
    lw          $t1, 0xCC($sp)
    addiu       $s2, $s2, 0x1
    addiu       $t2, $t2, 0x214C
    sw          $t2, 0xC4($sp)
    lw          $t2, 0xD4($sp)
    sltiu       $v0, $s2, 0x2
    addiu       $t1, $t1, 0x48
    addiu       $t2, $t2, 0x214C
    sw          $t1, 0xCC($sp)
    bnez        $v0, .L800B3B00
    sw          $t2, 0xD4($sp)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $s2, $zero, $zero
    addu        $v1, $v0, $zero
    addiu       $v0, $zero, 0xF
    sw          $v0, 0x44C($v1)
.L800B3DBC:
    sw          $zero, 0x450($v1)
    addiu       $s2, $s2, 0x1
    sltiu       $v0, $s2, 0xF
    bnez        $v0, .L800B3DBC
    addiu       $v1, $v1, 0x4
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x404
    jal         func_800356C4
    addiu       $a1, $zero, 0x720
    jal         func_80016FD4
    addu        $s0, $v0, $zero
    andi        $s0, $s0, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80016FC4
    addu        $s1, $v0, $zero
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x68
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x6C($sp)
    addiu       $v0, $zero, 0x10
    sw          $v0, 0x74($sp)
    addiu       $v0, $zero, 0x81
    sh          $zero, 0x6E($sp)
    sh          $zero, 0x70($sp)
    sw          $zero, 0x78($sp)
    jal         func_8000D8DC
    sw          $v0, 0x68($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, 0x7760($at)
    jal         func_80016FE4
    addu        $s2, $zero, $zero
    jal         func_80035A7C
    addu        $a0, $s0, $zero
    jal         func_80016FC4
    andi        $a0, $s1, 0xFFFF
    addu        $s7, $zero, $zero
    addu        $s4, $zero, $zero
    lui         $s6, 0x8009
    addiu       $s6, $s6, -0x5058
    addiu       $s5, $sp, 0x18
    addu        $s3, $zero, $zero
    addu        $s0, $s6, $zero
    addu        $s1, $s5, $zero
    lbu         $v0, 0x0($s1)
    lui         $v1, 0x8007
    lw          $v1, -0x158C($v1)
.end func_800B3A58

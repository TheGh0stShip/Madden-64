.text
.align 2
.set noreorder
.globl func_80094340
.ent func_80094340
func_80094340:
    lui         $v0, 0x8008
    lh          $v0, 0x76DC($v0)
    addiu       $sp, $sp, -0x70
    sw          $ra, 0x6C($sp)
    sw          $s4, 0x68($sp)
    sw          $s3, 0x64($sp)
    sw          $s2, 0x60($sp)
    sw          $s1, 0x5C($sp)
    sw          $s0, 0x58($sp)
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x55C
    lw          $v1, 0x0($a2)
    lw          $a0, 0x4($a2)
    lw          $a1, 0x8($a2)
    sw          $v1, 0x30($sp)
    sw          $a0, 0x34($sp)
    sw          $a1, 0x38($sp)
    lw          $v1, 0xC($a2)
    lw          $a0, 0x10($a2)
    lw          $a1, 0x14($a2)
    sw          $v1, 0x3C($sp)
    sw          $a0, 0x40($sp)
    sw          $a1, 0x44($sp)
    lw          $v1, 0x18($a2)
    lw          $a0, 0x1C($a2)
    sw          $v1, 0x48($sp)
    sw          $a0, 0x4C($sp)
    addiu       $s0, $zero, 0x5
    bnel        $v0, $s0, .L800943CC
    addiu       $a0, $zero, 0x500
    jal         func_800B1F30
    nop
    jal         func_800AA33C
    nop
    addiu       $a0, $zero, 0x500
.L800943CC:
    addiu       $a1, $zero, 0x2
    jal         func_80034D30
    addu        $a2, $zero, $zero
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x7920($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sb          $v0, 0x6DDC($at)
    lui         $at, 0x8008
    sb          $v0, 0x6DDD($at)
    lui         $v0, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x751C($at)
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    beq         $v1, $s0, . + 4 + (0x1AF << 2)
    addiu       $s1, $zero, 0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6E30
    jal         func_8001AEA8
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    lui         $at, 0x8009
    sw          $v0, -0x6D3C($at)
    addiu       $v0, $zero, 0xF8
    sh          $v0, 0x18($sp)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7780
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x3
    sw          $zero, 0x20($sp)
    bne         $v1, $s1, . + 4 + (0x39 << 2)
    sh          $v0, 0x28($sp)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x57C
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    addu        $s1, $v0, $zero
    lbu         $v0, 0x4($s1)
    addiu       $v0, $v0, -0x11
    sll         $v0, $v0, 24
    sra         $v1, $v0, 24
    sltiu       $v0, $v1, 0x5
    beqz        $v0, . + 4 + (0x24 << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x588($at)
    jr          $v0
    nop
.end func_80094340

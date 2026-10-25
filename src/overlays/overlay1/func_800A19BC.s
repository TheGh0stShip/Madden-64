.text
.align 2
.set noreorder
.globl func_800A19BC
.ent func_800A19BC
func_800A19BC:
    addiu       $sp, $sp, -0x78
    sw          $s4, 0x60($sp)
    addiu       $s4, $zero, 0x1
    sw          $s6, 0x68($sp)
    addu        $s6, $zero, $zero
    sw          $s5, 0x64($sp)
    addu        $s5, $zero, $zero
    sw          $fp, 0x70($sp)
    sw          $ra, 0x74($sp)
    sw          $s7, 0x6C($sp)
    sw          $s3, 0x5C($sp)
    sw          $s2, 0x58($sp)
    sw          $s1, 0x54($sp)
    sw          $s0, 0x50($sp)
    sh          $zero, 0x2E($sp)
    sh          $zero, 0x36($sp)
    sw          $zero, 0x3C($sp)
    lui         $at, 0x8008
    sh          $zero, 0x6BE8($at)
    jal         func_800C6000
    addu        $fp, $zero, $zero
    lhu         $t0, 0x2E($sp)
    lui         $s7, 0x8009
    lhu         $s7, -0x6CE0($s7)
    lui         $v1, 0x8008
    lw          $v1, 0x4F30($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x4F34($a0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x78E0
    addu        $s3, $v0, $zero
    andi        $v0, $s3, 0xFFFF
    sw          $zero, 0x44($sp)
    sh          $t0, 0x26($sp)
    sw          $v1, 0x0($a1)
    lui         $at, 0x8008
    sw          $a0, 0x78E4($at)
    beqz        $v0, . + 4 + (0x121 << 2)
    addu        $s1, $zero, $zero
    addu        $s2, $a1, $zero
    jal         func_800C6010
    andi        $a0, $s1, 0xFFFF
    addu        $s0, $v0, $zero
    lbu         $v0, 0x0($s0)
    addiu       $v1, $v0, -0x3
    sltiu       $v0, $v1, 0x1F
    beqz        $v0, . + 4 + (0x112 << 2)
    sh          $s1, 0x26($sp)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xC20($at)
    jr          $v0
    nop
.end func_800A19BC

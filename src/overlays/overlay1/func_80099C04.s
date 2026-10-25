.text
.align 2
.set noreorder
.globl func_80099C04
.ent func_80099C04
func_80099C04:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($s2)
    lhu         $v0, 0x60($s0)
    lw          $t0, 0x20($s0)
    andi        $a3, $v0, 0x3FFF
    sll         $v0, $a3, 4
    addu        $v1, $v0, $t0
    lhu         $v0, 0x0($v1)
    sh          $v0, 0x24($s0)
    lhu         $v0, 0x2($v1)
    sh          $v0, 0x26($s0)
    lbu         $v0, 0x4($v1)
    sll         $v0, $v0, 1
    sh          $v0, 0x5A($s0)
    lbu         $v0, 0x5($v1)
    sh          $v0, 0x5E($s0)
    lbu         $v0, 0x6($v1)
    andi        $v0, $v0, 0x40
    beqz        $v0, .L80099C78
    addiu       $v0, $zero, 0x1
    lbu         $v1, 0x4($v1)
    sh          $v0, 0x58($s0)
    j           func_8009555C
    sll         $v1, $v1, 2
.L80099C78:
    lhu         $v1, 0x5A($s0)
    sh          $zero, 0x58($s0)
    sh          $v1, 0x5C($s0)
    sll         $v0, $a3, 4
    addu        $s1, $v0, $t0
    lbu         $v0, 0x6($s1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80099CC8
    nop
    lw          $v0, 0x70($s0)
    bnez        $v0, .L80099D34
    nop
    lw          $a0, 0x54($s0)
    lw          $a1, 0x8($s1)
    jal         func_80096AF8
    nop
    lw          $a2, 0x54($s0)
    addu        $a0, $s2, $zero
    j           func_80095608
    addu        $a1, $s1, $zero
.L80099CC8:
    lw          $v0, 0x70($s0)
    bnez        $v0, .L80099D34
    nop
    lhu         $v1, 0x5A($s0)
    lhu         $v0, 0x5E($s0)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00002012  # mflo        $a0
    lw          $a1, 0x8($s1)
    lw          $a2, 0x54($s0)
    addiu       $a0, $a0, 0x3
    srl         $a0, $a0, 2
    addu        $v0, $a0, $zero
    beqz        $v0, .L80099D1C
    addiu       $a0, $a0, -0x1
.L80099D00:
    lw          $v0, 0x0($a1)
    addiu       $a1, $a1, 0x4
    addu        $v1, $a0, $zero
    addiu       $a0, $a0, -0x1
    sw          $v0, 0x0($a2)
    bnez        $v1, .L80099D00
    addiu       $a2, $a2, 0x4
.L80099D1C:
    addu        $a0, $s2, $zero
    lw          $a2, 0x54($s0)
    sll         $a1, $a3, 4
    addu        $a1, $t0, $a1
    jal         func_8002F930
    nop
.L80099D34:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80099C04

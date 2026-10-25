.text
.align 2
.set noreorder
.globl func_800A6FDC
.ent func_800A6FDC
func_800A6FDC:
    jal         func_8002CAD0
    addu        $s2, $a2, $zero
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    lw          $v0, 0x24($s1)
    lw          $v0, 0x8($v0)
    lh          $a0, 0x12($v0)
    jal         func_8002D14C
    nop
    lw          $v0, 0x24($s1)
    lw          $v1, 0x8($v0)
    addiu       $v0, $zero, 0x7
    sh          $v0, 0x6C($sp)
    sw          $v1, 0x20($sp)
    lw          $v0, 0x24($s1)
    addiu       $a0, $sp, 0x18
    addiu       $a1, $zero, 0xE
    lw          $v0, 0x18($v0)
    addu        $a2, $s0, $zero
    addu        $a3, $s2, $zero
    sw          $v0, 0x30($sp)
    jal         func_80043F7C
    sw          $zero, 0x10($sp)
    andi        $v0, $v0, 0xFF
    beqz        $v0, .L800A7070
    nop
    lw          $v1, 0x24($s1)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x1C($v1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x4($s0)
    lw          $v1, 0x20($v1)
    addu        $v0, $v0, $v1
    j           func_800A299C
    sw          $v0, 0x4($s0)
.L800A7070:
    jal         func_800C157C
    addu        $a0, $s1, $zero
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    addu        $a1, $s0, $zero
    jal         func_800B9274
    lui         $a2, 0xA
    lw          $v1, 0x24($s1)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x1C($v1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x4($s0)
    lw          $v1, 0x20($v1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    sh          $zero, 0x4($s2)
    sh          $zero, 0x2($s2)
    sh          $zero, 0x0($s2)
    jal         func_8002CD28
    nop
    lw          $ra, 0x7C($sp)
    lw          $s2, 0x78($sp)
    lw          $s1, 0x74($sp)
    lw          $s0, 0x70($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end func_800A6FDC

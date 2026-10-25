.text
.align 2
.set noreorder
.globl func_800A7E28
.ent func_800A7E28
func_800A7E28:
    lui         $v1, 0x8008
    lw          $v1, 0x6C88($v1)
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    sw          $ra, 0x34($sp)
    sw          $fp, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    beqz        $v1, .L800A7E78
    sw          $s0, 0x10($sp)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800A7E78:
    addiu       $fp, $zero, 0x1
    addiu       $s3, $zero, 0x2
    addiu       $s2, $zero, 0xCFF
    lui         $s7, 0x8007
    addiu       $s7, $s7, -0x5900
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x58DC
    addu        $s6, $s0, $zero
.L800A7E98:
    lw          $v1, 0x0($s0)
    beqz        $v1, .L800A7EF8
    nop
    lhu         $v0, 0x84($v1)
    andi        $v0, $v0, 0xFBFF
    sh          $v0, 0x84($v1)
    lw          $v0, 0x0($s0)
    sh          $s4, 0xA($v0)
    lw          $v0, 0x0($s0)
    bne         $s1, $fp, .L800A7ED4
    sw          $s5, 0xC($v0)
    lw          $v0, 0x0($s0)
    sh          $zero, 0x2($v0)
    lw          $v0, 0x0($s0)
    sh          $zero, 0x6($v0)
.L800A7ED4:
    bne         $s1, $s3, .L800A7EF8
    nop
    lw          $v0, 0x0($s0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    sh          $s3, 0x2($v0)
    lw          $v0, 0x0($s0)
    sh          $s2, 0x6($v0)
.L800A7EF8:
    lw          $a0, 0x0($s0)
    lh          $v0, 0x2($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    jalr        $v0
    addiu       $s0, $s0, 0x4
    beq         $s0, $s6, .L800A7E98
    nop
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800A7E28

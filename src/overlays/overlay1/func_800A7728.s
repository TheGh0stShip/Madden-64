.text
.align 2
.set noreorder
.globl func_800A7728
.ent func_800A7728
func_800A7728:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x28($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x2C($sp)
    lhu         $v0, 0x84($s0)
    lw          $v1, 0x1C($s0)
    sh          $a1, 0x0($s0)
    sh          $a2, 0x2($s0)
    sh          $a3, 0x6($s0)
    andi        $v0, $v0, 0xFFCE
    sh          $v0, 0x84($s0)
    sw          $v1, 0x10($sp)
    lw          $v0, 0x20($s0)
    sw          $v0, 0x14($sp)
    lw          $v0, 0x24($s0)
    sw          $v0, 0x18($sp)
    lhu         $v0, 0x5C($s0)
    sh          $v0, 0x20($sp)
    lhu         $v0, 0x5E($s0)
    sh          $v0, 0x22($sp)
    lhu         $v0, 0x60($s0)
    sh          $v0, 0x24($sp)
    lw          $a0, 0x14($s0)
    sw          $zero, 0x3C($s0)
    sw          $zero, 0x40($s0)
    sw          $zero, 0x44($s0)
    sh          $zero, 0x6C($s0)
    sh          $zero, 0x6E($s0)
    beqz        $a0, .L800A77C8
    sh          $zero, 0x70($s0)
    lh          $v0, 0x2($s0)
    lhu         $v1, 0x4($a0)
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lhu         $a1, -0x5840($at)
    beq         $v1, $a1, .L800A77C8
    nop
    jal         func_8000B7A4
    nop
.L800A77C8:
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x5900($at)
    jalr        $v0
    addu        $a0, $s0, $zero
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x58C0($at)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x10($sp)
    lhu         $a0, 0x84($s0)
    sw          $v0, 0x1C($s0)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x20($s0)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x24($s0)
    lhu         $v0, 0x20($sp)
    sh          $v0, 0x5C($s0)
    lhu         $v0, 0x22($sp)
    addiu       $v1, $zero, 0x4
    sh          $v0, 0x5E($s0)
    lhu         $a1, 0x24($sp)
    ori         $a0, $a0, 0x29
    addiu       $v0, $zero, 0x6
    sh          $v1, 0x4C($s0)
    sh          $v1, 0x4E($s0)
    sh          $v1, 0x50($s0)
    sh          $v0, 0x54($s0)
    sh          $v0, 0x56($s0)
    sh          $v0, 0x58($s0)
    sh          $v1, 0x74($s0)
    sh          $v1, 0x76($s0)
    sh          $v1, 0x78($s0)
    sh          $v0, 0x7C($s0)
    sh          $v0, 0x7E($s0)
    sh          $v0, 0x80($s0)
    sh          $a0, 0x84($s0)
    sh          $a1, 0x60($s0)
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A7728

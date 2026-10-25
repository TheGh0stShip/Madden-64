.text
.align 2
.set noreorder
.globl func_800A3900
.ent func_800A3900
func_800A3900:
    addiu       $sp, $sp, -0x48
    sw          $s0, 0x28($sp)
    lui         $s0, 0x8008
    lw          $s0, 0x55F8($s0)
    lw          $v0, 0x58($sp)
    lw          $v1, 0x5C($sp)
    sw          $s5, 0x3C($sp)
    lw          $s5, 0x60($sp)
    sw          $s4, 0x38($sp)
    lw          $s4, 0x64($sp)
    sw          $ra, 0x40($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $a0, 0x48($sp)
    sw          $a1, 0x4C($sp)
    sw          $a2, 0x50($sp)
    beqz        $s0, .L800A3A4C
    sw          $a3, 0x54($sp)
    sll         $s2, $v0, 18
    sll         $s1, $v1, 18
    addiu       $s3, $zero, 0x3
.L800A3958:
    lw          $v0, 0x24($s0)
    lw          $a0, 0x1C($v0)
    lh          $v1, 0x48($sp)
    sra         $v0, $a0, 16
    subu        $a1, $v0, $v1
    bgez        $a1, .L800A397C
    addu        $v0, $a0, $s2
    negu        $a1, $a1
    subu        $v0, $a0, $s2
.L800A397C:
    sw          $v0, 0x10($sp)
    lw          $v0, 0x24($s0)
    lw          $a0, 0x20($v0)
    lh          $v1, 0x4C($sp)
    sra         $v0, $a0, 16
    subu        $v1, $v0, $v1
    bgez        $v1, .L800A39A4
    addu        $v0, $a0, $s1
    negu        $v1, $v1
    subu        $v0, $a0, $s1
.L800A39A4:
    sw          $v0, 0x14($sp)
    slt         $v0, $v1, $a1
    beqz        $v0, .L800A39C4
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    j           func_8009F2B0
    addu        $v0, $a1, $v0
.L800A39C4:
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 4
    subu        $v0, $v0, $s5
    bgez        $v0, .L800A3A40
    nop
    beq         $s0, $s4, .L800A3A40
    nop
    lbu         $v0, 0x64($s0)
    beq         $v0, $s3, .L800A3A40
    nop
    lh          $a0, 0x14($sp)
    lw          $v1, 0x10($sp)
    sb          $s3, 0x20($sp)
    srl         $v0, $a0, 8
    sra         $v1, $v1, 18
    sb          $v0, 0x21($sp)
    sb          $a0, 0x22($sp)
    sb          $v1, 0x23($sp)
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800A3A38
    addu        $a0, $s0, $zero
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x20
    j           func_8009F31C
    nop
.L800A3A38:
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x20
.L800A3A40:
    lw          $s0, 0x0($s0)
    bnez        $s0, .L800A3958
    nop
.L800A3A4C:
    lw          $ra, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800A3900

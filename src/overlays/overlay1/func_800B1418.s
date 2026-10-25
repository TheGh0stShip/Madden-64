.text
.align 2
.set noreorder
.globl func_800B1418
.ent func_800B1418
func_800B1418:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $v0, 0x4($s2)
    lw          $a0, 0x8($s2)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $s1, 0x2D86($at)
    jal         func_800AD460
    addu        $s0, $zero, $zero
    addu        $a0, $s1, $zero
    sll         $v0, $s0, 16
.L800B1480:
    sra         $v1, $v0, 14
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v0, 0x40A4($at)
    slt         $v0, $a0, $v0
    bnez        $v0, .L800B14B4
    addiu       $v0, $s0, 0x1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $v0, 0x40A5($at)
    slt         $v0, $v0, $a0
    beqz        $v0, .L800B14CC
    addiu       $v0, $s0, 0x1
.L800B14B4:
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x6
    bnez        $v0, .L800B1480
    sll         $v0, $s0, 16
.L800B14CC:
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x3
    bnez        $v0, .L800B14E4
    addiu       $a0, $zero, 0x4
    addiu       $a0, $zero, 0x3
.L800B14E4:
    jal         func_80041BDC
    addiu       $a1, $zero, 0x32
    sll         $v0, $s0, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s0, -0x1BC0($at)
    lui         $s3, 0x8007
    addiu       $s3, $s3, -0x4674
    addiu       $v0, $zero, 0x3
    sw          $v0, 0x0($s3)
    lw          $v1, 0x4($s2)
    lw          $a0, 0xC($s2)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xD6A
    addu        $v0, $v0, $v1
    sll         $v1, $a0, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 3
    addu        $v0, $v0, $v1
    addu        $v1, $s1, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    sll         $v0, $v1, 3
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $v0, 0x3E28($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $a0, 0x3DA0($at)
    slti        $v1, $v1, 0x1E
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x1D18
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    lui         $at, 0x8007
    sw          $a0, -0x466C($at)
    bnez        $v1, .L800B15B0
    nop
    jal         func_800A1D14
    nop
.L800B15B0:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    addu        $a0, $s0, $zero
    addu        $a1, $s3, $zero
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x46B8
    lui         $v1, 0x8009
    lh          $v1, -0x6A2E($v1)
    addu        $a2, $s1, $zero
    addiu       $a3, $zero, 0xB4
    addu        $s0, $v0, $zero
    jal         func_8003DDF8
    sw          $v1, 0x10($sp)
    addiu       $a0, $zero, 0x60
    lh          $a1, 0x6($s2)
    addu        $a2, $s1, $zero
    jal         func_800AEFF8
    addu        $a3, $s0, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B1418

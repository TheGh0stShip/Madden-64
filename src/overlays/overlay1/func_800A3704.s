.text
.align 2
.set noreorder
.globl func_800A3704
.ent func_800A3704
func_800A3704:
    addiu       $v1, $v1, 0x2
    lui         $s1, 0x8008
    lw          $s1, 0x55F8($s1)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5110
    sh          $zero, 0x0($v0)
    lw          $s2, 0x24($a0)
    beqz        $s1, .L800A38CC
    addiu       $s3, $v0, 0x2
.L800A3728:
    lw          $a0, 0x24($s1)
    lw          $v0, 0x1C($s2)
    lw          $v1, 0x1C($a0)
    subu        $v1, $v1, $v0
    lw          $v0, 0x20($a0)
    lw          $a0, 0x20($s2)
    sra         $a3, $v1, 16
    bgez        $a3, .L800A3750
    addu        $a1, $a3, $zero
    negu        $a1, $a1
.L800A3750:
    subu        $v0, $v0, $a0
    sra         $a2, $v0, 16
    bgez        $a2, .L800A3764
    addu        $v1, $a2, $zero
    negu        $v1, $v1
.L800A3764:
    slt         $v0, $v1, $a1
    beqz        $v0, .L800A3778
    sra         $v0, $v1, 1
    j           func_8009F05C
    addu        $a1, $a1, $v0
.L800A3778:
    sra         $v0, $a1, 1
    addu        $a1, $v1, $v0
    lw          $v1, 0x24($s1)
    lw          $v0, 0x2C($s2)
    lw          $a0, 0x2C($v1)
    subu        $a0, $a0, $v0
    sra         $a0, $a0, 16
    .word       0x00850018  # mult        $a0, $a1
    .word       0x00002012  # mflo        $a0
    lw          $v0, 0x30($v1)
    lw          $v1, 0x30($s2)
    subu        $v0, $v0, $v1
    sra         $v0, $v0, 16
    .word       0x00450018  # mult        $v0, $a1
    .word       0x00001012  # mflo        $v0
    sra         $a0, $a0, 16
    addu        $a3, $a3, $a0
    addu        $a3, $a3, $a0
    addu        $a1, $a3, $zero
    sra         $v0, $v0, 16
    addu        $a2, $a2, $v0
    addu        $a2, $a2, $v0
    bgez        $a3, .L800A37DC
    addu        $v1, $a2, $zero
    negu        $a1, $a3
.L800A37DC:
    bltzl       $a2, .L800A37E4
    negu        $v1, $a2
.L800A37E4:
    slt         $v0, $v1, $a1
    beqz        $v0, .L800A37F8
    sra         $v0, $v1, 1
    j           func_8009F0DC
    addu        $s0, $a1, $v0
.L800A37F8:
    sra         $v0, $a1, 1
    addu        $s0, $v1, $v0
    sra         $s0, $s0, 4
    addiu       $s0, $s0, -0xA
    bgez        $s0, .L800A38C0
    sll         $v0, $a3, 16
    sw          $v0, 0x10($sp)
    sll         $v0, $a2, 16
    addiu       $a0, $sp, 0x10
    jal         func_800B92FC
    sw          $v0, 0x14($sp)
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    sll         $v1, $a1, 1
    addu        $v1, $v1, $s3
    lhu         $v0, 0x0($v1)
    addu        $v0, $v0, $s0
    addiu       $s0, $s0, 0x2
    bgez        $s0, .L800A38C0
    sh          $v0, 0x0($v1)
    addiu       $v0, $a1, 0x1
    andi        $v0, $v0, 0x7
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    addu        $v1, $v1, $s0
    sh          $v1, 0x0($v0)
    addiu       $v0, $a1, -0x1
    andi        $v0, $v0, 0x7
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    addu        $v1, $v1, $s0
    addiu       $s0, $s0, 0x2
    bgez        $s0, .L800A38C0
    sh          $v1, 0x0($v0)
    addiu       $v0, $a1, 0x2
    andi        $v0, $v0, 0x7
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    addu        $v1, $v1, $s0
    sh          $v1, 0x0($v0)
    addiu       $v0, $a1, -0x2
    andi        $v0, $v0, 0x7
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    addu        $v1, $v1, $s0
    sh          $v1, 0x0($v0)
.L800A38C0:
    lw          $s1, 0x0($s1)
    bnez        $s1, .L800A3728
    nop
.L800A38CC:
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800A3704

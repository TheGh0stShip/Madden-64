.text
.align 2
.set noreorder
.globl func_800A307C
.ent func_800A307C
func_800A307C:
    lui         $a0, 0x8008
    lhu         $a0, 0x7A60($a0)
    lui         $v0, 0x8008
    lh          $v0, 0x76DC($v0)
    lui         $a2, 0x8009
    lhu         $a2, -0x751C($a2)
    lui         $a1, 0x8008
    lw          $a1, 0xC10($a1)
    sll         $v1, $a0, 16
    sra         $v1, $v1, 16
    addiu       $v0, $v0, -0x1
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x8008
    lhu         $v0, 0x7AAC($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    xori        $a3, $a2, 0x1
    lui         $at, 0x8009
    sh          $a2, -0x7920($at)
    lui         $at, 0x8009
    sh          $a3, -0x751C($at)
    subu        $a0, $a0, $v0
    andi        $v0, $a1, 0x1
    addu        $a0, $a0, $v1
    lui         $at, 0x8008
    sh          $a0, 0x7904($at)
    beqz        $v0, .L800A30FC
    lui         $v0, 0x80
    or          $v0, $a1, $v0
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800A30FC:
    lui         $v0, 0xFDFF
    ori         $v0, $v0, 0xFFFF
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $a0, 0x8009
    lhu         $a0, -0x498E($a0)
    and         $v1, $v1, $v0
    srl         $a0, $a0, 1
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    blez        $a0, .L800A31B0
    addu        $a1, $zero, $zero
    addu        $t0, $a0, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $a2, $v0, $a0
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $a0, $v0, $a0
.L800A3178:
    lw          $v1, 0x0($a0)
    lhu         $v0, 0x28($v1)
    ori         $v0, $v0, 0x8
    andi        $v0, $v0, 0xFFDF
    sh          $v0, 0x28($v1)
    lw          $v1, 0x0($a2)
    addiu       $a0, $a0, 0x4
    lhu         $v0, 0x28($v1)
    addiu       $a1, $a1, 0x1
    andi        $v0, $v0, 0xFFD7
    sh          $v0, 0x28($v1)
    slt         $v0, $a1, $t0
    bnez        $v0, .L800A3178
    addiu       $a2, $a2, 0x4
.L800A31B0:
    lui         $a1, 0x8008
    lw          $a1, 0xC10($a1)
    addiu       $v0, $zero, -0x7
    and         $v1, $a1, $v0
    andi        $v0, $a1, 0x2
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    beqz        $v0, .L800A31DC
    ori         $v0, $v1, 0x4
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800A31DC:
    andi        $v0, $a1, 0x4
    beqz        $v0, .L800A31FC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x2
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800A31FC:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    xori        $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800A3294
    nop
    jal         func_800CC18C
    nop
    jal         func_800DBFA8
    nop
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A307C

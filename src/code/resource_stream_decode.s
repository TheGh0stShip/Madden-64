.text
.align 2
.set noreorder
.globl resource_stream_decode
.ent resource_stream_decode
resource_stream_decode:
    addiu       $sp, $sp, -0x88
    sw          $s1, 0x64($sp)
    addu        $s1, $a2, $zero
    sw          $ra, 0x84($sp)
    sw          $fp, 0x80($sp)
    sw          $s7, 0x7C($sp)
    sw          $s6, 0x78($sp)
    sw          $s5, 0x74($sp)
    sw          $s4, 0x70($sp)
    sw          $s3, 0x6C($sp)
    sw          $s2, 0x68($sp)
    sw          $s0, 0x60($sp)
    sw          $a1, 0x14($sp)
    lbu         $v0, 0x0($s1)
    addiu       $fp, $zero, -0x1
    bnez        $v0, .L80016110
    addu        $s2, $a0, $zero
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x4060
.L80016110:
    lw          $t4, 0x14($sp)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x6C30
    lh          $v0, 0x0($t4)
    lh          $v1, 0x0($a1)
    lhu         $t4, 0x2($t4)
    addu        $s3, $v0, $zero
    slt         $v0, $v0, $v1
    beqz        $v0, .L8001613C
    sh          $t4, 0x1E($sp)
    sh          $s3, 0x0($a1)
.L8001613C:
    lw          $t4, 0x14($sp)
    lh          $v0, 0x2($t4)
    lui         $v1, 0x8008
    lh          $v1, 0x6C32($v1)
    addu        $a1, $v0, $zero
    slt         $v0, $v0, $v1
    beqz        $v0, .L80016164
    sll         $s0, $a0, 16
    lui         $at, 0x8008
    sh          $a1, 0x6C32($at)
.L80016164:
    sra         $s0, $s0, 16
    addu        $a0, $s0, $zero
    jal         func_80016A24
    addu        $a1, $s1, $zero
    addu        $s6, $v0, $zero
    addu        $a0, $s0, $zero
    jal         func_80016BB0
    addu        $a1, $s1, $zero
    addu        $a0, $v0, $zero
    andi        $v0, $s6, 0xF
    beqz        $v0, .L800161AC
    sll         $v1, $s6, 16
    addiu       $v0, $s6, 0x1
.L80016198:
    addu        $s6, $v0, $zero
    andi        $v0, $v0, 0xF
    bnez        $v0, .L80016198
    addiu       $v0, $s6, 0x1
    sll         $v1, $s6, 16
.L800161AC:
    sra         $v1, $v1, 16
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addu        $a0, $zero, $zero
    srl         $v0, $v1, 31
    addu        $v1, $v1, $v0
    sra         $s0, $v1, 1
    jal         func_80032E00
    addu        $a1, $s0, $zero
    sw          $v0, 0x24($sp)
    lw          $a2, 0x24($sp)
    blez        $s0, .L8001620C
    addu        $a0, $zero, $zero
    addu        $a1, $s0, $zero
.L800161EC:
    sw          $zero, 0x0($a2)
    addiu       $v0, $a0, 0x4
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a1
    bnez        $v0, .L800161EC
    addiu       $a2, $a2, 0x4
.L8001620C:
    addu        $s7, $s1, $zero
    lbu         $v1, 0x0($s7)
    beqz        $v1, .L800164F8
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x3C($sp)
    lw          $t4, 0x3C($sp)
    sll         $v0, $v0, 3
    subu        $v0, $v0, $t4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t4
    sll         $s1, $v0, 3
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x747C
    addu        $v0, $s1, $v0
    sw          $v0, 0x44($sp)
.L8001624C:
    addiu       $a2, $v1, -0x20
    addu        $a1, $a2, $zero
    beqz        $a1, .L80016488
    addu        $s4, $a2, $zero
    lw          $t4, 0x44($sp)
    sll         $v0, $a1, 1
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $a0, -0x7480($at)
    addu        $v0, $v0, $t4
    lhu         $s2, 0x0($v0)
    addu        $v1, $a0, $zero
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    slt         $v0, $a0, $v0
    beqz        $v0, .L80016294
    addu        $s5, $s2, $zero
    addu        $s2, $v1, $zero
.L80016294:
    addiu       $v0, $a1, -0x1
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00001012  # mflo        $v0
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lw          $s0, -0x73BC($at)
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    lui         $v1, 0x8007
    lh          $v1, -0x6D80($v1)
    addu        $s0, $s0, $v0
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8001630C
    sll         $v0, $s3, 16
    addiu       $v0, $fp, -0x10
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0xA
    bnez        $v0, .L8001630C
    sll         $v0, $s3, 16
    addiu       $v0, $a2, -0x10
    sltiu       $v0, $v0, 0xA
    bnez        $v0, .L8001630C
    sll         $v0, $s3, 16
    lw          $a2, 0x3C($sp)
    sll         $a0, $fp, 16
    jal         func_800165A0
    sra         $a0, $a0, 16
    subu        $s3, $s3, $v0
    sll         $v0, $s3, 16
.L8001630C:
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    lw          $t4, 0x24($sp)
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $v0, -0x7482($at)
    addu        $t0, $zero, $zero
    blez        $v0, .L80016488
    addu        $a1, $t4, $v1
    sll         $v0, $s2, 16
    sra         $a0, $v0, 16
    addu        $t4, $zero, $zero
    slt         $t3, $t4, $a0
    andi        $t1, $s3, 0x1
    sll         $v1, $s5, 16
    sra         $a3, $v1, 16
    srl         $v0, $v0, 31
    addu        $a0, $a0, $v0
    sra         $t2, $a0, 1
.L80016360:
    beqz        $t3, .L800163F8
    addu        $a0, $zero, $zero
    sll         $v0, $s2, 16
    sra         $a2, $v0, 16
.L80016370:
    bnez        $t1, .L800163AC
    nop
    lbu         $v0, 0x0($s0)
    lbu         $v1, 0x0($a1)
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 4
    or          $v1, $v1, $v0
    sb          $v1, 0x0($a1)
    lbu         $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
    srl         $v0, $v0, 4
    or          $v1, $v1, $v0
    sb          $v1, 0x0($a1)
    j .L800163DC
    addiu       $a1, $a1, 0x1
.L800163AC:
    lbu         $v0, 0x0($s0)
    lbu         $v1, 0x0($a1)
    andi        $v0, $v0, 0xF
    or          $v1, $v1, $v0
    sb          $v1, 0x0($a1)
    addiu       $a1, $a1, 0x1
    lbu         $v0, 0x0($s0)
    lbu         $v1, 0x0($a1)
    addiu       $s0, $s0, 0x1
    andi        $v0, $v0, 0xF0
    or          $v1, $v1, $v0
    sb          $v1, 0x0($a1)
.L800163DC:
    addiu       $v0, $a0, 0x2
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $a2
    bnez        $v0, .L80016370
    nop
.L800163F8:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $a0, -0x7480($at)
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $v1, -0x7486($at)
    slt         $v0, $v0, $a3
    addu        $a1, $a1, $v0
    .word       0x00830018  # mult        $a0, $v1
    .word       0x00002012  # mflo        $a0
    sll         $v0, $s6, 16
    sra         $v0, $v0, 16
    subu        $v0, $v0, $a3
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addu        $a1, $a1, $v0
    addiu       $v1, $t0, 0x1
    addu        $t0, $v1, $zero
    srl         $v0, $a0, 31
    addu        $a0, $a0, $v0
    sra         $a0, $a0, 1
    subu        $a0, $a0, $t2
    addu        $s0, $s0, $a0
    andi        $v0, $s2, 0x1
    subu        $s0, $s0, $v0
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $v0, -0x7482($at)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    slt         $v1, $v1, $v0
    bnez        $v1, .L80016360
    nop
.L80016488:
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lh          $v1, -0x7484($at)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800164B8
    sll         $v0, $s4, 16
    lw          $t4, 0x44($sp)
    sra         $v0, $v0, 15
    addu        $v0, $v0, $t4
    lhu         $v0, 0x0($v0)
    j .L800164C4
    nop
.L800164B8:
    lui         $at, 0x8009
    addu        $at, $at, $s1
    lhu         $v0, -0x747C($at)
.L800164C4:
    jal         func_80031A58
    addu        $s3, $s3, $v0
    sll         $v1, $s3, 16
    sra         $v1, $v1, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v1, $v1, $v0
    beqz        $v1, .L800164F8
    nop
    addiu       $s7, $s7, 0x1
    lbu         $v1, 0x0($s7)
    bnez        $v1, .L8001624C
    addu        $fp, $s4, $zero
.L800164F8:
    lw          $t4, 0x14($sp)
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    lh          $a0, 0x0($t4)
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x6C34
    lh          $v1, 0x0($a2)
    subu        $v0, $v0, $a0
    slt         $v1, $v1, $v0
    beqz        $v1, .L8001652C
    addu        $a1, $a0, $zero
    subu        $v0, $s3, $a1
    sh          $v0, 0x0($a2)
.L8001652C:
    lhu         $t4, 0x1E($sp)
    sll         $v0, $t4, 16
    lw          $t4, 0x14($sp)
    lh          $a0, 0x2($t4)
    lui         $v1, 0x8008
    lh          $v1, 0x6C36($v1)
    sra         $v0, $v0, 16
    subu        $v0, $v0, $a0
    slt         $v1, $v1, $v0
    beqz        $v1, .L80016568
    addu        $a1, $a0, $zero
    lhu         $t4, 0x1E($sp)
    subu        $v0, $t4, $a1
    lui         $at, 0x8008
    sh          $v0, 0x6C36($at)
.L80016568:
    lw          $v0, 0x24($sp)
    lw          $ra, 0x84($sp)
    lw          $fp, 0x80($sp)
    lw          $s7, 0x7C($sp)
    lw          $s6, 0x78($sp)
    lw          $s5, 0x74($sp)
    lw          $s4, 0x70($sp)
    lw          $s3, 0x6C($sp)
    lw          $s2, 0x68($sp)
    lw          $s1, 0x64($sp)
    lw          $s0, 0x60($sp)
    addiu       $sp, $sp, 0x88
    jr          $ra
    nop
.end resource_stream_decode

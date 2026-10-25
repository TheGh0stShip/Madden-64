.text
.align 2
.set noreorder
.globl resource_stream_process
.ent resource_stream_process
resource_stream_process:
    sll         $a0, $a0, 16
    sra         $t0, $a0, 16
    slt         $v1, $zero, $t0
    sll         $a1, $a1, 16
    sra         $t3, $a1, 16
    slt         $v0, $zero, $t3
    and         $v1, $v1, $v0
    beqz        $v1, .L800167EC
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $a2, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $a2
    lhu         $v0, -0x7480($at)
    addiu       $a0, $t0, -0x1
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    .word       0x00820018  # mult        $a0, $v0
    .word       0x00002012  # mflo        $a0
    addiu       $v1, $t3, -0x1
    nop
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    addu        $t5, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $a2
    lw          $v0, -0x73BC($at)
    lui         $at, 0x8009
    addu        $at, $at, $a2
    lh          $a3, -0x7482($at)
    sll         $a1, $a1, 1
    addu        $t2, $v0, $a0
    blez        $a3, .L800167E4
    addu        $t1, $v0, $v1
    addu        $t4, $a2, $zero
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x747C
    sll         $v1, $t0, 1
    addu        $t7, $t4, $v0
    addu        $t6, $v1, $t7
    lh          $v0, 0x0($t6)
    sll         $t9, $t3, 1
    addu        $t8, $a3, $zero
    addiu       $v0, $v0, 0x1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addiu       $t3, $v0, -0x1
.L8001667C:
    addu        $a0, $t2, $t3
    lbu         $v1, 0x0($a0)
    addu        $a3, $zero, $zero
    j .L800166B0
    addu        $a2, $zero, $zero
.L80016690:
    sltiu       $v0, $v0, 0x61
    sltu        $v1, $t2, $a0
    and         $v0, $v0, $v1
    beqz        $v0, .L800166C0
    nop
    addiu       $a0, $a0, -0x1
    lbu         $v1, 0x0($a0)
    addiu       $a2, $a2, 0x2
.L800166B0:
    andi        $v0, $v1, 0xF
    sltiu       $v0, $v0, 0x7
    bnez        $v0, .L80016690
    andi        $v0, $v1, 0xF0
.L800166C0:
    lbu         $v0, 0x0($a0)
    andi        $v0, $v0, 0xF0
    sltiu       $v0, $v0, 0x61
    bnel        $v0, $zero, .L800166D4
    addiu       $a2, $a2, 0x1
.L800166D4:
    lhu         $v0, 0x0($t6)
    andi        $v0, $v0, 0x1
    bnel        $v0, $zero, .L800166E4
    addiu       $a2, $a2, -0x1
.L800166E4:
    lbu         $v1, 0x0($t1)
    andi        $v0, $v1, 0xF
    sltiu       $v0, $v0, 0x7
    beqz        $v0, .L80016768
    addu        $a0, $t1, $zero
    andi        $v0, $v1, 0xF0
    sltiu       $v0, $v0, 0x61
    beqz        $v0, .L80016754
    addu        $v0, $t9, $t7
    lh          $v0, 0x0($v0)
    addiu       $v0, $v0, 0x1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addu        $t0, $t1, $v0
    sltu        $v0, $a0, $t0
.L80016724:
    beqz        $v0, .L80016754
    nop
    addiu       $a0, $a0, 0x1
    lbu         $v1, 0x0($a0)
    andi        $v0, $v1, 0xF
    sltiu       $v0, $v0, 0x7
    beqz        $v0, .L80016768
    addiu       $a3, $a3, 0x2
    andi        $v0, $v1, 0xF0
    sltiu       $v0, $v0, 0x61
    bnez        $v0, .L80016724
    sltu        $v0, $a0, $t0
.L80016754:
    lbu         $v0, 0x0($a0)
    andi        $v0, $v0, 0xF
    sltiu       $v0, $v0, 0x7
    bnel        $v0, $zero, .L80016768
    addiu       $a3, $a3, 0x1
.L80016768:
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    addu        $v0, $v0, $v1
    sll         $v1, $a1, 16
    sra         $v1, $v1, 16
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L80016790
    addu        $a1, $a2, $a3
.L80016790:
    lui         $at, 0x8009
    addu        $at, $at, $t4
    lhu         $v0, -0x7480($at)
    lui         $at, 0x8009
    addu        $at, $at, $t4
    lh          $a0, -0x7486($at)
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    addiu       $v0, $t5, 0x1
    addu        $t5, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t8
    addu        $t2, $t2, $v1
    bnez        $v0, .L8001667C
    addu        $t1, $t1, $v1
.L800167E4:
    j .L800167F0
    addiu       $a1, $a1, -0x1
.L800167EC:
    addu        $a1, $zero, $zero
.L800167F0:
    sll         $v0, $a1, 16
    jr          $ra
    sra         $v0, $v0, 16
.end resource_stream_process

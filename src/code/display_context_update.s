.text
.align 2
.set noreorder
.globl display_context_update
.ent display_context_update
display_context_update:
    addiu       $sp, $sp, -0x48
    sw          $s2, 0x38($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x3C($sp)
    addu        $s3, $a2, $zero
    sw          $ra, 0x40($sp)
    sw          $s1, 0x34($sp)
    sw          $s0, 0x30($sp)
    lw          $s1, 0x8($a0)
    addiu       $a1, $zero, 0x1
    andi        $s0, $a3, 0xFFFF
    addiu       $a2, $sp, 0x20
    addiu       $a3, $sp, 0x18
    jal         func_80044108
    sw          $s0, 0x10($sp)
    beqz        $s0, .L80043734
    lui         $t2, 0xFFFB
    lw          $t1, 0x20($sp)
    ori         $t2, $t2, 0x3334
    .word       0x012A0018  # mult        $t1, $t2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    sw          $t1, 0x20($sp)
    lw          $t1, 0x24($sp)
    .word       0x012A0018  # mult        $t1, $t2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    j .L8004377C
    sw          $t1, 0x24($sp)
.L80043708:
    subu        $v0, $v0, $a3
    sll         $v0, $v0, 5
    sll         $v1, $a2, 3
    subu        $v1, $v1, $a2
    sll         $v1, $v1, 3
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5A98
    addu        $v1, $v1, $a0
    addu        $v0, $v0, $v1
    j .L8004388C
    sw          $v0, 0x24($s1)
.L80043734:
    lw          $t2, 0x20($sp)
    lui         $t1, 0x4
    ori         $t1, $t1, 0xCCCC
    .word       0x01490018  # mult        $t2, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t2, $t6, $t7
    sw          $t2, 0x20($sp)
    lw          $t2, 0x24($sp)
    .word       0x01490018  # mult        $t2, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t2, $t6, $t7
    sw          $t2, 0x24($sp)
.L8004377C:
    lw          $t1, 0x28($sp)
    lui         $t2, 0x4
    ori         $t2, $t2, 0xCCCC
    .word       0x012A0018  # mult        $t1, $t2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    addiu       $a0, $sp, 0x20
    addiu       $s0, $s1, 0x2C
    addu        $a1, $s0, $zero
    jal         func_8002DBD0
    sw          $t1, 0x28($sp)
    lw          $v1, 0x34($s1)
    lui         $v0, 0x8007
    lw          $v0, 0x49AC($v0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L8004388C
    sw          $zero, 0x24($s1)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x48EC
    jal         func_80043404
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFF
    sh          $v0, 0x0($s3)
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    lh          $v1, 0x0($s2)
    lhu         $v0, 0x18($a0)
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00004012  # mflo        $t0
    sh          $v1, 0x18($sp)
    lh          $v1, 0x4($s2)
    lhu         $v0, 0x1A($a0)
    subu        $v1, $v1, $v0
    sll         $a1, $v1, 16
    sra         $a1, $a1, 16
    .word       0x00A50018  # mult        $a1, $a1
    .word       0x00002812  # mflo        $a1
    sh          $v1, 0x1A($sp)
    lh          $v1, 0x8($s2)
    lhu         $v0, 0x1C($a0)
    subu        $v1, $v1, $v0
    sll         $a0, $v1, 16
    sra         $a0, $a0, 16
    .word       0x00840018  # mult        $a0, $a0
    .word       0x00002012  # mflo        $a0
    sh          $v1, 0x1C($sp)
    lbu         $a3, 0x51($s1)
    addu        $a2, $zero, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x496C
    sll         $v0, $a3, 4
    addu        $v1, $v0, $v1
    addu        $t0, $t0, $a1
    addu        $t0, $t0, $a0
.L8004386C:
    lw          $v0, 0x0($v1)
    sltu        $v0, $v0, $t0
    bnez        $v0, .L80043708
    sll         $v0, $a3, 3
    addiu       $a2, $a2, 0x1
    sltiu       $v0, $a2, 0x4
    bnez        $v0, .L8004386C
    addiu       $v1, $v1, 0x4
.L8004388C:
    lw          $v0, 0x24($s1)
    sltiu       $v0, $v0, 0x1
    lw          $ra, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end display_context_update

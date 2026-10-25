.text
.align 2
.set noreorder
.globl func_80044530
.ent func_80044530
func_80044530:
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x20($sp)
    lbu         $s4, 0x4B($sp)
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s6, 0x28($sp)
    addu        $s6, $zero, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a1, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a3, $zero
    sw          $s7, 0x2C($sp)
    lbu         $s7, 0x4F($sp)
    addiu       $v1, $a2, -0x1E
    andi        $v1, $v1, 0xFFFF
    sltiu       $v1, $v1, 0x5E
    andi        $a1, $a2, 0xFFFF
    xori        $v0, $a1, 0x74
    sltu        $v0, $zero, $v0
    and         $v1, $v1, $v0
    sw          $ra, 0x30($sp)
    sw          $s2, 0x18($sp)
    beqz        $v1, .L8004459C
    sw          $s1, 0x14($sp)
    xori        $v0, $a1, 0x75
    sltu        $v0, $zero, $v0
    addu        $s6, $v0, $zero
.L8004459C:
    lui         $at, 0x8007
    addu        $at, $at, $a1
    lbu         $s1, 0x49B0($at)
    andi        $a0, $s5, 0xFFFF
    jal         func_80035D7C
    addu        $a1, $s1, $zero
    sll         $v1, $s4, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lhu         $s2, 0x490C($at)
    addu        $a1, $v0, $zero
    andi        $v0, $s0, 0xFF
    sll         $v1, $s2, 1
    bnez        $v0, .L800445E0
    addu        $a2, $v1, $zero
    j .L800445E8
    addu        $a0, $s3, $zero
.L800445E0:
    addu        $a0, $s3, $zero
    addu        $a1, $a1, $v1
.L800445E8:
    jal         func_8002E17C
    andi        $a2, $a2, 0xFFFE
    andi        $s0, $s5, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addu        $a1, $s1, $zero
    andi        $v0, $s6, 0xFFFF
    beqz        $v0, .L80044614
    addiu       $a1, $zero, 0x4B
    j .L80044634
    addu        $a0, $s0, $zero
.L80044614:
    addu        $a0, $s0, $zero
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x4914
    sll         $v1, $s4, 2
    addu        $v1, $v1, $v0
    sll         $v0, $s7, 1
    addu        $v0, $v0, $v1
    lh          $a1, 0x0($v0)
.L80044634:
    sll         $a2, $s2, 1
    jal         func_80036268
    addu        $a2, $s3, $a2
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x4914
    sll         $v1, $s4, 2
    addu        $v1, $v1, $v0
    sll         $v0, $s7, 1
    addu        $v0, $v0, $v1
    lh          $a1, 0x0($v0)
    jal         func_80035598
    andi        $a0, $s5, 0xFFFF
    lw          $ra, 0x30($sp)
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
.end func_80044530

.text
.align 2
.set noreorder
.globl frame_resource_update
.ent frame_resource_update
frame_resource_update:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    lhu         $s5, 0x42($sp)
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    addu        $t0, $zero, $zero
    sw          $s1, 0x14($sp)
    addiu       $s1, $zero, 0x2
    sw          $s3, 0x1C($sp)
    addu        $s3, $zero, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a3, $zero
    sw          $s6, 0x28($sp)
    lhu         $s6, 0x46($sp)
    andi        $a2, $a2, 0xFFFF
    slti        $v0, $a2, 0x21
    sw          $ra, 0x2C($sp)
    bnez        $v0, .L80028580
    sw          $s0, 0x10($sp)
    slti        $v0, $a2, 0x24
    bnez        $v0, .L80028580
    slti        $v0, $a2, 0x27
    beqz        $v0, .L80028580
    nop
    addiu       $t0, $zero, 0xF0
    addiu       $s1, $zero, 0x1
.L80028580:
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    addiu       $v0, $t0, 0x5A9C
    andi        $a0, $a1, 0xFFFF
    jal         func_80024BD4
    addu        $s0, $v1, $v0
    andi        $v1, $s2, 0xFFFF
    .word       0x00710018  # mult        $v1, $s1
    .word       0x00001812  # mflo        $v1
    addu        $a1, $zero, $zero
    sll         $v1, $v1, 2
    addu        $s0, $s0, $v1
    beqz        $s1, .L80028640
    andi        $v1, $v0, 0xFF
    lui         $a2, 0xFE00
    sll         $v0, $s4, 16
    sltu        $t2, $zero, $v0
    andi        $a0, $v1, 0xFFFF
    sll         $t3, $a0, 25
    lui         $t0, 0x1FF
    ori         $t0, $t0, 0xFFFF
    addiu       $t4, $zero, -0x20
    lui         $t1, 0xFFFC
    ori         $t1, $t1, 0x1F
    lui         $a3, 0xFE03
    ori         $a3, $a3, 0xFFFF
.L800285E8:
    lw          $v1, 0x0($s0)
    srl         $v0, $v1, 25
    beq         $a0, $v0, .L80028640
    and         $v0, $v1, $a2
    xor         $v0, $v0, $a2
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $t2
    beqz        $v0, .L80028624
    and         $v0, $v1, $t0
    or          $v0, $v0, $t3
    and         $v0, $v0, $t4
    and         $v0, $v0, $t1
    and         $v0, $v0, $a3
    j .L80028640
    sw          $v0, 0x0($s0)
.L80028624:
    addiu       $v0, $a1, 0x1
    addu        $a1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $s1
    bnez        $v0, .L800285E8
    addiu       $s0, $s0, 0x4
.L80028640:
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    beql        $v0, $s1, .L80028650
    addiu       $s3, $zero, -0x1
.L80028650:
    sll         $v0, $s3, 16
    bnez        $v0, .L80028718
    lui         $a1, 0xFE03
    lw          $a0, 0x0($s0)
    ori         $a1, $a1, 0xFFFF
    sll         $v0, $s4, 16
    sra         $v0, $v0, 16
    srl         $v1, $a0, 18
    andi        $v1, $v1, 0x7F
    addu        $a2, $v1, $v0
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x7F
    sll         $v0, $v1, 18
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L8002869C
    sw          $a0, 0x0($s0)
    lui         $v0, 0x1FC
    or          $v0, $a0, $v0
    sw          $v0, 0x0($s0)
.L8002869C:
    lw          $a0, 0x0($s0)
    lui         $a1, 0xFFFC
    ori         $a1, $a1, 0x1F
    sll         $v0, $s5, 16
    sra         $v0, $v0, 16
    srl         $v1, $a0, 5
    andi        $v1, $v1, 0x1FFF
    addu        $a2, $v1, $v0
    and         $a0, $a0, $a1
    andi        $v1, $a2, 0x1FFF
    sll         $v0, $v1, 5
    or          $a0, $a0, $v0
    beq         $v1, $a2, .L800286E4
    sw          $a0, 0x0($s0)
    lui         $v0, 0x3
    ori         $v0, $v0, 0xFFE0
    or          $v0, $a0, $v0
    sw          $v0, 0x0($s0)
.L800286E4:
    lw          $a0, 0x0($s0)
    sll         $v0, $s6, 16
    sra         $v0, $v0, 16
    andi        $v1, $a0, 0x1F
    addu        $a2, $v1, $v0
    addiu       $v0, $zero, -0x20
    and         $a0, $a0, $v0
    andi        $v0, $a2, 0x1F
    or          $a0, $a0, $v0
    beq         $v0, $a2, .L80028718
    sw          $a0, 0x0($s0)
    ori         $v0, $a0, 0x1F
    sw          $v0, 0x0($s0)
.L80028718:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end frame_resource_update

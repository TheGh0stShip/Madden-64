.text
.align 2
.set noreorder
.globl frame_resource_finalize
.ent frame_resource_finalize
frame_resource_finalize:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addiu       $s3, $zero, -0x1
    addu        $a2, $zero, $zero
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x2
    andi        $a1, $a1, 0xFFFF
    addiu       $a1, $a1, -0x21
    sltiu       $v0, $a1, 0x6
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L800283F0
    sw          $s0, 0x10($sp)
    sll         $v0, $a1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1178($at)
    jr          $v0
    nop
    j .L800283F0
    addu        $s3, $zero, $zero
    j .L800283F0
    addiu       $s3, $zero, 0x1
    j .L800283F0
    addiu       $s3, $zero, 0x2
    j .L800283E8
    addu        $s3, $zero, $zero
    j .L800283E8
    addiu       $s3, $zero, 0x1
    addiu       $s3, $zero, 0x2
.L800283E8:
    addiu       $a2, $zero, 0xF0
    addiu       $s2, $zero, 0x1
.L800283F0:
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    andi        $s0, $a0, 0xFFFF
    addu        $a0, $s0, $zero
    addiu       $v0, $a2, 0x5A9C
    jal         func_80024B90
    addu        $s1, $v1, $v0
    addu        $a0, $s0, $zero
    jal         func_80024BD4
    andi        $s0, $v0, 0xFF
    andi        $s4, $v0, 0xFF
    andi        $a0, $s0, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beq         $a0, $v0, .L800284F4
    addu        $v0, $zero, $zero
    jal         func_80028A58
    nop
    andi        $v0, $v0, 0xFFFF
    .word       0x00520018  # mult        $v0, $s2
    .word       0x00001012  # mflo        $v0
    addu        $v1, $zero, $zero
    sll         $v0, $v0, 2
    beqz        $s2, .L8002847C
    addu        $s1, $s1, $v0
    andi        $a0, $s4, 0xFFFF
.L80028454:
    lw          $v0, 0x0($s1)
    srl         $v0, $v0, 25
    beq         $a0, $v0, .L8002847C
    addiu       $v0, $v1, 0x1
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $s2
    bnez        $v0, .L80028454
    addiu       $s1, $s1, 0x4
.L8002847C:
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    beql        $v0, $s2, .L8002848C
    addiu       $s3, $zero, -0x1
.L8002848C:
    sll         $v0, $s3, 16
    sra         $v1, $v0, 16
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800284DC
    nop
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800284BC
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800284CC
    nop
    j .L800284F4
    addu        $v0, $zero, $zero
.L800284BC:
    beq         $v1, $v0, .L800284EC
    nop
    j .L800284F4
    addu        $v0, $zero, $zero
.L800284CC:
    lw          $v0, 0x0($s1)
    srl         $v0, $v0, 18
    j .L800284F4
    andi        $v0, $v0, 0x7F
.L800284DC:
    lw          $v0, 0x0($s1)
    srl         $v0, $v0, 5
    j .L800284F4
    andi        $v0, $v0, 0x1FFF
.L800284EC:
    lw          $v0, 0x0($s1)
    andi        $v0, $v0, 0x1F
.L800284F4:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end frame_resource_finalize

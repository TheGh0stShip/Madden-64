.text
.align 2
.set noreorder
.globl object_animation_state_update
.ent object_animation_state_update
object_animation_state_update:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s0, 0x18($sp)
    lw          $v1, 0x144($s1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80056540
    addiu       $v0, $v1, -0x1
    lw          $a2, 0x148($s1)
    lw          $v0, 0x1C($a2)
    sw          $v0, 0x158($s1)
    lw          $v0, 0x20($a2)
    sw          $v0, 0x15C($s1)
    lw          $v0, 0x20($a2)
    lw          $a0, 0xC($a2)
    .word       0x0044001B  # divu        $zero, $v0, $a0
    bnez        $a0, .L8005650C
    nop
    break       7
.L8005650C:
    .word       0x00003810  # mfhi        $a3
    lw          $v0, 0x24($a2)
    sw          $v1, 0x34($a2)
    sw          $v1, 0x38($a2)
    sw          $v1, 0x3C($a2)
    sw          $v1, 0x44($a2)
    bnez        $a3, .L80056530
    sw          $v0, 0x40($a2)
    addu        $a3, $a0, $zero
.L80056530:
    sw          $a3, 0x48($a2)
    sw          $v1, 0x160($s1)
    j .L800566B8
    sw          $zero, 0x164($s1)
.L80056540:
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L8005657C
    addiu       $v0, $zero, 0x18
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x144($s1)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L8005657C:
    lw          $a1, 0x130($s1)
    lw          $a0, 0x18($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    lw          $a0, 0x1C($s1)
    lw          $a1, 0x134($s1)
    sw          $v0, 0x158($s1)
    jal         func_800631D8
    sll         $a1, $a1, 3
    lw          $v1, 0x144($s1)
    addu        $s2, $zero, $zero
    sw          $v0, 0x15C($s1)
    blez        $v1, .L800566B8
    sw          $zero, 0x160($s1)
    addiu       $s4, $zero, 0xB
    addu        $s3, $s1, $zero
.L800565BC:
    lw          $a2, 0x148($s3)
    lw          $v0, 0x8($a2)
    sw          $v0, 0x34($a2)
    lw          $v0, 0x1C($a2)
    lw          $t0, 0x34($a2)
    .word       0x0048001B  # divu        $zero, $v0, $t0
    bnez        $t0, .L800565E0
    nop
    break       7
.L800565E0:
    .word       0x00003810  # mfhi        $a3
    lw          $a1, 0xC($a2)
    lw          $a0, 0x34($a2)
    .word       0x00850018  # mult        $a0, $a1
    .word       0x00002012  # mflo        $a0
    lw          $v1, 0x34($a2)
    lw          $v0, 0x24($a2)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    sw          $a1, 0x38($a2)
    sw          $a0, 0x3C($a2)
    bnez        $a3, .L80056618
    sw          $v1, 0x40($a2)
    addu        $a3, $t0, $zero
.L80056618:
    lw          $v0, 0x20($a2)
    lw          $v1, 0x38($a2)
    sw          $a3, 0x44($a2)
    .word       0x0043001B  # divu        $zero, $v0, $v1
    bnez        $v1, .L80056634
    nop
    break       7
.L80056634:
    .word       0x00003810  # mfhi        $a3
    beql        $a3, $zero, .L80056640
    addu        $a3, $v1, $zero
.L80056640:
    lw          $s0, 0x3C($a2)
    sw          $a3, 0x48($a2)
    lw          $v0, 0x160($s1)
    addu        $v0, $v0, $s0
    slti        $v0, $v0, 0xB
    bnez        $v0, .L80056678
    addu        $v0, $s0, $zero
    lw          $v0, 0x0($s1)
    sw          $s4, 0x14($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    addu        $v0, $s0, $zero
.L80056678:
    blez        $v0, .L800566A4
    addiu       $s0, $s0, -0x1
.L80056680:
    lw          $v0, 0x160($s1)
    addu        $a0, $s0, $zero
    addiu       $s0, $s0, -0x1
    addiu       $v1, $v0, 0x1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sw          $v1, 0x160($s1)
    bgtz        $a0, .L80056680
    sw          $s2, 0x164($v0)
.L800566A4:
    lw          $v0, 0x144($s1)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L800565BC
    addiu       $s3, $s3, 0x4
.L800566B8:
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_animation_state_update

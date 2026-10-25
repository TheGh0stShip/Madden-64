.text
.align 2
.set noreorder
.globl frame_resource_process
.ent frame_resource_process
frame_resource_process:
    addiu       $sp, $sp, -0x30
    sw          $s5, 0x24($sp)
    lw          $s5, 0x40($sp)
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a3, $zero
    sw          $s1, 0x14($sp)
    sll         $s1, $a0, 16
    sw          $ra, 0x28($sp)
    sw          $s2, 0x18($sp)
    bnez        $s1, .L80027F2C
    sw          $s0, 0x10($sp)
    j .L80028088
    addu        $v0, $zero, $zero
.L80027F2C:
    sll         $a0, $a1, 16
    jal         func_8002E7A0
    addu        $a1, $s1, $zero
    addiu       $a0, $v0, -0x4CCC
    jal         func_8002E7A0
    addiu       $a1, $zero, 0x3333
    addu        $v1, $v0, $zero
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    lui         $s2, 0x2
    ori         $s2, $s2, 0x6000
    slt         $v0, $s2, $v1
    beqz        $v0, .L80027F74
    addu        $s0, $v1, $zero
    lui         $v1, 0x2
    ori         $v1, $v1, 0x6000
    addu        $s0, $v1, $zero
.L80027F74:
    sll         $a0, $s3, 16
    jal         func_8002E7A0
    addu        $a1, $s1, $zero
    addiu       $v1, $v0, -0x3
    bgez        $v1, .L80027F90
    addu        $v0, $v1, $zero
    addiu       $v0, $v1, 0x3
.L80027F90:
    sra         $v1, $v0, 2
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    slt         $v0, $s2, $v1
    beql        $v0, $zero, .L80027FB8
    addu        $s0, $s0, $v1
    lui         $v1, 0x2
    ori         $v1, $v1, 0x6000
    addu        $s0, $s0, $v1
.L80027FB8:
    sll         $a0, $s4, 16
    jal         func_8002E7A0
    addu        $a1, $s1, $zero
    addu        $a0, $v0, $zero
    jal         func_8002E7A0
    addiu       $a1, $zero, 0xCCC
    addu        $v1, $v0, $zero
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    slt         $v0, $s2, $v1
    beql        $v0, $zero, .L80027FF8
    addu        $s0, $s0, $v1
    lui         $v1, 0x2
    ori         $v1, $v1, 0x6000
    addu        $s0, $s0, $v1
.L80027FF8:
    sll         $a0, $s5, 16
    jal         func_8002E7A0
    addu        $a1, $s1, $zero
    addiu       $a0, $zero, 0x1851
    subu        $a0, $a0, $v0
    jal         func_8002E7A0
    addiu       $a1, $zero, 0xA3D
    addu        $v1, $v0, $zero
    nor         $v0, $zero, $v1
    sra         $v0, $v0, 31
    and         $v1, $v1, $v0
    slt         $v0, $s2, $v1
    beql        $v0, $zero, .L8002803C
    addu        $s0, $s0, $v1
    lui         $v1, 0x2
    ori         $v1, $v1, 0x6000
    addu        $s0, $s0, $v1
.L8002803C:
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s0
    sll         $s0, $v0, 2
    lui         $v0, 0x2AAA
    ori         $v0, $v0, 0xAAAB
    .word       0x02020018  # mult        $s0, $v0
    sra         $v0, $s0, 31
    .word       0x00004010  # mfhi        $t0
    subu        $s0, $t0, $v0
    andi        $v1, $s0, 0xFFFF
    lui         $v0, 0xFFFF
    and         $s0, $s0, $v0
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v1, $v0, 1
    sra         $v0, $v1, 16
    addu        $v0, $s0, $v0
.L80028088:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end frame_resource_process

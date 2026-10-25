.text
.align 2
.set noreorder
.globl func_800AA6F4
.ent func_800AA6F4
func_800AA6F4:
    addiu       $sp, $sp, -0x40
    sw          $s0, 0x28($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    lh          $v0, 0x58($s0)
    lh          $a3, 0x50($s0)
    sw          $v0, 0x10($sp)
    lw          $a2, 0x98($s0)
    addiu       $a0, $s0, 0x18
    jal         func_800A5D6C
    addiu       $a1, $s0, 0x44
    lh          $a2, 0x64($s0)
    lh          $a3, 0x74($s0)
    lh          $v0, 0x7C($s0)
    addiu       $a0, $s0, 0x5C
    addiu       $a1, $s0, 0x6C
    jal         func_800A5C78
    sw          $v0, 0x10($sp)
    lh          $a2, 0x66($s0)
    lh          $a3, 0x76($s0)
    lh          $v0, 0x7E($s0)
    addiu       $a0, $s0, 0x5E
    addiu       $a1, $s0, 0x6E
    jal         func_800A5C78
    sw          $v0, 0x10($sp)
    lh          $a2, 0x68($s0)
    lh          $a3, 0x78($s0)
    lh          $v0, 0x80($s0)
    addiu       $a0, $s0, 0x60
    addiu       $a1, $s0, 0x70
    jal         func_800A5C78
    sw          $v0, 0x10($sp)
    lw          $v0, 0x9C($s0)
    beqz        $v0, .L800AA7C8
    nop
    lw          $v0, 0xC($s0)
    lw          $v1, 0x2C($s0)
    lw          $v0, 0x1C($v0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x18($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x2C($s0)
    lw          $v0, 0x20($v0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x1C($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x2C($s0)
    lw          $v0, 0x24($v0)
    j           func_800A60B8
    addu        $v0, $v0, $v1
.L800AA7C8:
    lw          $v0, 0x2C($s0)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x30($s0)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x34($s0)
    sw          $v0, 0x20($sp)
    lh          $a0, 0x5C($s0)
    jal         func_8002E848
    nop
    lh          $a0, 0x5C($s0)
    jal         func_8002E828
    addu        $s1, $v0, $zero
    lh          $a0, 0x60($s0)
    jal         func_8002E848
    addu        $s3, $v0, $zero
    lh          $a0, 0x60($s0)
    jal         func_8002E828
    addu        $s2, $v0, $zero
    lw          $v1, 0x14($s0)
    lhu         $v1, 0x206($v1)
    andi        $v1, $v1, 0x100
    beqz        $v1, .L800AA848
    addu        $a1, $v0, $zero
    lw          $t0, 0x18($s0)
    .word       0x02280018  # mult        $s1, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    j           func_800A6144
    nop
.L800AA848:
    negu        $v0, $s1
    lw          $t0, 0x18($s0)
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    lw          $v1, 0x18($sp)
    .word       0x00920018  # mult        $a0, $s2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x1C($s0)
    lw          $v1, 0x1C($sp)
    .word       0x00850018  # mult        $a0, $a1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x20($s0)
    lhu         $v0, 0x84($s0)
    lw          $v1, 0x18($s0)
    lw          $a0, 0x20($sp)
    andi        $v0, $v0, 0xFFD7
    negu        $v1, $v1
    sh          $v0, 0x84($s0)
    .word       0x00730018  # mult        $v1, $s3
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $a0
    sw          $v0, 0x24($s0)
    lw          $ra, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800AA6F4

.text
.align 2
.set noreorder
.globl gameplay_record_update_secondary
.ent gameplay_record_update_secondary
gameplay_record_update_secondary:
    addiu       $sp, $sp, -0x48
    sw          $s0, 0x40($sp)
    sw          $ra, 0x44($sp)
    jal         func_8002E848
    addu        $s0, $a0, $zero
    addu        $a0, $s0, $zero
    jal         func_8002E828
    addu        $s0, $v0, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x4CA4($v1)
    negu        $a2, $s0
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 4
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5E68
    addu        $a0, $a0, $v1
    lw          $t0, 0x0($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    lw          $t0, 0x18($a0)
    .word       0x01060018  # mult        $t0, $a2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $a3, $a3, $v1
    sw          $a3, 0x10($sp)
    lw          $t0, 0x0($a0)
    .word       0x01100018  # mult        $t0, $s0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t0, 0x18($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    sw          $v1, 0x28($sp)
    lw          $t0, 0x4($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t0, 0x1C($a0)
    .word       0x01060018  # mult        $t0, $a2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    sw          $v1, 0x14($sp)
    lw          $t0, 0x4($a0)
    .word       0x01100018  # mult        $t0, $s0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t0, 0x1C($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    sw          $v1, 0x2C($sp)
    lw          $t0, 0x8($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t0, 0x20($a0)
    .word       0x01060018  # mult        $t0, $a2
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    sw          $v1, 0x18($sp)
    lw          $t0, 0x8($a0)
    .word       0x01100018  # mult        $t0, $s0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t0, 0x20($a0)
    .word       0x01020018  # mult        $t0, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($sp)
    sw          $a3, 0x0($a0)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x4($a0)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x8($a0)
    lw          $v0, 0x28($sp)
    sw          $v0, 0x18($a0)
    lw          $v0, 0x2C($sp)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x30($sp)
    sw          $v0, 0x20($a0)
    lw          $ra, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end gameplay_record_update_secondary

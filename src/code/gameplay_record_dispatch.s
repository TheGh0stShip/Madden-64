.text
.align 2
.set noreorder
.globl gameplay_record_dispatch
.ent gameplay_record_dispatch
gameplay_record_dispatch:
    lui         $v0, 0x8009
    lw          $v0, -0x4CA4($v0)
    lw          $a3, 0x0($a0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 4
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5E68
    addu        $v1, $v1, $v0
    lw          $t0, 0x0($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0xC($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v0, $v0, $a2
    lw          $a3, 0x8($a0)
    lw          $t0, 0x18($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v0, $v0, $a2
    sw          $v0, 0x0($a1)
    lw          $a3, 0x0($a0)
    lw          $t0, 0x4($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0x10($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v0, $v0, $a2
    lw          $a3, 0x8($a0)
    lw          $t0, 0x1C($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v0, $v0, $a2
    sw          $v0, 0x4($a1)
    lw          $a3, 0x0($a0)
    lw          $t0, 0x8($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0x14($v1)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v0, $v0, $a2
    lw          $a0, 0x8($a0)
    lw          $a3, 0x20($v1)
    .word       0x00870018  # mult        $a0, $a3
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $v0, $v0, $a0
    sw          $v0, 0x8($a1)
    lw          $v0, 0x0($a1)
    lw          $a0, 0x24($v1)
    addu        $v0, $v0, $a0
    sw          $v0, 0x0($a1)
    lw          $v0, 0x4($a1)
    lw          $a0, 0x28($v1)
    addu        $v0, $v0, $a0
    sw          $v0, 0x4($a1)
    lw          $v0, 0x8($a1)
    lw          $v1, 0x2C($v1)
    addu        $v0, $v0, $v1
    jr          $ra
    sw          $v0, 0x8($a1)
.end gameplay_record_dispatch

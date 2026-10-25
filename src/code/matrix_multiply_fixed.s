.text
.align 2
.set noreorder
.globl matrix_multiply_fixed
.ent matrix_multiply_fixed
matrix_multiply_fixed:
    lw          $a3, 0x0($a1)
    lw          $t0, 0x0($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0xC($a1)
    lw          $t0, 0x4($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x18($a1)
    lw          $t0, 0x8($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($a2)
    lw          $a3, 0x4($a1)
    lw          $t0, 0x0($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x10($a1)
    lw          $t0, 0x4($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x1C($a1)
    lw          $t0, 0x8($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x4($a2)
    lw          $a3, 0x8($a1)
    lw          $t0, 0x0($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x14($a1)
    lw          $t0, 0x4($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x20($a1)
    lw          $t0, 0x8($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x8($a2)
    lw          $a3, 0x0($a1)
    lw          $t0, 0xC($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0xC($a1)
    lw          $t0, 0x10($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x18($a1)
    lw          $t0, 0x14($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0xC($a2)
    lw          $a3, 0x4($a1)
    lw          $t0, 0xC($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x10($a1)
    lw          $t0, 0x10($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x1C($a1)
    lw          $t0, 0x14($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x10($a2)
    lw          $a3, 0x8($a1)
    lw          $t0, 0xC($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x14($a1)
    lw          $t0, 0x10($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x20($a1)
    lw          $t0, 0x14($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x14($a2)
    lw          $a3, 0x0($a1)
    lw          $t0, 0x18($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0xC($a1)
    lw          $t0, 0x1C($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x18($a1)
    lw          $t0, 0x20($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x18($a2)
    lw          $a3, 0x4($a1)
    lw          $t0, 0x18($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x10($a1)
    lw          $t0, 0x1C($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a3, 0x1C($a1)
    lw          $t0, 0x20($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x1C($a2)
    lw          $a3, 0x8($a1)
    lw          $t0, 0x18($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    lw          $a3, 0x14($a1)
    lw          $t0, 0x1C($a0)
    .word       0x00E80018  # mult        $a3, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    lw          $a1, 0x20($a1)
    lw          $a0, 0x20($a0)
    .word       0x00A40018  # mult        $a1, $a0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $v0, $v0, $v1
    jr          $ra
    sw          $v0, 0x20($a2)
.end matrix_multiply_fixed

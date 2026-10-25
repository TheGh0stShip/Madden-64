.text
.align 2
.set noreorder
.globl matrix_stack_transform_point
.ent matrix_stack_transform_point
matrix_stack_transform_point:
    lui         $v1, 0x8009
    lw          $v1, -0x4CA4($v1)
    lw          $a3, 0x0($a0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5E68
    addu        $v0, $v0, $v1
    lw          $t0, 0x0($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0xC($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v1, $v1, $a2
    lw          $a3, 0x8($a0)
    lw          $t0, 0x18($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v1, $v1, $a2
    sw          $v1, 0x0($a1)
    lw          $a3, 0x0($a0)
    lw          $t0, 0x4($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0x10($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v1, $v1, $a2
    lw          $a3, 0x8($a0)
    lw          $t0, 0x1C($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v1, $v1, $a2
    sw          $v1, 0x4($a1)
    lw          $a3, 0x0($a0)
    lw          $t0, 0x8($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $a3, 0x4($a0)
    lw          $t0, 0x14($v0)
    mult        $a3, $t0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a2, $t6, $t7
    addu        $v1, $v1, $a2
    lw          $a0, 0x8($a0)
    lw          $v0, 0x20($v0)
    mult        $a0, $v0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v1, $v1, $v0
    jr          $ra
    sw          $v1, 0x8($a1)
.end matrix_stack_transform_point

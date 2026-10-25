.text
.align 2
.set noreorder
.globl matrix_stack_transform_vector
.ent matrix_stack_transform_vector
matrix_stack_transform_vector:
    lui         $v1, 0x8009
    lw          $v1, -0x4CA4($v1)
    lw          $a2, 0x0($a0)
    lw          $a3, 0x4($a0)
    lw          $t0, 0x8($a0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5E68
    addu        $v0, $v0, $v1
    lw          $t1, 0x0($v0)
    mult        $a2, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t1, 0xC($v0)
    mult        $a3, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $v1, $v1, $a0
    lw          $a0, 0x24($v0)
    lw          $t1, 0x18($v0)
    mult        $t0, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    lw          $t1, 0x4($v0)
    addu        $a0, $a0, $v1
    mult        $a2, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t1, 0x10($v0)
    sw          $a0, 0x24($v0)
    mult        $a3, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $v1, $v1, $a0
    lw          $a0, 0x28($v0)
    lw          $t1, 0x1C($v0)
    mult        $t0, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    lw          $t1, 0x8($v0)
    addu        $a0, $a0, $v1
    mult        $a2, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    lw          $t1, 0x14($v0)
    sw          $a0, 0x28($v0)
    mult        $a3, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $v1, $v1, $a0
    lw          $a0, 0x2C($v0)
    lw          $t1, 0x20($v0)
    mult        $t0, $t1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a1, $t6, $t7
    addu        $v1, $v1, $a1
    addu        $a0, $a0, $v1
    jr          $ra
    sw          $a0, 0x2C($v0)
.end matrix_stack_transform_vector

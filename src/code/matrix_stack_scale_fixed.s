.text
.align 2
.set noreorder
.globl matrix_stack_scale_fixed
.ent matrix_stack_scale_fixed
matrix_stack_scale_fixed:
    lui         $v1, 0x8009
    lw          $v1, -0x4CA4($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5E68
    addu        $v0, $v0, $v1
    lw          $a3, 0x0($v0)
    mult        $a3, $a0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x0($v0)
    lw          $a3, 0x4($v0)
    mult        $a3, $a0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x4($v0)
    lw          $a3, 0x8($v0)
    mult        $a3, $a0
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x8($v0)
    lw          $a3, 0xC($v0)
    mult        $a3, $a1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0xC($v0)
    lw          $a3, 0x10($v0)
    mult        $a3, $a1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x10($v0)
    lw          $a3, 0x14($v0)
    mult        $a3, $a1
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x14($v0)
    lw          $a3, 0x18($v0)
    mult        $a3, $a2
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x18($v0)
    lw          $a3, 0x1C($v0)
    mult        $a3, $a2
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    sw          $a3, 0x1C($v0)
    lw          $a3, 0x20($v0)
    mult        $a3, $a2
    mfhi        $t6
    mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a3, $t6, $t7
    jr          $ra
    sw          $a3, 0x20($v0)
.end matrix_stack_scale_fixed

.text
.align 2
.set noreorder
.globl matrix_stack_export_fixed
.ent matrix_stack_export_fixed
matrix_stack_export_fixed:
    lui         $v0, 0x8009
    lw          $v0, -0x4CA4($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 4
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5E68
    addu        $v1, $v1, $v0
    lw          $t0, 0x0($v1)
    lw          $a3, 0x4($v1)
    lui         $a2, 0xFFFF
    and         $a1, $t0, $a2
    srl         $v0, $a3, 16
    or          $a1, $a1, $v0
    sw          $a1, 0x0($a0)
    sll         $a1, $t0, 16
    andi        $v0, $a3, 0xFFFF
    or          $a1, $a1, $v0
    sw          $a1, 0x20($a0)
    lw          $a3, 0x8($v1)
    and         $t0, $a3, $a2
    sll         $a3, $a3, 16
    sw          $t0, 0x4($a0)
    sw          $a3, 0x24($a0)
    lw          $t0, 0xC($v1)
    lw          $a3, 0x10($v1)
    and         $a1, $t0, $a2
    srl         $v0, $a3, 16
    or          $a1, $a1, $v0
    sw          $a1, 0x8($a0)
    sll         $a1, $t0, 16
    andi        $v0, $a3, 0xFFFF
    or          $a1, $a1, $v0
    sw          $a1, 0x28($a0)
    lw          $a3, 0x14($v1)
    and         $t0, $a3, $a2
    sll         $a3, $a3, 16
    sw          $t0, 0xC($a0)
    sw          $a3, 0x2C($a0)
    lw          $t0, 0x18($v1)
    lw          $a3, 0x1C($v1)
    and         $a1, $t0, $a2
    srl         $v0, $a3, 16
    or          $a1, $a1, $v0
    sw          $a1, 0x10($a0)
    sll         $a1, $t0, 16
    andi        $v0, $a3, 0xFFFF
    or          $a1, $a1, $v0
    sw          $a1, 0x30($a0)
    lw          $a3, 0x20($v1)
    and         $t0, $a3, $a2
    sll         $a3, $a3, 16
    sw          $t0, 0x14($a0)
    sw          $a3, 0x34($a0)
    lw          $v0, 0x24($v1)
    lw          $a1, 0x28($v1)
    negu        $t0, $v0
    negu        $a3, $a1
    and         $a1, $t0, $a2
    srl         $v0, $a3, 16
    or          $a1, $a1, $v0
    sw          $a1, 0x18($a0)
    sll         $a1, $t0, 16
    andi        $v0, $a3, 0xFFFF
    or          $a1, $a1, $v0
    sw          $a1, 0x38($a0)
    lw          $v0, 0x2C($v1)
    negu        $a3, $v0
    and         $t0, $a3, $a2
    sll         $a3, $a3, 16
    ori         $v0, $t0, 0x1
    sw          $v0, 0x1C($a0)
    jr          $ra
    sw          $a3, 0x3C($a0)
.end matrix_stack_export_fixed

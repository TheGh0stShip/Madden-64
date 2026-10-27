.text
.align 2
.set noreorder
.globl object_driver_process
.ent object_driver_process
object_driver_process:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $s1, 0x1A0($s0)
    jal         func_80055780
    nop
    jal         func_80055A80
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    jal         object_state_pattern_test
    sw          $zero, 0xC($s1)
    sw          $v0, 0x10($s1)
    sw          $zero, 0x14($s1)
    sw          $zero, 0x18($s1)
    lw          $v0, 0x54($s0)
    beql        $v0, $zero, .L80055C18
    sw          $zero, 0x64($s0)
    lw          $v0, 0x40($s0)
    bnez        $v0, .L80055C20
    nop
    sw          $zero, 0x64($s0)
.L80055C18:
    sw          $zero, 0x68($s0)
    sw          $zero, 0x6C($s0)
.L80055C20:
    lw          $v0, 0x54($s0)
    beqz        $v0, .L80055CE4
    nop
    lw          $v0, 0x44($s0)
    beqz        $v0, .L80055C50
    addiu       $v0, $zero, 0x2E
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80055C50:
    lw          $v1, 0x78($s0)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L80055C74
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x64($s0)
    sw          $zero, 0x68($s0)
    sw          $zero, 0x6C($s0)
    j .L80055CA0
    sw          $zero, 0x88($s0)
.L80055C74:
    lw          $v0, 0x88($s0)
    beqz        $v0, .L80055C88
    addiu       $v0, $zero, 0x1
    j .L80055CA0
    sw          $v0, 0x68($s0)
.L80055C88:
    lw          $v0, 0x5C($s0)
    beqz        $v0, .L80055C9C
    addiu       $v0, $zero, 0x1
    j .L80055CA0
    sw          $v0, 0x6C($s0)
.L80055C9C:
    sw          $v0, 0x64($s0)
.L80055CA0:
    lw          $v0, 0x64($s0)
    beqz        $v0, .L80055CBC
    nop
    jal         image_runtime_initialize
    addu        $a0, $s0, $zero
    lw          $v0, 0x1C8($s0)
    sw          $v0, 0x14($s1)
.L80055CBC:
    lw          $v0, 0x6C($s0)
    bnez        $v0, .L80055CD4
    nop
    lw          $v0, 0x68($s0)
    beqz        $v0, .L80055CE4
    nop
.L80055CD4:
    jal         func_800627F0
    addu        $a0, $s0, $zero
    lw          $v0, 0x1C8($s0)
    sw          $v0, 0x18($s1)
.L80055CE4:
    lw          $v0, 0x44($s0)
    bnez        $v0, .L80055D28
    nop
    lw          $v0, 0x10($s1)
    beqz        $v0, .L80055D0C
    nop
    jal         func_80063104
    addu        $a0, $s0, $zero
    j .L80055D1C
    nop
.L80055D0C:
    jal         func_8005FD04
    addu        $a0, $s0, $zero
    jal         func_8005F51C
    addu        $a0, $s0, $zero
.L80055D1C:
    lw          $a1, 0x6C($s0)
    jal         func_8005CF24
    addu        $a0, $s0, $zero
.L80055D28:
    jal         object_subresources_allocate
    addu        $a0, $s0, $zero
    lw          $v0, 0xE0($s0)
    beqz        $v0, .L80055D5C
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L80055D80
    nop
.L80055D5C:
    lw          $v0, 0xDC($s0)
    beqz        $v0, .L80055D78
    nop
    jal         func_8005AAD0
    addu        $a0, $s0, $zero
    j .L80055D80
    nop
.L80055D78:
    jal         func_80059A00
    addu        $a0, $s0, $zero
.L80055D80:
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x10($v0)
    bnez        $v0, .L80055D9C
    addu        $a1, $zero, $zero
    lw          $v0, 0x40($s0)
    beqz        $v0, .L80055DA0
    nop
.L80055D9C:
    addiu       $a1, $zero, 0x1
.L80055DA0:
    jal         func_8005C930
    addu        $a0, $s0, $zero
    lw          $v0, 0x44($s0)
    bnez        $v0, .L80055DBC
    addu        $a0, $s0, $zero
    jal         func_8005B48C
    addu        $a1, $zero, $zero
.L80055DBC:
    lw          $v0, 0x4($s0)
    lw          $v0, 0x18($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x8($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x8($s0)
    beqz        $v0, .L80055E74
    nop
    lw          $v0, 0x40($s0)
    bnez        $v0, .L80055E74
    nop
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x10($v0)
    beqz        $v0, .L80055E74
    nop
    lw          $v0, 0xDC($s0)
    beqz        $v0, .L80055E24
    nop
    lw          $v1, 0x20($s0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    j .L80055E28
    addiu       $v1, $v0, 0x2
.L80055E24:
    lw          $v1, 0x20($s0)
.L80055E28:
    lw          $v0, 0x8($s0)
    sw          $zero, 0x4($v0)
    lw          $v0, 0x13C($s0)
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    lw          $v1, 0x8($s0)
    sw          $v0, 0x8($v1)
    lw          $v0, 0x8($s0)
    sw          $zero, 0xC($v0)
    lw          $v0, 0x6C($s0)
    lw          $v1, 0x8($s0)
    sltu        $v0, $zero, $v0
    negu        $v0, $v0
    andi        $v0, $v0, 0x3
    ori         $v0, $v0, 0x2
    sw          $v0, 0x10($v1)
    lw          $v0, 0xC($s1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0xC($s1)
.L80055E74:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_driver_process

.text
.align 2
.set noreorder
.globl display_context_process
.ent display_context_process
display_context_process:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x1C($sp)
    lw          $s1, 0x48($sp)
    sw          $s2, 0x20($sp)
    lhu         $s2, 0x4E($sp)
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $a1, $zero
    sw          $s4, 0x28($sp)
    addu        $s4, $a2, $zero
    sw          $s5, 0x2C($sp)
    sw          $ra, 0x30($sp)
    jal         func_8002CBD4
    addu        $s5, $a3, $zero
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    jal         func_8002CF48
    addu        $a0, $s2, $zero
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    addu        $a0, $s0, $zero
    addu        $a1, $s4, $zero
    addu        $a2, $s5, $zero
    andi        $s1, $s1, 0xFF
    addiu       $a3, $zero, 0xE
    jal         func_80042F50
    sw          $s1, 0x10($sp)
    lw          $t0, 0x0($s0)
    lw          $v1, 0x3C($s3)
    .word       0x00680018  # mult        $v1, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    sw          $t0, 0x0($s0)
    lw          $t0, 0x4($s0)
    lw          $v1, 0x3C($s3)
    .word       0x00680018  # mult        $v1, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    lw          $v1, 0x8($s0)
    sw          $t0, 0x4($s0)
    lw          $s3, 0x3C($s3)
    .word       0x02630018  # mult        $s3, $v1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    addu        $a0, $s0, $zero
    jal         func_8002DA14
    sw          $v1, 0x8($s0)
    addiu       $a0, $zero, 0x28F
    addiu       $a1, $zero, 0x28F
    jal         func_8002D8D0
    addiu       $a2, $zero, 0x28F
    lw          $a0, 0x14($s0)
    jal         func_8002D14C
    nop
    lw          $a0, 0x10($s0)
    jal         func_8002CF48
    nop
    lw          $a0, 0xC($s0)
    jal         func_8002CD44
    nop
    jal         func_8002D350
    nop
    jal         func_8002D398
    nop
    jal         func_8002D3E0
    nop
    lui         $s0, 0x8008
    lw          $s0, -0x5AA0($s0)
    addiu       $v0, $s0, 0x40
    lui         $at, 0x8008
    sw          $v0, -0x5AA0($at)
    jal         func_8002DEF4
    addu        $a0, $s0, $zero
    lui         $at, 0x8008
    sw          $s0, -0x564C($at)
    jal         func_8002CD28
    nop
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end display_context_process

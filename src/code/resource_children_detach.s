.text
.align 2
.set noreorder
.globl resource_children_detach
.ent resource_children_detach
resource_children_detach:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s1, 0x8($a0)
    lw          $a0, 0x18($s1)
    sh          $zero, 0xA($s1)
    lw          $v0, 0x8($a0)
    beqz        $v0, .L8001B368
    nop
.L8001B33C:
    lw          $s0, 0x8($a0)
    jal         func_8000D874
    addu        $a1, $s0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    jal         func_8000D834
    addu        $a1, $s0, $zero
    lw          $a0, 0x18($s1)
    lw          $v0, 0x8($a0)
    bnez        $v0, .L8001B33C
    nop
.L8001B368:
    lw          $v0, 0x24($s1)
    beqz        $v0, .L8001B3B0
    nop
    lw          $v0, 0x28($s1)
    lw          $a1, 0x0($v0)
    addu        $v0, $a1, $zero
    beqz        $v0, .L8001B3B0
    addiu       $a1, $a1, -0x1
.L8001B388:
    lw          $v0, 0x24($s1)
    addu        $a0, $a1, $zero
    addu        $v0, $a1, $v0
    sb          $zero, 0x1($v0)
    lw          $v1, 0x28($s1)
    sll         $v0, $a1, 2
    addiu       $a1, $a1, -0x1
    addu        $v0, $v0, $v1
    bnez        $a0, .L8001B388
    sw          $zero, 0x4($v0)
.L8001B3B0:
    lw          $v0, 0x20($s1)
    beqz        $v0, .L8001B3F8
    nop
    lw          $v0, 0x2C($s1)
    lw          $a1, 0x0($v0)
    addu        $v0, $a1, $zero
    beqz        $v0, .L8001B3F8
    addiu       $a1, $a1, -0x1
.L8001B3D0:
    lw          $v0, 0x20($s1)
    addu        $a0, $a1, $zero
    addu        $v0, $a1, $v0
    sb          $zero, 0x1($v0)
    lw          $v1, 0x2C($s1)
    sll         $v0, $a1, 2
    addiu       $a1, $a1, -0x1
    addu        $v0, $v0, $v1
    bnez        $a0, .L8001B3D0
    sw          $zero, 0x4($v0)
.L8001B3F8:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end resource_children_detach

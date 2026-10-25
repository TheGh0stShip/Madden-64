.text
.align 2
.set noreorder
.globl interface_runtime_process
.ent interface_runtime_process
interface_runtime_process:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    lw          $v1, 0x48($a2)
    beqz        $v1, .L80040A70
    addiu       $v1, $v1, -0x1
    lw          $v0, 0x0($a2)
    lw          $a0, 0x24($a2)
    sw          $v1, 0x48($a2)
    addu        $v0, $v0, $a0
    j .L80040BF4
    sw          $v0, 0x0($a2)
.L80040A70:
    lw          $a3, 0x0($a1)
    sll         $v0, $a3, 1
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
    addu        $t0, $v0, $zero
    andi        $v1, $v0, 0xF000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80040BF4
    slti        $v0, $v1, 0x4001
    beqz        $v0, .L80040AD4
    addiu       $v0, $zero, 0x1000
    beq         $v1, $v0, .L80040BB4
    slti        $v0, $v1, 0x1001
    beql        $v0, $zero, .L80040ABC
    addiu       $v0, $zero, 0x2000
    beqz        $v1, .L80040B1C
    andi        $a0, $t0, 0xFFF
    j .L80040BF4
    nop
.L80040ABC:
    beq         $v1, $v0, .L80040BD0
    addiu       $v0, $zero, 0x3000
    beq         $v1, $v0, .L80040BE8
    nop
    j .L80040BF4
    nop
.L80040AD4:
    addiu       $v0, $zero, 0x7000
    beq         $v1, $v0, .L80040B34
    slti        $v0, $v1, 0x7001
    beqz        $v0, .L80040B00
    addiu       $v0, $zero, 0x5000
    beq         $v1, $v0, .L80040BE8
    addiu       $v0, $zero, 0x6000
    beq         $v1, $v0, .L80040BE8
    nop
    j .L80040BF4
    nop
.L80040B00:
    ori         $v0, $zero, 0x8000
    beq         $v1, $v0, .L80040B7C
    ori         $v0, $zero, 0x9000
    beq         $v1, $v0, .L80040B5C
    addiu       $v0, $a3, 0x1
    j .L80040BF4
    nop
.L80040B1C:
    lw          $v0, 0x0($a2)
    sll         $a0, $a0, 12
    sw          $a0, 0x24($a2)
    addu        $v0, $v0, $a0
    j .L80040BE8
    sw          $v0, 0x0($a2)
.L80040B34:
    andi        $a0, $t0, 0xFFF
    lui         $at, 0x8008
    sw          $a0, 0x7920($at)
.L80040B40:
    lw          $v0, 0x0($a2)
    sll         $a0, $a0, 12
    negu        $v1, $a0
    sw          $v1, 0x24($a2)
    addu        $v0, $v0, $v1
    j .L80040BE8
    sw          $v0, 0x0($a2)
.L80040B5C:
    sw          $v0, 0x0($a1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
    andi        $a0, $t0, 0xFFF
    sll         $v0, $v0, 12
    j .L80040B40
    addu        $a0, $a0, $v0
.L80040B7C:
    addiu       $v0, $a3, 0x1
    sw          $v0, 0x0($a1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
    andi        $a0, $t0, 0xFFF
    lw          $v1, 0x0($a2)
    sll         $v0, $v0, 12
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 12
    addu        $v1, $v1, $a0
    sw          $a0, 0x24($a2)
    j .L80040BE8
    sw          $v1, 0x0($a2)
.L80040BB4:
    lw          $v1, 0x0($a2)
    lw          $a0, 0x24($a2)
    andi        $v0, $t0, 0xFFF
    sw          $v0, 0x48($a2)
    addu        $v1, $v1, $a0
    j .L80040BE8
    sw          $v1, 0x0($a2)
.L80040BD0:
    lw          $v0, 0x6C($a2)
    sw          $v0, 0x0($a2)
    jal         func_80040A44
    sw          $zero, 0x0($a1)
    j .L80040BF4
    nop
.L80040BE8:
    lw          $v0, 0x0($a1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($a1)
.L80040BF4:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end interface_runtime_process

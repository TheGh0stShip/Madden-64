.text
.align 2
.set noreorder
.globl interface_runtime_prepare
.ent interface_runtime_prepare
interface_runtime_prepare:
    addiu       $sp, $sp, -0x20
    addu        $t0, $a0, $zero
    beqz        $t0, .L80040F50
    sw          $ra, 0x18($sp)
    lw          $v1, 0x48($a2)
    beqz        $v1, .L80040D40
    addiu       $v1, $v1, -0x1
    lw          $v0, 0x0($a2)
    lw          $a0, 0x24($a2)
    sw          $v1, 0x48($a2)
    addu        $v0, $v0, $a0
    j .L80040F50
    sw          $v0, 0x0($a2)
.L80040D40:
    lw          $t1, 0x0($a1)
    sll         $v0, $t1, 1
    addu        $v0, $v0, $t0
    lh          $v0, 0x0($v0)
    addu        $a3, $v0, $zero
    andi        $v1, $v0, 0xF000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80040F28
    slti        $v0, $v1, 0x4001
    beqz        $v0, .L80040DA4
    addiu       $v0, $zero, 0x1000
    beq         $v1, $v0, .L80040EF0
    slti        $v0, $v1, 0x1001
    beql        $v0, $zero, .L80040D8C
    addiu       $v0, $zero, 0x2000
    beqz        $v1, .L80040DF0
    lui         $v1, 0x1062
    j .L80040F50
    nop
.L80040D8C:
    beq         $v1, $v0, .L80040F0C
    addiu       $v0, $zero, 0x3000
    beq         $v1, $v0, .L80040F44
    nop
    j .L80040F50
    nop
.L80040DA4:
    addiu       $v0, $zero, 0x7000
    beql        $v1, $v0, .L80040E24
    lui         $v1, 0x1062
    slti        $v0, $v1, 0x7001
    beqz        $v0, .L80040DD4
    addiu       $v0, $zero, 0x5000
    beq         $v1, $v0, .L80040F44
    addiu       $v0, $zero, 0x6000
    beq         $v1, $v0, .L80040F44
    nop
    j .L80040F50
    nop
.L80040DD4:
    ori         $v0, $zero, 0x8000
    beq         $v1, $v0, .L80040E8C
    ori         $v0, $zero, 0x9000
    beq         $v1, $v0, .L80040E38
    andi        $a0, $a3, 0xFFF
    j .L80040F50
    nop
.L80040DF0:
    ori         $v1, $v1, 0x4DD3
    andi        $v0, $a3, 0xFFF
    sll         $v0, $v0, 16
.L80040DFC:
    .word       0x00430018  # mult        $v0, $v1
    lw          $a0, 0x0($a2)
    sra         $v0, $v0, 31
    .word       0x00005010  # mfhi        $t2
    sra         $v1, $t2, 6
    subu        $v1, $v1, $v0
    addu        $a0, $a0, $v1
    sw          $v1, 0x24($a2)
    j .L80040F44
    sw          $a0, 0x0($a2)
.L80040E24:
    ori         $v1, $v1, 0x4DD3
    andi        $v0, $a3, 0xFFF
    sll         $v0, $v0, 16
    j .L80040DFC
    negu        $v0, $v0
.L80040E38:
    addiu       $v0, $t1, 0x1
    sw          $v0, 0x0($a1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    lh          $v0, 0x0($v0)
    lui         $v1, 0x1062
    ori         $v1, $v1, 0x4DD3
    sll         $v0, $v0, 12
    addu        $a0, $a0, $v0
    sll         $v0, $a0, 16
    .word       0x00430018  # mult        $v0, $v1
    sra         $v0, $v0, 31
    lw          $v1, 0x0($a2)
    .word       0x00005010  # mfhi        $t2
    sra         $a0, $t2, 6
    subu        $a0, $a0, $v0
    negu        $v0, $a0
    addu        $v1, $v1, $v0
    sw          $v0, 0x24($a2)
    j .L80040F44
    sw          $v1, 0x0($a2)
.L80040E8C:
    andi        $a0, $a3, 0xFFF
    andi        $v0, $a0, 0x800
    beqz        $v0, .L80040EA0
    addiu       $v0, $zero, -0x800
    or          $a0, $a0, $v0
.L80040EA0:
    addiu       $v0, $t1, 0x1
    sw          $v0, 0x0($a1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    lh          $v0, 0x0($v0)
    lui         $v1, 0x1062
    ori         $v1, $v1, 0x4DD3
    sll         $v0, $v0, 12
    addu        $a0, $a0, $v0
    sll         $v0, $a0, 16
    .word       0x00430018  # mult        $v0, $v1
    lw          $v1, 0x0($a2)
    sra         $v0, $v0, 31
    .word       0x00005010  # mfhi        $t2
    sra         $a0, $t2, 6
    subu        $a0, $a0, $v0
    addu        $v1, $v1, $a0
    sw          $a0, 0x24($a2)
    j .L80040F44
    sw          $v1, 0x0($a2)
.L80040EF0:
    lw          $v1, 0x0($a2)
    lw          $a0, 0x24($a2)
    andi        $v0, $a3, 0xFFF
    sw          $v0, 0x48($a2)
    addu        $v1, $v1, $a0
    j .L80040F44
    sw          $v1, 0x0($a2)
.L80040F0C:
    sw          $zero, 0x0($a1)
    lw          $v0, 0x6C($a2)
    addu        $a0, $t0, $zero
    jal         func_80040D0C
    sw          $v0, 0x0($a2)
    j .L80040F50
    nop
.L80040F28:
    addu        $a0, $t0, $zero
    andi        $v0, $a3, 0xFFF
    sw          $v0, 0x48($a2)
    jal         func_80040C04
    sw          $v0, 0x0($a1)
    j .L80040F50
    nop
.L80040F44:
    lw          $v0, 0x0($a1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($a1)
.L80040F50:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end interface_runtime_prepare

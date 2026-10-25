.text
.align 2
.set noreorder
.globl gameplay_interface_configure
.ent gameplay_interface_configure
gameplay_interface_configure:
    addiu       $sp, $sp, -0x40
    sw          $s6, 0x30($sp)
    addu        $s6, $a0, $zero
    sw          $a1, 0x14($sp)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    sll         $v1, $s6, 5
    addu        $v1, $v1, $s6
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s6
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s6
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s6
    sll         $v1, $v1, 2
    addu        $v0, $v0, $v1
    sw          $ra, 0x3C($sp)
    sw          $fp, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    andi        $v0, $v0, 0x3F
    bnez        $v0, .L8002B240
    slti        $v0, $v0, 0xA
    j .L8002B24C
    addu        $a0, $zero, $zero
.L8002B240:
    beqz        $v0, .L8002B24C
    addiu       $a0, $zero, 0x2
    addiu       $a0, $zero, 0x1
.L8002B24C:
    addu        $fp, $zero, $zero
    andi        $s5, $s6, 0xFFFF
    lhu         $s4, 0x16($sp)
    addu        $s3, $a2, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x451C
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 1
    addu        $s7, $v0, $v1
.L8002B274:
    lhu         $a2, 0x0($s7)
    addiu       $v0, $zero, 0x7FFF
    beql        $a2, $v0, .L8002B300
    addiu       $s3, $s3, 0x2
    addiu       $v0, $zero, 0xF
    beq         $a2, $v0, .L8002B2A4
    addu        $a0, $s5, $zero
    lhu         $a1, 0x16($sp)
    jal         func_80023C60
    andi        $a0, $s6, 0xFFFF
    j .L8002B2FC
    sh          $v0, 0x0($s3)
.L8002B2A4:
    addu        $a1, $s4, $zero
    jal         func_80023C60
    addiu       $a2, $zero, 0xF
    addu        $a0, $s5, $zero
    addu        $a1, $s4, $zero
    addiu       $a2, $zero, 0xB
    jal         func_80023C60
    addu        $s1, $v0, $zero
    addu        $a0, $s5, $zero
    addu        $a1, $s4, $zero
    addiu       $a2, $zero, 0x23
    jal         func_80023C60
    addu        $s2, $v0, $zero
    addu        $a0, $s5, $zero
    addu        $a1, $s4, $zero
    addiu       $a2, $zero, 0x26
    jal         func_80023C60
    addu        $s0, $v0, $zero
    addu        $s1, $s1, $s2
    addu        $s0, $s0, $s1
    addu        $v0, $v0, $s0
    sh          $v0, 0x0($s3)
.L8002B2FC:
    addiu       $s3, $s3, 0x2
.L8002B300:
    addiu       $fp, $fp, 0x1
    slti        $v0, $fp, 0x5
    bnez        $v0, .L8002B274
    addiu       $s7, $s7, 0x2
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end gameplay_interface_configure

.text
.align 2
.set noreorder
.globl gameplay_state_render
.ent gameplay_state_render
gameplay_state_render:
    addiu       $sp, $sp, -0x50
    sw          $s2, 0x30($sp)
    addu        $s2, $zero, $zero
    addiu       $t2, $zero, 0xA
    addiu       $t1, $zero, 0x5
    addiu       $t0, $zero, 0xE
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1876
    addiu       $t3, $a3, 0x214C
    sw          $ra, 0x4C($sp)
    sw          $fp, 0x48($sp)
    sw          $s7, 0x44($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    addu        $s3, $zero, $zero
.L80025198:
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    addu        $a2, $v0, $a3
    addu        $a1, $v0, $t3
    sll         $v0, $s3, 16
.L800251C0:
    sra         $v1, $v0, 16
    beq         $v1, $t2, .L8002521C
    addiu       $v0, $s3, 0x1
    slti        $v0, $v1, 0xB
    beqz        $v0, .L800251E8
    nop
    beq         $v1, $t1, .L8002521C
    addiu       $v0, $s3, 0x1
    j .L800251F4
    sll         $v0, $s3, 16
.L800251E8:
    beq         $v1, $t0, .L8002521C
    addiu       $v0, $s3, 0x1
    sll         $v0, $s3, 16
.L800251F4:
    sra         $a0, $v0, 15
    addu        $v1, $a0, $a2
    lh          $v0, 0x0($v1)
    bltzl       $v0, .L80025208
    sh          $zero, 0x0($v1)
.L80025208:
    addu        $v1, $a0, $a1
    lh          $v0, 0x0($v1)
    bltzl       $v0, .L80025218
    sh          $zero, 0x0($v1)
.L80025218:
    addiu       $v0, $s3, 0x1
.L8002521C:
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2F
    bnez        $v0, .L800251C0
    sll         $v0, $s3, 16
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L80025198
    addu        $s3, $zero, $zero
    jal         func_80024694
    addu        $s2, $zero, $zero
    ori         $s5, $zero, 0xFFFF
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0xCFC
    addiu       $s4, $s3, 0xB7A
    sll         $v0, $s2, 16
.L8002526C:
    sra         $s0, $v0, 16
    sll         $s1, $s0, 1
    addu        $v0, $s1, $s3
    lhu         $a0, 0x0($v0)
    beq         $a0, $s5, .L800252C4
    addiu       $v0, $s2, 0x1
    jal         func_8002C304
    nop
    addu        $a1, $s1, $s0
    sll         $a1, $a1, 4
    subu        $a1, $a1, $s0
    sll         $a1, $a1, 1
    addu        $a1, $a1, $s4
    andi        $v0, $v0, 0xFFFF
    sll         $a0, $v0, 1
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    jal         func_80028234
    addu        $a0, $v1, $a0
    addiu       $v0, $s2, 0x1
.L800252C4:
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L8002526C
    sll         $v0, $s2, 16
    addu        $s2, $zero, $zero
    ori         $s5, $zero, 0xFFFF
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x2E48
    addiu       $s4, $s3, 0xB7A
    sll         $v0, $s2, 16
.L800252F4:
    sra         $s0, $v0, 16
    sll         $s1, $s0, 1
    addu        $v0, $s1, $s3
    lhu         $a0, 0x0($v0)
    beq         $a0, $s5, .L8002534C
    addiu       $v0, $s2, 0x1
    jal         func_8002C304
    nop
    addu        $a1, $s1, $s0
    sll         $a1, $a1, 4
    subu        $a1, $a1, $s0
    sll         $a1, $a1, 1
    addu        $a1, $a1, $s4
    andi        $v0, $v0, 0xFFFF
    sll         $a0, $v0, 1
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    jal         func_80028234
    addu        $a0, $v1, $a0
    addiu       $v0, $s2, 0x1
.L8002534C:
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L800252F4
    sll         $v0, $s2, 16
    jal         func_8002C108
    addu        $a0, $zero, $zero
    jal         func_8002C108
    addiu       $a0, $zero, 0x1
    addu        $s3, $zero, $zero
    lui         $s7, 0x8008
    addiu       $s7, $s7, 0xCFC
    sll         $v1, $s3, 16
.L80025384:
    sra         $v1, $v1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xC90($at)
    addu        $s2, $zero, $zero
    addu        $s5, $v0, $zero
    jal         func_80028A58
    addu        $s6, $s5, $s7
    andi        $s4, $v0, 0xFFFF
    sll         $v0, $s2, 16
.L800253D0:
    sra         $v0, $v0, 16
    sll         $s0, $v0, 1
    addu        $s1, $s0, $s6
    lhu         $a1, 0x0($s1)
    ori         $fp, $zero, 0xFFFF
    beql        $a1, $fp, .L80025478
    addiu       $v0, $s2, 0x1
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 4
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 1
    addu        $s0, $s0, $s5
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v0, 0x18BA($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a3, 0x18B8($at)
    sw          $v0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v0, 0x18BC($at)
    addu        $a0, $s4, $zero
    addiu       $a2, $zero, 0x21
    jal         func_80028518
    sw          $v0, 0x14($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v0, 0x18C0($at)
    lhu         $a1, 0x0($s1)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $a3, 0x18BE($at)
    sw          $v0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lh          $v0, 0x18C2($at)
    addu        $a0, $s4, $zero
    addiu       $a2, $zero, 0x24
    jal         func_80028518
    sw          $v0, 0x14($sp)
    addiu       $v0, $s2, 0x1
.L80025478:
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L800253D0
    sll         $v0, $s2, 16
    addiu       $v0, $s3, 0x1
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80025384
    sll         $v1, $s3, 16
    lui         $v1, 0x8007
    lhu         $v1, -0x4628($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8002574C
    nop
    lui         $at, 0x8007
    sh          $zero, -0x4628($at)
    jal         func_8002A9B4
    addu        $s5, $zero, $zero
    jal         func_8002AA8C
    addu        $s6, $v0, $zero
    andi        $s0, $s6, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80024B90
    addu        $s7, $v0, $zero
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0xC90
    lbu         $v1, 0x0($s1)
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFF
    xor         $v0, $v0, $v1
    jal         func_80024BD4
    sltu        $s3, $zero, $v0
    addu        $a0, $s3, $zero
    jal         func_8002A358
    andi        $a1, $v0, 0xFF
    andi        $s0, $s7, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_80024B90
    sw          $v0, 0x1C($sp)
    lbu         $v1, 0x0($s1)
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFF
    xor         $v0, $v0, $v1
    jal         func_80024BD4
    sltu        $s4, $zero, $v0
    addu        $a0, $s4, $zero
    jal         func_8002A358
    andi        $a1, $v0, 0xFF
    lui         $v1, 0x800C
    addiu       $v1, $v1, 0x509C
    lb          $s1, 0x0($v1)
    sll         $a0, $s1, 1
    addu        $v1, $v1, $a0
    lhu         $v1, 0x9C4($v1)
    addu        $s0, $zero, $zero
    bne         $v1, $fp, .L80025574
    sw          $v0, 0x24($sp)
    j .L800255A4
    addiu       $s0, $zero, 0x1
.L80025574:
    lui         $v0, 0x800C
    lhu         $v0, 0x5A82($v0)
    lw          $t4, 0x1C($sp)
    sltu        $v0, $v0, $t4
    bnel        $v0, $zero, .L8002558C
    addiu       $s0, $zero, 0x1
.L8002558C:
    lui         $v0, 0x800C
    lhu         $v0, 0x5B6C($v0)
    lw          $t4, 0x24($sp)
    sltu        $v0, $v0, $t4
    beqz        $v0, .L800255AC
    addiu       $v0, $zero, 0x1
.L800255A4:
    addiu       $s5, $zero, 0x1
    addiu       $v0, $zero, 0x1
.L800255AC:
    bne         $s0, $v0, .L80025678
    addiu       $v0, $zero, 0x1
    addu        $s2, $zero, $zero
    sll         $v0, $s1, 1
    lui         $at, 0x800C
    addu        $at, $at, $v0
    sh          $s6, 0x5A60($at)
    sll         $v0, $s3, 5
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xC90($at)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    addu        $v1, $v0, $v1
    lui         $at, 0x800C
    addu        $at, $at, $s1
    sb          $a0, 0x5B38($at)
    lhu         $t4, 0x1E($sp)
    lui         $at, 0x800C
    sh          $t4, 0x5A82($at)
    sll         $v0, $s2, 16
.L80025620:
    sra         $v0, $v0, 15
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    beq         $v0, $s6, .L8002564C
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L80025620
    sll         $v0, $s2, 16
.L8002564C:
    addu        $a0, $s3, $zero
    sll         $a1, $s2, 16
    sra         $a1, $a1, 16
    sll         $a2, $s1, 2
    addu        $a2, $a2, $s1
    sll         $a2, $a2, 1
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x5A84
    jal         func_8002B1B8
    addu        $a2, $a2, $v0
    addiu       $v0, $zero, 0x1
.L80025678:
    bne         $s5, $v0, .L80025744
    addiu       $v0, $zero, 0x1
    addu        $s2, $zero, $zero
    sll         $v0, $s1, 1
    lui         $at, 0x800C
    addu        $at, $at, $v0
    sh          $s7, 0x5B4A($at)
    sll         $v0, $s4, 5
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xC90($at)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    addu        $v1, $v0, $v1
    lui         $at, 0x800C
    addu        $at, $at, $s1
    sb          $a0, 0x5C22($at)
    lhu         $t4, 0x26($sp)
    lui         $at, 0x800C
    sh          $t4, 0x5B6C($at)
    sll         $v0, $s2, 16
.L800256EC:
    sra         $v0, $v0, 15
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    beq         $v0, $s7, .L80025718
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L800256EC
    sll         $v0, $s2, 16
.L80025718:
    addu        $a0, $s4, $zero
    sll         $a1, $s2, 16
    sra         $a1, $a1, 16
    sll         $a2, $s1, 2
    addu        $a2, $a2, $s1
    sll         $a2, $a2, 1
    lui         $v0, 0x800C
    addiu       $v0, $v0, 0x5B6E
    jal         func_8002B1B8
    addu        $a2, $a2, $v0
    addiu       $v0, $zero, 0x1
.L80025744:
    lui         $at, 0x8007
    sh          $v0, -0x4628($at)
.L8002574C:
    jal         func_80024E9C
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x55D4($at)
    lw          $ra, 0x4C($sp)
    lw          $fp, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end gameplay_state_render

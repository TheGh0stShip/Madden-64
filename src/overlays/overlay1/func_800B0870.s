.text
.align 2
.set noreorder
.globl func_800B0870
.ent func_800B0870
func_800B0870:
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x57E8($v1)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x21C8
    addu        $a0, $s2, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    addiu       $v0, $zero, 0x68
    lbu         $s4, 0x1E($v1)
    beq         $a0, $v0, .L800B0C34
    nop
    lw          $a1, 0x0($s0)
    jal         func_800AD3A8
    nop
    j           func_800AC510
    nop
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x21A8
    j           func_800AC510
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x57E2
    lh          $a0, 0x0($s0)
    jal         func_800AD184
    nop
    addiu       $a0, $zero, 0x2
    lui         $a3, 0x8008
    lw          $a3, 0x57E4($a3)
    lui         $v1, 0x8008
    lw          $v1, 0x57E8($v1)
    addiu       $a1, $zero, 0x1
    addu        $a2, $s0, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    jal         func_800B7DD8
    sw          $v1, 0x10($sp)
    lh          $v0, 0x0($s0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2488
    bgtz        $v0, .L800B0940
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x57E8($a0)
    beqz        $a0, .L800B0940
    nop
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2474
    jal         func_800AD124
    nop
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
.L800B0940:
    lui         $v0, 0x8009
    lbu         $v0, -0x5090($v0)
    bnez        $v0, .L800B0998
    addu        $a0, $s2, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x57E2
    lhu         $v0, 0x0($s0)
    addiu       $v0, $v0, 0x2F
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x40
    beqz        $v0, .L800B0978
    addiu       $a0, $zero, 0x1E
    jal         func_80041BDC
    addiu       $a1, $zero, 0x1E
.L800B0978:
    lh          $v0, 0x0($s0)
    slti        $v0, $v0, 0xA1
    bnez        $v0, .L800B0998
    addu        $a0, $s2, $zero
    addiu       $a0, $zero, 0xD
    jal         func_80041BDC
    addiu       $a1, $zero, 0x28
    addu        $a0, $s2, $zero
.L800B0998:
    addiu       $v0, $zero, 0x68
    beq         $a0, $v0, .L800B0C34
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x57E4($a1)
    jal         func_800AD3A8
    nop
    j           func_800AC510
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x57E2
    lh          $a0, 0x0($s0)
    jal         func_800AD184
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x57E8($a0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2454
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    jal         func_800AD124
    nop
    addiu       $a0, $zero, 0x2
    lui         $a3, 0x8008
    lw          $a3, 0x57E4($a3)
    lui         $v1, 0x8008
    lw          $v1, 0x57E8($v1)
    addiu       $a1, $zero, 0x2
    addu        $a2, $s0, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    jal         func_800B7DD8
    sw          $v1, 0x10($sp)
    addu        $s0, $s2, $zero
    addiu       $v0, $zero, 0x68
    beq         $s0, $v0, .L800B0C34
    nop
    jal         func_80031964
    nop
    andi        $v0, $v0, 0x400
    beqz        $v0, .L800B0A50
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x57E4($a1)
    j           func_800AC334
    nop
.L800B0A50:
    lui         $a1, 0x8008
    lw          $a1, 0x57E8($a1)
    jal         func_800AD3A8
    addu        $a0, $s0, $zero
    j           func_800AC510
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x78EC($a0)
    beql        $a0, $zero, .L800B0A98
    addiu       $a0, $zero, 0x2
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x241C
    jal         func_800AD124
    nop
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    j           func_800AC37C
    addiu       $a0, $zero, 0x2
.L800B0A98:
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2438
    lui         $a2, 0x8009
    lw          $a2, -0x78EC($a2)
    addiu       $a1, $zero, 0x3
    addu        $a3, $zero, $zero
    jal         func_800B7DD8
    sw          $zero, 0x10($sp)
    j           func_800AC510
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x57E2($a0)
    jal         func_800AD36C
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6BF2
    lh          $v1, 0x0($s0)
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    addiu       $v0, $zero, 0x7FFF
    bne         $v1, $v0, .L800B0B00
    addiu       $v0, $zero, 0x7FFE
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2384
    j           func_800AC4A4
    nop
.L800B0B00:
    bne         $v1, $v0, .L800B0B18
    nop
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x2384
    j           func_800AC4C4
    nop
.L800B0B18:
    lui         $a0, 0x8008
    lw          $a0, 0x57E8($a0)
    jal         func_800AD124
    nop
    lh          $a0, 0x0($s0)
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    jal         func_800AD184
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x57E8($v1)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x23A8
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    lbu         $s4, 0x1E($v1)
    j           func_800AC510
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x57E2($a0)
    jal         func_800AD36C
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6BF2
    lh          $v1, 0x0($s0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x22F8
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    addiu       $v0, $zero, 0x7FFF
    bne         $v1, $v0, .L800B0BE0
    addiu       $v0, $zero, 0x7FFE
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x400
    and         $v0, $v0, $v1
    beqz        $v0, .L800B0BC8
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2530
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC510
    nop
.L800B0BC8:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2088
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC510
    nop
.L800B0BE0:
    bne         $v1, $v0, .L800B0C00
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x2080
    lui         $at, 0x8007
    sw          $v0, -0x4660($at)
    j           func_800AC510
    nop
.L800B0C00:
    lui         $a0, 0x8008
    lw          $a0, 0x57E8($a0)
    jal         func_800AD124
    nop
    lh          $a0, 0x0($s0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x232C
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    jal         func_800AD184
    nop
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
.L800B0C34:
    lui         $v1, 0x8008
    lh          $v1, 0x57E0($v1)
    addiu       $v0, $zero, 0xF
    bne         $v1, $v0, .L800B0C80
    addu        $s3, $zero, $zero
    jal         func_800AE680
    nop
    addu        $s3, $v0, $zero
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x1E54
    jal         func_800363F4
    addiu       $a1, $v0, 0x8
.L800B0C80:
    beqz        $s1, .L800B0CE4
    addiu       $v0, $zero, 0x60
    bne         $s2, $v0, .L800B0C94
    addiu       $a3, $zero, 0x96
    addiu       $a3, $zero, 0xB4
.L800B0C94:
    addu        $a0, $s1, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4674
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x46B8
    lui         $v0, 0x8009
    lh          $v0, -0x6A2E($v0)
    addu        $a2, $s0, $zero
    jal         func_8003DDF8
    sw          $v0, 0x10($sp)
    addu        $a0, $s2, $zero
    sll         $a1, $s4, 16
    sra         $a1, $a1, 16
    addu        $a2, $s0, $zero
    jal         func_800AEFF8
    addu        $a3, $s3, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
.L800B0CE4:
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_800AD5D0
    addu        $a3, $zero, $zero
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
.end func_800B0870

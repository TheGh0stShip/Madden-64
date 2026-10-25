.text
.align 2
.set noreorder
.globl gameplay_record_process
.ent gameplay_record_process
gameplay_record_process:
    addiu       $sp, $sp, -0x68
    sw          $s6, 0x58($sp)
    addu        $s6, $a0, $zero
    sw          $s4, 0x50($sp)
    addu        $s4, $zero, $zero
    andi        $v0, $s6, 0xFFFF
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sh          $a2, 0x1E($sp)
    lhu         $a2, 0x1E($sp)
    sll         $v1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xD6A
    sw          $s7, 0x5C($sp)
    addu        $s7, $v1, $v0
    sw          $s1, 0x44($sp)
    addu        $s1, $zero, $zero
    sh          $a1, 0x16($sp)
    lhu         $a1, 0x16($sp)
    addiu       $v0, $v0, -0x6E
    addu        $v1, $v1, $v0
    sw          $ra, 0x64($sp)
    sw          $fp, 0x60($sp)
    sw          $s5, 0x54($sp)
    sw          $s3, 0x4C($sp)
    sw          $s2, 0x48($sp)
    sw          $s0, 0x40($sp)
    andi        $a0, $s1, 0xFFFF
.L800238B0:
    sll         $v0, $a0, 1
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    beq         $v0, $a2, .L800238F4
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s7
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x3F
    beql        $a1, $v0, .L800238E0
    addiu       $s4, $s4, 0x1
.L800238E0:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800238B0
    andi        $a0, $s1, 0xFFFF
.L800238F4:
    sh          $s4, 0x26($sp)
    addu        $s4, $zero, $zero
    lhu         $v0, 0x16($sp)
    addu        $s1, $zero, $zero
    andi        $s2, $s6, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sltiu       $v0, $v0, 0xA
    xori        $v0, $v0, 0x1
    negu        $v0, $v0
    andi        $fp, $v0, 0x3
    sll         $v0, $s2, 5
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $s3, $v0, $v1
    andi        $s0, $s1, 0xFFFF
.L8002394C:
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beql        $v1, $v0, .L800239E8
    addiu       $s1, $s1, 0x1
    lhu         $v0, 0x1E($sp)
    beq         $v1, $v0, .L800239E4
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s7
    lbu         $v0, 0xE($v0)
    lhu         $v1, 0x16($sp)
    andi        $v0, $v0, 0x3F
    bnel        $v1, $v0, .L800239E8
    addiu       $s1, $s1, 0x1
    lhu         $v0, 0x26($sp)
    addiu       $s4, $s4, 0x1
    andi        $v1, $s4, 0xFFFF
    sltu        $v0, $v0, $v1
    beqz        $v0, .L800239E4
    sll         $a0, $s6, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beqz        $v0, .L800239E4
    addu        $a0, $s2, $zero
    addu        $a1, $s0, $zero
    jal         func_8002209C
    andi        $a2, $fp, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    beq         $v0, $v1, .L80023C2C
    addu        $v0, $s0, $zero
.L800239E4:
    addiu       $s1, $s1, 0x1
.L800239E8:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnel        $v0, $zero, .L8002394C
    andi        $s0, $s1, 0xFFFF
    lhu         $v0, 0x16($sp)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s3, -0x55A8($at)
    lbu         $v1, 0x0($s3)
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L80023B24
    andi        $s2, $s6, 0xFFFF
    sll         $v0, $s2, 5
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    sw          $v0, 0x34($sp)
.L80023A30:
    lw          $a3, 0x34($sp)
    addu        $s1, $zero, $zero
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sll         $v0, $a3, 2
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $s5, $v0, $v1
    andi        $s0, $s1, 0xFFFF
.L80023A5C:
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s5
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beql        $v1, $v0, .L80023B00
    addiu       $s1, $s1, 0x1
    lhu         $v0, 0x1E($sp)
    beq         $v1, $v0, .L80023AFC
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s7
    lbu         $v0, 0xE($v0)
    lbu         $v1, 0x0($s3)
    andi        $v0, $v0, 0x3F
    bnel        $v1, $v0, .L80023B00
    addiu       $s1, $s1, 0x1
    lhu         $v0, 0x26($sp)
    addiu       $s4, $s4, 0x1
    andi        $v1, $s4, 0xFFFF
    sltu        $v0, $v0, $v1
    beqz        $v0, .L80023AFC
    sll         $a0, $s6, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beqz        $v0, .L80023AFC
    addu        $a0, $s2, $zero
    addu        $a1, $s0, $zero
    jal         func_8002209C
    andi        $a2, $fp, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bne         $v0, $v1, .L80023B00
    addiu       $s1, $s1, 0x1
    j .L80023C2C
    addu        $v0, $s0, $zero
.L80023AFC:
    addiu       $s1, $s1, 0x1
.L80023B00:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80023A5C
    andi        $s0, $s1, 0xFFFF
    addiu       $s3, $s3, 0x1
    lbu         $v1, 0x0($s3)
    addiu       $v0, $zero, 0xFF
    bne         $v1, $v0, .L80023A30
    nop
.L80023B24:
    lhu         $v0, 0x16($sp)
    addu        $s4, $zero, $zero
    addu        $s5, $zero, $zero
    addu        $s1, $zero, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, -0x5544($at)
    andi        $s2, $s6, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sh          $v0, 0x2E($sp)
    sll         $v0, $s2, 5
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $v0, 0x3C($sp)
.L80023B7C:
    lw          $a3, 0x3C($sp)
    andi        $s0, $s1, 0xFFFF
    sll         $v0, $s0, 1
    addu        $v0, $v0, $a3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beql        $v1, $v0, .L80023C1C
    addiu       $s1, $s1, 0x1
    lhu         $v0, 0x1E($sp)
    beq         $v1, $v0, .L80023C18
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $s7, $v0
    addiu       $s3, $v0, 0xF
    sll         $a0, $s6, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beqz        $v0, .L80023C18
    addu        $a0, $s2, $zero
    addu        $a1, $s0, $zero
    jal         func_8002209C
    andi        $a2, $fp, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L80023C1C
    addiu       $s1, $s1, 0x1
    lhu         $a3, 0x2E($sp)
    addu        $v0, $a3, $s3
    lbu         $v1, 0x0($v0)
    sltu        $v0, $s4, $v1
    beql        $v0, $zero, .L80023C1C
    addiu       $s1, $s1, 0x1
    addu        $s4, $v1, $zero
    addu        $s5, $s1, $zero
.L80023C18:
    addiu       $s1, $s1, 0x1
.L80023C1C:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80023B7C
    andi        $v0, $s5, 0xFFFF
.L80023C2C:
    lw          $ra, 0x64($sp)
    lw          $fp, 0x60($sp)
    lw          $s7, 0x5C($sp)
    lw          $s6, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end gameplay_record_process

.text
.align 2
.set noreorder
.globl gameplay_roster_update
.ent gameplay_roster_update
gameplay_roster_update:
    addiu       $sp, $sp, -0x90
    sw          $s1, 0x6C($sp)
    sh          $a1, 0x16($sp)
    lhu         $s1, 0x16($sp)
    sw          $fp, 0x88($sp)
    addu        $fp, $a0, $zero
    sw          $s2, 0x70($sp)
    addu        $s2, $zero, $zero
    sw          $s0, 0x68($sp)
    andi        $s0, $a2, 0xFFFF
    addu        $a1, $s0, $zero
    sw          $ra, 0x8C($sp)
    sw          $s7, 0x84($sp)
    sw          $s6, 0x80($sp)
    sw          $s5, 0x7C($sp)
    sw          $s4, 0x78($sp)
    sw          $s3, 0x74($sp)
    jal         func_8003C6B4
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    jal         func_8003C708
    sh          $v0, 0x1E($sp)
    andi        $v0, $v0, 0xFF
    andi        $a0, $fp, 0xFFFF
    sh          $v0, 0x26($sp)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xD6A
    addu        $a3, $v0, $v1
    addu        $s1, $zero, $zero
    addu        $s7, $a0, $zero
    addu        $s4, $v0, $zero
    lhu         $s6, 0x1E($sp)
    lhu         $s5, 0x26($sp)
    addiu       $v1, $v1, -0x6E
    addu        $v1, $s4, $v1
    sw          $a3, 0x34($sp)
    sw          $v1, 0x3C($sp)
.L80022F34:
    lw          $a3, 0x3C($sp)
    andi        $s0, $s1, 0xFFFF
    sll         $s3, $s0, 1
    addu        $v0, $s3, $a3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L80023160
    addiu       $v0, $zero, 0x17
    beq         $s6, $v0, .L80022F6C
    addiu       $v0, $zero, 0x18
    beq         $s6, $v0, .L80023018
    sll         $v0, $s0, 2
    j .L800230C0
    addu        $v0, $v0, $s0
.L80022F6C:
    sll         $v0, $s0, 2
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x80
    beql        $v0, $zero, .L80023164
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s5, $v0
    beqz        $v0, .L80023160
    addu        $a0, $s7, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L80023164
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L80023164
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    addu        $v0, $s3, $s0
    addu        $v0, $v0, $s4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    beqz        $v0, .L80023164
    addiu       $s1, $s1, 0x1
    j .L800237F4
    addu        $v0, $s0, $zero
.L80023018:
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x40
    beql        $v0, $zero, .L80023164
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s5, $v0
    beqz        $v0, .L80023160
    addu        $a0, $s7, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L80023164
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L80023164
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    addu        $v0, $s3, $s0
    addu        $v0, $v0, $s4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    beqz        $v0, .L80023164
    addiu       $s1, $s1, 0x1
    j .L800237F4
    addu        $v0, $s0, $zero
.L800230C0:
    lw          $a3, 0x34($sp)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x3F
    bnel        $s6, $v0, .L80023164
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s5, $v0
    beqz        $v0, .L80023160
    addu        $a0, $s7, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L80023164
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L80023164
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    addu        $v0, $v0, $s4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    bnez        $v0, .L800237F4
    addu        $v0, $s0, $zero
.L80023160:
    addiu       $s1, $s1, 0x1
.L80023164:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80022F34
    nop
    lhu         $a3, 0x1E($sp)
    sll         $v0, $a3, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s5, -0x55A8($at)
    addiu       $v0, $a3, -0x17
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800231A0
    nop
    addiu       $a3, $zero, 0x4
    sh          $a3, 0x26($sp)
.L800231A0:
    lbu         $v1, 0x0($s5)
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L8002344C
    andi        $s4, $fp, 0xFFFF
    sll         $v0, $s4, 5
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sw          $v0, 0x44($sp)
.L800231C4:
    lw          $a3, 0x44($sp)
    addu        $s1, $zero, $zero
    lhu         $s7, 0x26($sp)
    sll         $v0, $a3, 2
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $s6, $v0, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    addu        $v0, $s6, $v0
    sw          $v0, 0x4C($sp)
.L800231F4:
    lw          $a3, 0x4C($sp)
    andi        $s0, $s1, 0xFFFF
    sll         $s3, $s0, 1
    addu        $v0, $s3, $a3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L80023428
    addiu       $v0, $zero, 0x17
    lbu         $v1, 0x0($s5)
    beq         $v1, $v0, .L80023230
    addiu       $v0, $zero, 0x18
    beq         $v1, $v0, .L800232DC
    sll         $v0, $s0, 2
    j .L80023384
    addu        $v0, $v0, $s0
.L80023230:
    sll         $v0, $s0, 2
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x80
    beql        $v0, $zero, .L8002342C
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s7, $v0
    beqz        $v0, .L80023428
    addu        $a0, $s4, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $a3, $zero, -0x1
    bnel        $v0, $a3, .L8002342C
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8002342C
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    addu        $v0, $s3, $s0
    addu        $v0, $v0, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    beqz        $v0, .L8002342C
    addiu       $s1, $s1, 0x1
    j .L800237F4
    addu        $v0, $s0, $zero
.L800232DC:
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x40
    beql        $v0, $zero, .L8002342C
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s7, $v0
    beqz        $v0, .L80023428
    addu        $a0, $s4, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $a3, $zero, -0x1
    bnel        $v0, $a3, .L8002342C
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8002342C
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    addu        $v0, $s3, $s0
    addu        $v0, $v0, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    beqz        $v0, .L8002342C
    addiu       $s1, $s1, 0x1
    j .L800237F4
    addu        $v0, $s0, $zero
.L80023384:
    lw          $a3, 0x34($sp)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    lbu         $v1, 0x0($s5)
    andi        $v0, $v0, 0x3F
    bnel        $v1, $v0, .L8002342C
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s7, $v0
    beqz        $v0, .L80023428
    addu        $a0, $s4, $zero
    lhu         $a2, 0x16($sp)
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $a3, $zero, -0x1
    bnel        $v0, $a3, .L8002342C
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8002342C
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L800236A4
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    addu        $v0, $v0, $s6
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    bnez        $v0, .L800237F4
    addu        $v0, $s0, $zero
.L80023428:
    addiu       $s1, $s1, 0x1
.L8002342C:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800231F4
    addiu       $v0, $zero, 0xFF
    addiu       $s5, $s5, 0x1
    lbu         $v1, 0x0($s5)
    bne         $v1, $v0, .L800231C4
    nop
.L8002344C:
    lhu         $v0, 0x1E($sp)
    ori         $s7, $zero, 0xFFFF
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, -0x5544($at)
    addu        $s6, $zero, $zero
    andi        $s3, $fp, 0xFFFF
    sh          $v0, 0x2E($sp)
    sll         $v0, $s3, 5
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    sw          $v0, 0x54($sp)
    lw          $a3, 0x54($sp)
    addu        $s1, $zero, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    addu        $v0, $a3, $v0
    sw          $v0, 0x5C($sp)
.L800234AC:
    lw          $a3, 0x5C($sp)
    andi        $s0, $s1, 0xFFFF
    sll         $s4, $s0, 1
    addu        $v0, $s4, $a3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L80023574
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    lw          $a3, 0x34($sp)
    addu        $a0, $s3, $zero
    addu        $a1, $s0, $zero
    lhu         $a2, 0x16($sp)
    addu        $v0, $a3, $v0
    jal         func_8002209C
    addiu       $s5, $v0, 0xF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L80023578
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L80023578
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    beqz        $v0, .L80023554
    addu        $v0, $s4, $s0
    lw          $a3, 0x54($sp)
    addu        $v0, $v0, $a3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x1602($at)
    sltiu       $v0, $v0, 0x19
    beql        $v0, $zero, .L80023578
    addiu       $s1, $s1, 0x1
.L80023554:
    lhu         $a3, 0x2E($sp)
    addu        $v0, $a3, $s5
    lbu         $v1, 0x0($v0)
    sltu        $v0, $s6, $v1
    beql        $v0, $zero, .L80023578
    addiu       $s1, $s1, 0x1
    addu        $s6, $v1, $zero
    addu        $s7, $s1, $zero
.L80023574:
    addiu       $s1, $s1, 0x1
.L80023578:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800234AC
    andi        $v1, $s7, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    bne         $v1, $v0, .L800237F4
    addu        $v0, $v1, $zero
    addu        $s1, $zero, $zero
    andi        $s3, $fp, 0xFFFF
    sll         $v0, $s3, 5
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    addu        $v0, $v0, $v1
    lhu         $s6, 0x1E($sp)
    lhu         $s5, 0x26($sp)
    addiu       $s7, $zero, -0x1
    sll         $s4, $fp, 16
    sw          $v0, 0x64($sp)
.L800235E0:
    lw          $a3, 0x64($sp)
    andi        $s0, $s1, 0xFFFF
    sll         $v0, $s0, 1
    addu        $v0, $v0, $a3
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L800236E8
    addiu       $v0, $zero, 0x17
    beq         $s6, $v0, .L8002361C
    sll         $v0, $s0, 2
    addiu       $v0, $zero, 0x18
    beq         $s6, $v0, .L80023638
    sll         $v0, $s0, 2
    j .L800236AC
    addu        $v0, $v0, $s0
.L8002361C:
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    j .L80023650
    andi        $v0, $v0, 0x80
.L80023638:
    lw          $a3, 0x34($sp)
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x40
.L80023650:
    beql        $v0, $zero, .L800236EC
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s5, $v0
    beqz        $v0, .L800236E8
    addu        $a0, $s3, $zero
    lhu         $a2, 0x16($sp)
.L80023670:
    jal         func_8002209C
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    bnel        $v0, $s7, .L800236EC
    addiu       $s1, $s1, 0x1
    sra         $a0, $s4, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beqz        $v0, .L800236EC
    addiu       $s1, $s1, 0x1
.L800236A4:
    j .L800237F4
    addu        $v0, $s0, $zero
.L800236AC:
    lw          $a3, 0x34($sp)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a3
    lbu         $v0, 0xE($v0)
    andi        $v0, $v0, 0x3F
    bnel        $s6, $v0, .L800236EC
    addiu       $s1, $s1, 0x1
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $s5, $v0
    beqz        $v0, .L800236E8
    andi        $a0, $fp, 0xFFFF
    lhu         $a2, 0x16($sp)
    j .L80023670
    nop
.L800236E8:
    addiu       $s1, $s1, 0x1
.L800236EC:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800235E0
    andi        $s0, $fp, 0xFFFF
    lhu         $v0, 0x1E($sp)
    ori         $s7, $zero, 0xFFFF
    addu        $s6, $zero, $zero
    addu        $s1, $zero, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, -0x5544($at)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0xCFC
    sh          $v0, 0x2E($sp)
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $s2, $v0, $v1
    andi        $a1, $s1, 0xFFFF
.L80023750:
    sll         $v0, $a1, 1
    addu        $v0, $v0, $s2
    lhu         $v1, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L800237DC
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    lw          $a3, 0x34($sp)
    addu        $a0, $s0, $zero
    lhu         $a2, 0x16($sp)
    addu        $v0, $a3, $v0
    jal         func_8002209C
    addiu       $s5, $v0, 0xF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bnel        $v0, $v1, .L800237E0
    addiu       $s1, $s1, 0x1
    sll         $a0, $fp, 16
    sra         $a0, $a0, 16
    sll         $a1, $s1, 16
    jal         func_8003FC94
    sra         $a1, $a1, 16
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L800237E0
    addiu       $s1, $s1, 0x1
    lhu         $a3, 0x2E($sp)
    addu        $v0, $a3, $s5
    lbu         $v1, 0x0($v0)
    sltu        $v0, $s6, $v1
    beql        $v0, $zero, .L800237E0
    addiu       $s1, $s1, 0x1
    addu        $s6, $v1, $zero
    addu        $s7, $s1, $zero
.L800237DC:
    addiu       $s1, $s1, 0x1
.L800237E0:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnel        $v0, $zero, .L80023750
    andi        $a1, $s1, 0xFFFF
    andi        $v0, $s7, 0xFFFF
.L800237F4:
    lw          $ra, 0x8C($sp)
    lw          $fp, 0x88($sp)
    lw          $s7, 0x84($sp)
    lw          $s6, 0x80($sp)
    lw          $s5, 0x7C($sp)
    lw          $s4, 0x78($sp)
    lw          $s3, 0x74($sp)
    lw          $s2, 0x70($sp)
    lw          $s1, 0x6C($sp)
    lw          $s0, 0x68($sp)
    addiu       $sp, $sp, 0x90
    jr          $ra
    nop
.end gameplay_roster_update

.text
.align 2
.set noreorder
.globl resource_file_load
.ent resource_file_load
resource_file_load:
    addiu       $sp, $sp, -0x58
    lw          $v1, 0x70($sp)
    lhu         $t0, 0x6A($sp)
    sw          $s4, 0x40($sp)
    lhu         $s4, 0x6E($sp)
    sw          $s0, 0x30($sp)
    addu        $s0, $a0, $zero
    sw          $s5, 0x44($sp)
    addu        $s5, $a1, $zero
    sw          $s7, 0x4C($sp)
    addu        $s7, $zero, $zero
    sw          $s2, 0x38($sp)
    addiu       $s2, $zero, 0x1
    sw          $s6, 0x48($sp)
    addu        $s6, $a2, $zero
    sw          $fp, 0x50($sp)
    addu        $fp, $a3, $zero
    sw          $ra, 0x54($sp)
    sw          $s3, 0x3C($sp)
    sw          $s1, 0x34($sp)
    sh          $zero, 0x2E($sp)
    addu        $s3, $v1, $zero
    andi        $v0, $v1, 0x2000
    beqz        $v0, .L8001709C
    sh          $t0, 0x26($sp)
    j .L800170CC
    addu        $s1, $s5, $zero
.L8001709C:
    andi        $v0, $v1, 0x40
    beqz        $v0, .L800170B8
    addu        $a1, $s5, $zero
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    j .L800170C0
    addu        $s2, $zero, $zero
.L800170B8:
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
.L800170C0:
    jal         func_80035D7C
    nop
    addu        $s1, $v0, $zero
.L800170CC:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x9C0
    jal         func_8002E628
    addiu       $a1, $s1, 0x6
    bnez        $v0, .L80017128
    addu        $v1, $s2, $zero
    addu        $a0, $s0, $zero
    sll         $a1, $s6, 16
    sra         $a1, $a1, 16
    lw          $t0, 0x78($sp)
    sll         $a2, $fp, 16
    sra         $a2, $a2, 16
    sw          $t0, 0x18($sp)
    lhu         $t0, 0x26($sp)
    sll         $v0, $s4, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x10($sp)
    sw          $s1, 0x14($sp)
    sll         $a3, $t0, 16
    jal         func_80017650
    sra         $a3, $a3, 16
    j .L80017370
    andi        $v0, $s3, 0x2010
.L80017128:
    addiu       $v0, $zero, 0x1
    sh          $s6, 0x3A($s0)
    sw          $s5, 0x2C($s0)
    sh          $zero, 0x38($s0)
    bne         $v1, $v0, .L800171AC
    sh          $zero, 0x3C($s0)
    andi        $v0, $s3, 0x10
    bnez        $v0, .L80017160
    andi        $v0, $s3, 0x2000
    andi        $v0, $s3, 0x1
    bnez        $v0, .L80017160
    andi        $v0, $s3, 0x2000
    beqz        $v0, .L800171AC
    nop
.L80017160:
    bnez        $v0, .L8001717C
    addiu       $a1, $zero, 0x2800
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    jal         func_80035598
    addu        $a1, $s5, $zero
    sll         $a1, $v0, 1
.L8001717C:
    lhu         $v0, 0x0($s1)
    bnez        $v0, .L800171B4
    addu        $s2, $s1, $v0
    addiu       $t0, $zero, 0x1
    sh          $t0, 0x2E($sp)
    jal         func_80032E00
    addu        $a0, $zero, $zero
    addu        $s7, $v0, $zero
    addiu       $a0, $s1, 0x2
    jal         func_80031AB8
    addu        $a1, $s7, $zero
    addu        $s1, $s7, $zero
.L800171AC:
    lhu         $v0, 0x0($s1)
    addu        $s2, $s1, $v0
.L800171B4:
    lw          $v0, 0x0($s2)
    addu        $s4, $s2, $v0
    lhu         $v0, 0x4($s4)
    sh          $v0, 0xC($s0)
    lhu         $v0, 0x2($s1)
    sh          $v0, 0xE($s0)
    lhu         $v0, 0x4($s1)
    lhu         $v1, 0xE($s0)
    sh          $v0, 0x10($s0)
    lhu         $v0, 0x4($s2)
    sh          $v0, 0x12($s0)
    lhu         $v0, 0x12($s0)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lhu         $a0, 0x10($s0)
    lhu         $v0, 0x6($s2)
    sh          $v0, 0x14($s0)
    lhu         $v0, 0x14($s0)
    .word       0x00820018  # mult        $a0, $v0
    .word       0x00002012  # mflo        $a0
    sh          $fp, 0x16($s0)
    sh          $v1, 0x1A($s0)
    lhu         $t0, 0x26($sp)
    lhu         $v0, 0x1A($s0)
    sh          $t0, 0x18($s0)
    sw          $zero, 0x0($s0)
    sh          $v0, 0x1E($s0)
    sh          $a0, 0x1C($s0)
    lhu         $v1, 0x6($s1)
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L80017258
    addu        $a0, $zero, $zero
    lhu         $a1, 0x0($s1)
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    sw          $v0, 0x0($s0)
    lhu         $a2, 0x0($s1)
    addu        $a0, $v0, $zero
    addiu       $a1, $s1, 0x6
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
.L80017258:
    andi        $v0, $s3, 0x80
    beqz        $v0, .L80017270
    addu        $a0, $zero, $zero
    lw          $t0, 0x78($sp)
    j .L80017280
    sw          $t0, 0x4($s0)
.L80017270:
    lw          $a1, 0x0($s2)
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    sw          $v0, 0x4($s0)
.L80017280:
    lw          $a2, 0x0($s2)
    lw          $a0, 0x4($s0)
    addiu       $a1, $s2, 0x8
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    andi        $v0, $s3, 0x8
    beqz        $v0, .L800172B0
    sw          $zero, 0x8($s0)
    lw          $t0, 0x74($sp)
    lw          $v0, 0x8($t0)
    j .L80017318
    sw          $v0, 0x8($s0)
.L800172B0:
    sll         $v0, $s6, 16
    sra         $v1, $v0, 16
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L800172D8
    andi        $v0, $s3, 0x4000
    lui         $v0, 0x8008
    lh          $v0, 0x7750($v0)
    bne         $v0, $v1, .L8001731C
    andi        $v0, $s3, 0x400
    andi        $v0, $s3, 0x4000
.L800172D8:
    beqz        $v0, .L800172EC
    nop
    lw          $t0, 0x7C($sp)
    j .L80017318
    sw          $t0, 0x8($s0)
.L800172EC:
    lhu         $a1, 0x2($s4)
    beqz        $a1, .L80017318
    addu        $a0, $zero, $zero
    jal         func_80032E00
    sll         $a1, $a1, 1
    sw          $v0, 0x8($s0)
    lhu         $a2, 0x2($s4)
    addu        $a0, $v0, $zero
    addiu       $a1, $s4, 0x6
    jal         func_8002E17C
    sll         $a2, $a2, 1
.L80017318:
    andi        $v0, $s3, 0x400
.L8001731C:
    beqz        $v0, .L8001734C
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x5900($a0)
    jal         func_80033298
    nop
    sw          $v0, 0x20($s0)
    lhu         $a2, 0x2($s4)
    addu        $a0, $v0, $zero
    addiu       $a1, $s4, 0x6
    jal         func_8002E17C
    sll         $a2, $a2, 1
.L8001734C:
    lhu         $t0, 0x2E($sp)
    addiu       $v0, $zero, 0x1
    addu        $v1, $t0, $zero
    bne         $v1, $v0, .L80017370
    andi        $v0, $s3, 0x2010
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addu        $a1, $s7, $zero
    andi        $v0, $s3, 0x2010
.L80017370:
    bnez        $v0, .L8001738C
    addu        $v0, $s0, $zero
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    jal         func_80035F88
    addu        $a1, $s5, $zero
    addu        $v0, $s0, $zero
.L8001738C:
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end resource_file_load

.text
.align 2
.set noreorder
.globl frame_identifier_resolve
.ent frame_identifier_resolve
frame_identifier_resolve:
    lui         $v0, 0x8007
    lw          $v0, -0x4624($v0)
    addiu       $sp, $sp, -0x50
    sw          $ra, 0x4C($sp)
    sw          $fp, 0x48($sp)
    sw          $s7, 0x44($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    sw          $a1, 0x1C($sp)
    sh          $a0, 0x16($sp)
    addiu       $s5, $v0, 0x5A9C
    addiu       $s4, $v0, 0x5B8C
    jal         func_80024694
    addu        $s6, $v0, $zero
    lhu         $v0, 0x16($sp)
    beqz        $v0, .L8002895C
    addu        $fp, $zero, $zero
    lui         $s7, 0x3FFF
    ori         $s7, $s7, 0xFFFF
    lui         $a2, 0x1FF
    ori         $a2, $a2, 0xFFFF
    sw          $a2, 0x24($sp)
    addu        $s1, $zero, $zero
.L800287B4:
    addu        $s3, $zero, $zero
    lw          $a2, 0x1C($sp)
    andi        $v0, $fp, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a2
    lhu         $a0, 0x0($v0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0xCFC
    jal         func_8003A8CC
    addu        $s2, $zero, $zero
.L800287DC:
    andi        $v0, $s2, 0xFFFF
    sll         $v0, $v0, 1
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0xCFC
    addu        $v0, $v0, $a2
    lhu         $a0, 0x0($v0)
    ori         $v0, $zero, 0xFFFF
    beql        $a0, $v0, .L800288DC
    addiu       $s2, $s2, 0x1
    jal         func_8003AA28
    addu        $s0, $s6, $zero
    addu        $a0, $v0, $zero
    lbu         $v0, 0xE($a0)
    andi        $v1, $v0, 0x3F
    sltiu       $v0, $v1, 0xA
    beql        $v0, $zero, .L80028840
    sltiu       $v0, $v1, 0x15
    bnez        $v1, .L80028834
    lui         $v1, 0x4000
    lw          $v0, 0x0($s0)
    j .L80028860
    and         $v0, $v0, $s7
.L80028834:
    lw          $v0, 0x0($s0)
    j .L8002885C
    and         $v0, $v0, $s7
.L80028840:
    beqz        $v0, .L80028854
    lui         $v1, 0x8000
    lw          $v0, 0x0($s0)
    j .L8002885C
    and         $v0, $v0, $s7
.L80028854:
    lw          $v0, 0x0($s0)
    lui         $v1, 0xC000
.L8002885C:
    or          $v0, $v0, $v1
.L80028860:
    sw          $v0, 0x0($s0)
    lbu         $v1, 0xE($a0)
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x1
    srl         $v1, $v1, 6
    andi        $v1, $v1, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L800288A0
    sll         $v1, $s2, 25
    lw          $v0, 0x0($s4)
    lw          $a2, 0x24($sp)
    addiu       $s1, $s1, 0x1
    and         $v0, $v0, $a2
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s4)
    addiu       $s4, $s4, 0x4
.L800288A0:
    lbu         $v1, 0xE($a0)
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0x2
    srl         $v1, $v1, 7
    and         $v1, $v1, $v0
    beqz        $v1, .L800288D8
    sll         $v1, $s2, 25
    lw          $v0, 0x0($s5)
    lw          $a2, 0x24($sp)
    addiu       $s3, $s3, 0x1
    and         $v0, $v0, $a2
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s5)
    addiu       $s5, $s5, 0x4
.L800288D8:
    addiu       $s2, $s2, 0x1
.L800288DC:
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L800287DC
    addiu       $s6, $s6, 0xC
    andi        $v0, $s1, 0xFFFF
    bnez        $v0, .L80028938
    andi        $v0, $s3, 0xFFFF
.L800288F8:
    lw          $v0, 0x0($s4)
    addiu       $s1, $s1, 0x1
    lui         $a2, 0xFE00
    or          $v0, $v0, $a2
    sw          $v0, 0x0($s4)
    andi        $v0, $s1, 0xFFFF
    beqz        $v0, .L800288F8
    addiu       $s4, $s4, 0x4
    j .L80028938
    andi        $v0, $s3, 0xFFFF
.L80028920:
    lw          $v0, 0x0($s5)
    lui         $a2, 0xFE00
    or          $v0, $v0, $a2
    sw          $v0, 0x0($s5)
    addiu       $s5, $s5, 0x4
    andi        $v0, $s3, 0xFFFF
.L80028938:
    sltiu       $v0, $v0, 0x2
    bnel        $v0, $zero, .L80028920
    addiu       $s3, $s3, 0x1
    lhu         $v1, 0x16($sp)
    addiu       $fp, $fp, 0x1
    andi        $v0, $fp, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800287B4
    addu        $s1, $zero, $zero
.L8002895C:
    lui         $v1, 0x8007
    lhu         $v1, -0x4628($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80028A1C
    addu        $s2, $zero, $zero
    addu        $s0, $s6, $zero
    ori         $s7, $zero, 0xFFFF
    lui         $s3, 0x3FFF
    ori         $s3, $s3, 0xFFFF
    lui         $s6, 0x4000
    lui         $s5, 0x8000
    lui         $s4, 0xC000
.L8002898C:
    andi        $s1, $s2, 0xFFFF
    jal         func_8003A21C
    addu        $a0, $s1, $zero
    andi        $v0, $v0, 0xFFFF
    beq         $v0, $s7, .L80028A1C
    nop
    jal         func_8003A21C
    addu        $a0, $s1, $zero
    jal         func_8003AA28
    andi        $a0, $v0, 0xFFFF
    lbu         $v0, 0xE($v0)
    andi        $v1, $v0, 0x3F
    sltiu       $v0, $v1, 0xA
    beql        $v0, $zero, .L800289EC
    sltiu       $v0, $v1, 0x15
    bnez        $v1, .L800289DC
    nop
    lw          $v0, 0x0($s0)
    j .L80028A0C
    and         $v0, $v0, $s3
.L800289DC:
    lw          $v0, 0x0($s0)
    and         $v0, $v0, $s3
    j .L80028A0C
    or          $v0, $v0, $s6
.L800289EC:
    beqz        $v0, .L80028A04
    nop
    lw          $v0, 0x0($s0)
    and         $v0, $v0, $s3
    j .L80028A0C
    or          $v0, $v0, $s5
.L80028A04:
    lw          $v0, 0x0($s0)
    or          $v0, $v0, $s4
.L80028A0C:
    sw          $v0, 0x0($s0)
    addiu       $s2, $s2, 0x1
    j .L8002898C
    addiu       $s0, $s0, 0xC
.L80028A1C:
    jal         func_80024E9C
    nop
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
.end frame_identifier_resolve

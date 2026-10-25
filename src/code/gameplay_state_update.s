.text
.align 2
.set noreorder
.globl gameplay_state_update
.ent gameplay_state_update
gameplay_state_update:
    addiu       $sp, $sp, -0xA0
    sw          $ra, 0x9C($sp)
    sw          $s6, 0x98($sp)
    sw          $s5, 0x94($sp)
    sw          $s4, 0x90($sp)
    sw          $s3, 0x8C($sp)
    sw          $s2, 0x88($sp)
    sw          $s1, 0x84($sp)
    jal         func_80028224
    sw          $s0, 0x80($sp)
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x4
    bne         $v0, $v1, .L80024864
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4540($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x4540($a1)
    addiu       $a2, $zero, 0x17E5
    lui         $at, 0x8007
    sw          $v0, -0x453C($at)
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x453C($a1)
    addiu       $a2, $zero, 0x17E5
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    lui         $v0, 0x8007
    lhu         $v0, -0x4620($v0)
    beqz        $v0, .L80024810
    addu        $s2, $zero, $zero
    lui         $s6, 0x8007
    addiu       $s6, $s6, -0x461C
    addiu       $s4, $sp, 0x10
    ori         $s5, $zero, 0xFFFF
    lui         $s3, 0xFFFF
    ori         $s3, $s3, 0x7FFF
    andi        $s0, $s2, 0xFFFF
.L8002474C:
    sll         $s0, $s0, 1
    addu        $s0, $s0, $s6
    lhu         $a0, 0x0($s0)
    addiu       $a1, $sp, 0x10
    jal         func_8003A8CC
    addu        $s1, $zero, $zero
    andi        $v0, $s1, 0xFFFF
.L80024768:
    sll         $v0, $v0, 1
    addu        $a2, $v0, $s4
    lhu         $v0, 0x0($a2)
    andi        $a1, $v0, 0xFFFF
    beq         $a1, $s5, .L800247E0
    andi        $v0, $v0, 0x8000
    bnez        $v0, .L800247B4
    and         $v0, $a1, $s3
    lui         $v0, 0x8007
    lw          $v0, -0x4540($v0)
    lhu         $v1, 0x0($s0)
    addu        $v0, $v0, $a1
    sb          $v1, 0x0($v0)
    lhu         $v1, 0x0($a2)
    lui         $v0, 0x8007
    lw          $v0, -0x453C($v0)
    addu        $v0, $v0, $v1
    j .L800247E0
    sb          $s1, 0x0($v0)
.L800247B4:
    lui         $v1, 0x8007
    lw          $v1, -0x4540($v1)
    lhu         $a0, 0x0($s0)
    addu        $v0, $v0, $v1
    sb          $a0, 0x17CD($v0)
    lhu         $v0, 0x0($a2)
    lui         $v1, 0x8007
    lw          $v1, -0x453C($v1)
    and         $v0, $v0, $s3
    addu        $v0, $v0, $v1
    sb          $s1, 0x17CD($v0)
.L800247E0:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80024768
    andi        $v0, $s1, 0xFFFF
    lui         $v1, 0x8007
    lhu         $v1, -0x4620($v1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8002474C
    andi        $s0, $s2, 0xFFFF
.L80024810:
    addu        $s2, $zero, $zero
    addiu       $s1, $zero, 0xFF
    addiu       $s0, $zero, 0x64
.L8002481C:
    jal         func_8003A584
    andi        $a0, $s2, 0xFFFF
    addu        $s2, $v0, $zero
    andi        $a0, $s2, 0xFFFF
    beqz        $a0, .L80024B64
    nop
    lui         $v0, 0x8007
    lw          $v0, -0x4540($v0)
    addu        $v1, $v0, $a0
    lbu         $v0, 0x0($v1)
    bne         $v0, $s1, .L8002481C
    nop
    sb          $s0, 0x0($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x453C($v0)
    addu        $v0, $v0, $a0
    j .L8002481C
    sb          $zero, 0x0($v0)
.L80024864:
    jal         func_8002B5EC
    nop
    sll         $v0, $v0, 16
    sra         $s0, $v0, 16
    bnez        $s0, .L80024A20
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4540($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x4540($a1)
    addiu       $a2, $zero, 0x17E5
    lui         $at, 0x8007
    sw          $v0, -0x453C($at)
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x453C($a1)
    addiu       $a2, $zero, 0x17E5
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    lui         $v0, 0x8007
    lhu         $v0, -0x4620($v0)
    sltu        $v0, $s0, $v0
    beqz        $v0, .L800249C4
    addu        $s2, $zero, $zero
    lui         $s6, 0x8007
    addiu       $s6, $s6, -0x461C
    addiu       $s4, $sp, 0x10
    ori         $s5, $zero, 0xFFFF
    lui         $s3, 0xFFFF
    ori         $s3, $s3, 0x7FFF
    andi        $s0, $s2, 0xFFFF
.L80024900:
    sll         $s0, $s0, 1
    addu        $s0, $s0, $s6
    lhu         $a0, 0x0($s0)
    addiu       $a1, $sp, 0x10
    jal         func_8003A8CC
    addu        $s1, $zero, $zero
    andi        $v0, $s1, 0xFFFF
.L8002491C:
    sll         $v0, $v0, 1
    addu        $a2, $v0, $s4
    lhu         $v0, 0x0($a2)
    andi        $a1, $v0, 0xFFFF
    beq         $a1, $s5, .L80024994
    andi        $v0, $v0, 0x8000
    bnez        $v0, .L80024968
    and         $v0, $a1, $s3
    lui         $v0, 0x8007
    lw          $v0, -0x4540($v0)
    lhu         $v1, 0x0($s0)
    addu        $v0, $v0, $a1
    sb          $v1, 0x0($v0)
    lhu         $v1, 0x0($a2)
    lui         $v0, 0x8007
    lw          $v0, -0x453C($v0)
    addu        $v0, $v0, $v1
    j .L80024994
    sb          $s1, 0x0($v0)
.L80024968:
    lui         $v1, 0x8007
    lw          $v1, -0x4540($v1)
    lhu         $a0, 0x0($s0)
    addu        $v0, $v0, $v1
    sb          $a0, 0x17CD($v0)
    lhu         $v0, 0x0($a2)
    lui         $v1, 0x8007
    lw          $v1, -0x453C($v1)
    and         $v0, $v0, $s3
    addu        $v0, $v0, $v1
    sb          $s1, 0x17CD($v0)
.L80024994:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L8002491C
    andi        $v0, $s1, 0xFFFF
    lui         $v1, 0x8007
    lhu         $v1, -0x4620($v1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80024900
    andi        $s0, $s2, 0xFFFF
.L800249C4:
    addu        $s1, $zero, $zero
    ori         $s3, $zero, 0xFFFF
    lui         $s0, 0xFFFF
    ori         $s0, $s0, 0x7FFF
.L800249D4:
    jal         func_8003A21C
    andi        $a0, $s1, 0xFFFF
    addu        $s2, $v0, $zero
    andi        $a0, $s2, 0xFFFF
    beq         $a0, $s3, .L80024B64
    andi        $v0, $s2, 0x8000
    bnez        $v0, .L80024A08
    and         $v0, $a0, $s0
    lui         $v0, 0x8007
    lw          $v0, -0x453C($v0)
    addu        $v0, $v0, $a0
    j .L80024A18
    sb          $s1, 0x0($v0)
.L80024A08:
    lui         $v1, 0x8007
    lw          $v1, -0x453C($v1)
    addu        $v0, $v0, $v1
    sb          $s1, 0x17CD($v0)
.L80024A18:
    j .L800249D4
    addiu       $s1, $s1, 0x1
.L80024A20:
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $v0, -0x4540($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x17E5
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x4540($a1)
    addiu       $a2, $zero, 0x17E5
    lui         $at, 0x8007
    sw          $v0, -0x453C($at)
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    addu        $a0, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x453C($a1)
    addiu       $a2, $zero, 0x17E5
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    lui         $v0, 0x800C
    lb          $v0, 0x4EEB($v0)
    blez        $v0, .L80024B64
    addu        $s2, $zero, $zero
    lui         $s6, 0x8008
    addiu       $s6, $s6, 0x6190
    addiu       $s4, $sp, 0x10
    ori         $s5, $zero, 0xFFFF
    lui         $s3, 0xFFFF
    ori         $s3, $s3, 0x7FFF
    andi        $s0, $s2, 0xFFFF
.L80024AA0:
    sll         $s0, $s0, 1
    addu        $s0, $s0, $s6
    lhu         $a0, 0x0($s0)
    addiu       $a1, $sp, 0x10
    jal         func_8003A8CC
    addu        $s1, $zero, $zero
    andi        $v0, $s1, 0xFFFF
.L80024ABC:
    sll         $v0, $v0, 1
    addu        $a2, $v0, $s4
    lhu         $v0, 0x0($a2)
    andi        $a1, $v0, 0xFFFF
    beq         $a1, $s5, .L80024B34
    andi        $v0, $v0, 0x8000
    bnez        $v0, .L80024B08
    and         $v0, $a1, $s3
    lui         $v0, 0x8007
    lw          $v0, -0x4540($v0)
    lhu         $v1, 0x0($s0)
    addu        $v0, $v0, $a1
    sb          $v1, 0x0($v0)
    lhu         $v1, 0x0($a2)
    lui         $v0, 0x8007
    lw          $v0, -0x453C($v0)
    addu        $v0, $v0, $v1
    j .L80024B34
    sb          $s1, 0x0($v0)
.L80024B08:
    lui         $v1, 0x8007
    lw          $v1, -0x4540($v1)
    lhu         $a0, 0x0($s0)
    addu        $v0, $v0, $v1
    sb          $a0, 0x17CD($v0)
    lhu         $v0, 0x0($a2)
    lui         $v1, 0x8007
    lw          $v1, -0x4540($v1)
    and         $v0, $v0, $s3
    addu        $v0, $v0, $v1
    sb          $s1, 0x17CD($v0)
.L80024B34:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L80024ABC
    andi        $v0, $s1, 0xFFFF
    lui         $v1, 0x800C
    lb          $v1, 0x4EEB($v1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L80024AA0
    andi        $s0, $s2, 0xFFFF
.L80024B64:
    lw          $ra, 0x9C($sp)
    lw          $s6, 0x98($sp)
    lw          $s5, 0x94($sp)
    lw          $s4, 0x90($sp)
    lw          $s3, 0x8C($sp)
    lw          $s2, 0x88($sp)
    lw          $s1, 0x84($sp)
    lw          $s0, 0x80($sp)
    addiu       $sp, $sp, 0xA0
    jr          $ra
    nop
.end gameplay_state_update

.text
.align 2
.set noreorder
.globl resource_node_update
.ent resource_node_update
resource_node_update:
    addiu       $sp, $sp, -0x30
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s0, 0x8($s3)
    lw          $a0, 0x28($s0)
    lbu         $v1, 0x0($a0)
    andi        $v0, $v1, 0x8
    beqz        $v0, .L8001A618
    addu        $s2, $zero, $zero
    lh          $v0, 0x3E($s0)
    bnez        $v0, .L8001A5B4
    addu        $v1, $v0, $zero
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x1
    subu        $v0, $v0, $v1
    jal         func_80036540
    sh          $v0, 0x3E($s0)
    lw          $v0, 0x28($s0)
    lw          $v0, 0xC($v0)
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    lw          $a2, 0x20($s0)
    lw          $a1, 0x18($v0)
    jal         func_800363F4
    nop
    lw          $v0, 0x28($s0)
    lw          $v1, 0xC($v0)
    lw          $v0, 0x18($v1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x18($v1)
    lw          $a0, 0x24($s0)
    j .L8001A600
    nop
.L8001A5B4:
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x1
    subu        $v0, $v0, $v1
    jal         func_80036540
    sh          $v0, 0x3E($s0)
    lw          $v0, 0x28($s0)
    lw          $v0, 0xC($v0)
    lui         $a0, 0x8008
    lhu         $a0, 0x5BF8($a0)
    lw          $a2, 0x24($s0)
    lw          $a1, 0x18($v0)
    jal         func_800363F4
    nop
    lw          $v0, 0x28($s0)
    lw          $v1, 0xC($v0)
    lw          $v0, 0x18($v1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x18($v1)
    lw          $a0, 0x20($s0)
.L8001A600:
    lw          $a2, 0x28($s0)
    lui         $a1, 0x1
    jal         func_8001A424
    ori         $a1, $a1, 0x86A0
    j .L8001A6C0
    nop
.L8001A618:
    andi        $v0, $v1, 0x10
    beqz        $v0, .L8001A6A8
    ori         $v0, $zero, 0xFFFF
    lh          $v0, 0x3E($s0)
    bnez        $v0, .L8001A668
    nop
    jal         func_80036540
    addu        $a0, $zero, $zero
    lw          $a0, 0x24($s0)
    lw          $a2, 0x28($s0)
    lui         $a1, 0x1
    jal         func_8001A424
    ori         $a1, $a1, 0x86A0
    lw          $a1, 0x20($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lhu         $v1, 0x3E($s0)
    addiu       $v0, $zero, 0x1
    j .L8001A69C
    sw          $zero, 0x20($s0)
.L8001A668:
    jal         func_80036540
    addu        $a0, $zero, $zero
    lw          $a0, 0x20($s0)
    lw          $a2, 0x28($s0)
    lui         $a1, 0x1
    jal         func_8001A424
    ori         $a1, $a1, 0x86A0
    lw          $a1, 0x24($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lhu         $v1, 0x3E($s0)
    addiu       $v0, $zero, 0x1
    sw          $zero, 0x24($s0)
.L8001A69C:
    subu        $v0, $v0, $v1
    j .L8001A6C0
    sh          $v0, 0x3E($s0)
.L8001A6A8:
    lhu         $v1, 0x12($a0)
    beq         $v1, $v0, .L8001A6C0
    nop
    jal         func_8001A488
    nop
    addu        $s2, $v0, $zero
.L8001A6C0:
    lw          $a0, 0x28($s0)
    lbu         $s1, 0x0($a0)
    andi        $v0, $s1, 0x2
    beqz        $v0, .L8001A6E0
    sll         $v0, $s2, 24
    jal         func_8001A914
    addu        $a1, $s3, $zero
    sll         $v0, $s2, 24
.L8001A6E0:
    sra         $v0, $v0, 24
    addiu       $v1, $zero, -0x1
    bne         $v0, $v1, .L8001A700
    sll         $v0, $s1, 24
    lw          $v1, 0x28($s0)
    ori         $v0, $zero, 0xFFFF
    sh          $v0, 0x12($v1)
    sll         $v0, $s1, 24
.L8001A700:
    sra         $v0, $v0, 24
    lw          $ra, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end resource_node_update

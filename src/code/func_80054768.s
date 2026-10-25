.text
.align 2
.set noreorder
.globl func_80054768
.ent func_80054768
func_80054768:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xCA
    bne         $v1, $v0, .L800547BC
    addiu       $v0, $zero, 0xCB
    jal         func_8005619C
    nop
    lw          $v0, 0x40($s0)
    beqz        $v0, .L800547AC
    addiu       $v0, $zero, 0xCF
    sw          $v0, 0x10($s0)
    j .L800548A0
    addiu       $v0, $zero, 0x1
.L800547AC:
    addiu       $v0, $zero, 0xCB
    sw          $v0, 0x10($s0)
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xCB
.L800547BC:
    bne         $v1, $v0, .L8005486C
    addiu       $v0, $zero, 0xCC
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x10($v0)
    beqz        $v0, .L80054860
    addiu       $s1, $zero, 0x2
.L800547D4:
    lw          $v0, 0x8($s0)
    beqz        $v0, .L800547EC
    nop
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L800547EC:
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    beql        $v0, $zero, .L800548A0
    addu        $v0, $zero, $zero
    beq         $v0, $s1, .L80054860
    nop
    lw          $a0, 0x8($s0)
    beqz        $a0, .L800547EC
    xori        $v1, $v0, 0x3
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x1
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800547D4
    nop
    lw          $v0, 0x4($a0)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x4($a0)
    lw          $a0, 0x8($s0)
    lw          $v1, 0x8($a0)
    slt         $v0, $v0, $v1
    bnez        $v0, .L800547D4
    nop
    lw          $v0, 0x13C($s0)
    addu        $v0, $v1, $v0
    j .L800547D4
    sw          $v0, 0x8($a0)
.L80054860:
    lw          $v0, 0x90($s0)
    j .L80054898
    sw          $v0, 0x98($s0)
.L8005486C:
    beq         $v1, $v0, .L80054898
    addiu       $v0, $zero, 0x12
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80054898:
    jal         func_800548B8
    addu        $a0, $s0, $zero
.L800548A0:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80054768

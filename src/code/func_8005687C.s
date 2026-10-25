.text
.align 2
.set noreorder
.globl func_8005687C
.ent func_8005687C
func_8005687C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $s1, 0x1B0($s0)
    lw          $v0, 0x14($s1)
    bnez        $v0, .L80056984
    addiu       $v0, $zero, 0x2
    lw          $v0, 0x1B4($s0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addu        $s2, $v0, $zero
    addiu       $v1, $zero, 0x1
    beq         $s2, $v1, .L800568E0
    slti        $v0, $s2, 0x2
    bnez        $v0, .L80056984
    addu        $v0, $s2, $zero
    addiu       $v0, $zero, 0x2
    beq         $s2, $v0, .L80056930
    addu        $v0, $s2, $zero
    j .L80056984
    nop
.L800568E0:
    lw          $v0, 0x18($s1)
    beqz        $v0, .L800568FC
    nop
    jal         func_80056200
    addu        $a0, $s0, $zero
    j .L80056980
    sw          $zero, 0x18($s1)
.L800568FC:
    lw          $v0, 0x10($s1)
    bnez        $v0, .L80056920
    addiu       $v0, $zero, 0x22
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80056920:
    jal         func_80056808
    addu        $a0, $s0, $zero
    j .L80056984
    addu        $v0, $s2, $zero
.L80056930:
    lw          $v0, 0x18($s1)
    beqz        $v0, .L8005696C
    sw          $v1, 0x14($s1)
    lw          $v0, 0x1B4($s0)
    lw          $v0, 0x54($v0)
    beqz        $v0, .L80056980
    addiu       $v0, $zero, 0x3A
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L80056984
    addu        $v0, $s2, $zero
.L8005696C:
    lw          $v0, 0x98($s0)
    lw          $v1, 0x90($s0)
    slt         $v0, $v1, $v0
    bnel        $v0, $zero, .L80056980
    sw          $v1, 0x98($s0)
.L80056980:
    addu        $v0, $s2, $zero
.L80056984:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8005687C

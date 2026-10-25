.text
.align 2
.set noreorder
.globl func_800A5808
.ent func_800A5808
func_800A5808:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x24($sp)
    lw          $v1, 0x8C($s0)
    addiu       $a2, $zero, 0x3
    beq         $v1, $a2, .L800A58FC
    slti        $v0, $v1, 0x4
    beql        $v0, $zero, .L800A5840
    addiu       $v0, $zero, 0x4
    beqz        $v1, .L800A5850
    addu        $v0, $zero, $zero
    j           func_800A1248
    nop
.L800A5840:
    beq         $v1, $v0, .L800A5940
    lui         $v1, 0x2
    j           func_800A1248
    addu        $v0, $zero, $zero
.L800A5850:
    lui         $a0, 0x8009
    lw          $a0, -0x791C($a0)
    lw          $v0, 0x24($s0)
    lw          $v1, 0x1C($a0)
    lw          $v0, 0x1C($v0)
    subu        $v1, $v1, $v0
    addu        $a1, $v1, $zero
    bgez        $a1, .L800A5878
    sw          $a1, 0x10($sp)
    negu        $a1, $a1
.L800A5878:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x20($a0)
    lw          $v0, 0x20($v0)
    subu        $v1, $v1, $v0
    addu        $a0, $v1, $zero
    bgez        $a0, .L800A5898
    sw          $a0, 0x14($sp)
    negu        $a0, $a0
.L800A5898:
    lui         $v1, 0x7
    ori         $v1, $v1, 0xFFFF
    slt         $v0, $v1, $a1
    xori        $v0, $v0, 0x1
    slt         $v1, $v1, $a0
    xori        $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800A58D8
    addu        $a0, $s0, $zero
    lw          $v0, 0x24($s0)
    sw          $zero, 0x2C($v0)
    lw          $v0, 0x24($s0)
    addiu       $a1, $zero, 0x3E
    sw          $zero, 0x30($v0)
    jal         func_800C0BBC
    sw          $a2, 0x8C($s0)
.L800A58D8:
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
    j           func_800A1248
    addu        $v0, $zero, $zero
.L800A58FC:
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    lui         $v1, 0x4
    and         $v0, $v0, $v1
    beqz        $v0, .L800A5968
    addiu       $v0, $zero, 0x4
    lhu         $v1, 0x28($s0)
    lui         $a0, 0x8009
    lw          $a0, -0x791C($a0)
    sw          $v0, 0x8C($s0)
    andi        $v1, $v1, 0xFFDF
    sh          $v1, 0x28($s0)
    lw          $v0, 0x14($a0)
    addiu       $v1, $zero, -0x2
    and         $v0, $v0, $v1
    j           func_800A1244
    sw          $v0, 0x14($a0)
.L800A5940:
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800A596C
    addu        $v0, $zero, $zero
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x41
    j           func_800A1248
    addiu       $v0, $zero, 0x1
.L800A5968:
    addu        $v0, $zero, $zero
.L800A596C:
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A5808

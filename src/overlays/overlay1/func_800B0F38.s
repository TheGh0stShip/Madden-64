.text
.align 2
.set noreorder
.globl func_800B0F38
.ent func_800B0F38
func_800B0F38:
    lh          $v1, -0x751C($v1)
    lui         $s2, 0x8007
    addiu       $s2, $s2, -0x1E94
    bne         $s0, $v1, .L800B0F60
    andi        $v0, $v0, 0x1
    xori        $v0, $v0, 0x1
    beqz        $v0, .L800B0F78
    nop
    j           func_800AC844
    nop
.L800B0F60:
    beqz        $v0, .L800B0F78
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4244
    j           func_800AC85C
    nop
.L800B0F78:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x423C
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    lw          $v1, 0xC($s1)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800B0FD8
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B0FB8
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x1E60
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    j           func_800AC8BC
    nop
.L800B0FB8:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x1E6C
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    lw          $v1, 0xC($s1)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800B0FE0
    nop
.L800B0FD8:
    lui         $s2, 0x8007
    addiu       $s2, $s2, -0x1E7C
.L800B0FE0:
    beqz        $s2, .L800B1044
    addu        $s1, $s5, $zero
    addiu       $v0, $zero, 0x60
    bne         $s1, $v0, .L800B0FF8
    addiu       $a3, $zero, 0x96
    addiu       $a3, $zero, 0xB4
.L800B0FF8:
    addu        $a0, $s2, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4674
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x46B8
    lui         $v0, 0x8009
    lh          $v0, -0x6A2E($v0)
    addu        $a2, $s0, $zero
    jal         func_8003DDF8
    sw          $v0, 0x10($sp)
    addu        $a0, $s1, $zero
    addu        $a1, $s3, $zero
    addu        $a2, $s0, $zero
    jal         func_800AEFF8
    addu        $a3, $s4, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
.L800B1044:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B0F38

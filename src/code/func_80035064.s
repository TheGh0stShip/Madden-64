.text
.align 2
.set noreorder
.globl func_80035064
.ent func_80035064
func_80035064:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $s4, 0x28($sp)
    addu        $s4, $a1, $zero
    addu        $a0, $s4, $zero
    addiu       $a1, $sp, 0x10
    sw          $s5, 0x2C($sp)
    sw          $ra, 0x30($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s3, 0x8($s2)
    jal         func_800349FC
    addu        $s5, $a2, $zero
    addu        $s1, $v0, $zero
    andi        $a0, $s1, 0xFFFF
    xori        $v0, $a0, 0x2
    sltiu       $v0, $v0, 0x1
    sltiu       $v1, $a0, 0x1
    or          $v0, $v0, $v1
    beql        $v0, $zero, .L80035134
    andi        $v0, $s1, 0xFFFF
    bnez        $a0, .L800350DC
    nop
    lbu         $a0, 0x11($sp)
    jal         func_80034F60
    addiu       $s1, $zero, 0x2
    j .L800350FC
    addu        $s0, $v0, $zero
.L800350DC:
    lh          $v0, 0x10($sp)
    lui         $a0, 0x8007
    lw          $a0, 0x24DC($a0)
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $s0, 0x4($v1)
.L800350FC:
    lw          $a0, 0x0($s3)
    beql        $a0, $s0, .L80035120
    addu        $a0, $s2, $zero
    jal         func_80034E58
    addu        $a1, $zero, $zero
    addu        $a0, $s0, $zero
    jal         func_80034E58
    addiu       $a1, $zero, 0x1
    addu        $a0, $s2, $zero
.L80035120:
    addu        $a1, $s0, $zero
    addu        $a2, $s4, $zero
    jal         func_800344E8
    andi        $a3, $s5, 0xFFFF
    andi        $v0, $s1, 0xFFFF
.L80035134:
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
.end func_80035064

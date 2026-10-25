.text
.align 2
.set noreorder
.globl func_800AA51C
.ent func_800AA51C
func_800AA51C:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x2C($sp)
    addu        $s3, $a2, $zero
    sw          $s0, 0x20($sp)
    addu        $s0, $a3, $zero
    sw          $ra, 0x30($sp)
    sw          $s0, 0x10($sp)
    lw          $a2, 0x0($s2)
    addiu       $a1, $sp, 0x18
    jal         func_800A5D6C
    addu        $a3, $s3, $zero
    addiu       $a0, $s1, 0x4
    sw          $s0, 0x10($sp)
    lw          $a2, 0x4($s2)
    addiu       $a1, $sp, 0x18
    jal         func_800A5D6C
    addu        $a3, $s3, $zero
    addiu       $a0, $s1, 0x8
    sw          $s0, 0x10($sp)
    lw          $a2, 0x8($s2)
    addiu       $a1, $sp, 0x18
    jal         func_800A5D6C
    addu        $a3, $s3, $zero
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800AA51C

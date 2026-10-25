.text
.align 2
.set noreorder
.globl func_800BF278
.ent func_800BF278
func_800BF278:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s4
    lw          $v1, 0x0($v0)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s4
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s5
    sw          $s0, 0x0($v1)
    lw          $v1, 0x0($v0)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, . + 4 + (-0x31 << 2)
    addu        $a0, $s4, $zero
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
.end func_800BF278

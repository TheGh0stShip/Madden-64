.text
.align 2
.set noreorder
.globl func_800B1744
.ent func_800B1744
func_800B1744:
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    addiu       $a0, $zero, 0x88
    lh          $a1, 0x6($s0)
    addu        $a2, $s4, $zero
    jal         func_800AEFF8
    addu        $a3, $v0, $zero
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B1744

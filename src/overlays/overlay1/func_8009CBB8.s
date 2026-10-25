.text
.align 2
.set noreorder
.globl func_8009CBB8
.ent func_8009CBB8
func_8009CBB8:
    lw          $v0, 0x20($s1)
    lhu         $v1, 0x2E($s1)
    addu        $v1, $v1, $v0
    sll         $v0, $s4, 1
    addu        $v0, $v0, $a3
    sh          $v1, 0x30($v0)
    sh          $v1, 0x20($v0)
    beqz        $s2, .L8009CBEC
    sh          $s2, 0x42($s1)
    sll         $s2, $s2, 6
    ori         $v0, $s2, 0x20
    sh          $v0, 0x3A($a3)
    sh          $v0, 0x2A($a3)
.L8009CBEC:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009CBB8

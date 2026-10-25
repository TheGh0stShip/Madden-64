.text
.align 2
.set noreorder
.globl func_800BB644
.ent func_800BB644
func_800BB644:
    addu        $a1, $s3, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    sll         $s2, $s2, 1
    addu        $a2, $s2, $zero
    addu        $s3, $s3, $a2
    jal         func_8004DF68
    addu        $a0, $a0, $v0
    lui         $v0, 0x1
    ori         $v0, $v0, 0x661C
    addu        $a1, $s3, $zero
    sll         $s1, $s1, 1
    addu        $a2, $s1, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    addu        $s3, $s3, $a2
    addu        $s1, $s3, $s5
    jal         func_8004DF68
    addu        $a0, $a0, $v0
    lui         $v0, 0x1
    ori         $v0, $v0, 0xA2D0
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    addu        $a1, $s3, $zero
    addu        $a2, $s5, $zero
    jal         func_8004DF68
    addu        $a0, $a0, $v0
    beqz        $s6, .L800BB6EC
    andi        $a0, $s7, 0xFFFF
    addiu       $s0, $s1, 0x18
.L800BB6BC:
    addu        $a0, $s1, $zero
    lhu         $a2, 0x2($s0)
    addiu       $a1, $s1, 0x10
    jal         func_800B7004
    addiu       $s1, $s1, 0x1C
    lhu         $v1, 0x0($s0)
    addiu       $s4, $s4, 0x1
    sh          $v1, 0x20($v0)
    sltu        $v0, $s4, $s6
    bnez        $v0, .L800BB6BC
    addiu       $s0, $s0, 0x1C
    andi        $a0, $s7, 0xFFFF
.L800BB6EC:
    jal         func_80035F88
    addu        $a1, $fp, $zero
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800BB644

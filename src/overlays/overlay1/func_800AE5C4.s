.text
.align 2
.set noreorder
.globl func_800AE5C4
.ent func_800AE5C4
func_800AE5C4:
    addiu       $v0, $zero, 0x50
    bne         $v1, $v0, .L800AE5E8
    addiu       $s6, $zero, 0x1
    lw          $a0, 0x0($s5)
    jal         func_80016FF4
    nop
    lw          $a0, -0x4($s4)
    jal         func_80016FF4
    nop
.L800AE5E8:
    addiu       $a2, $zero, 0x1
    lui         $a1, 0x8008
    addiu       $a1, $a1, -0x5EA2
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5EE2
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5EA6
.L800AE604:
    lhu         $v0, 0x0($v1)
    sltiu       $v0, $v0, 0x2
    beql        $v0, $zero, .L800AE620
    sh          $a2, 0x0($a1)
    lhu         $v0, 0x0($a0)
    sh          $v0, 0x0($v1)
    sh          $a2, 0x0($a1)
.L800AE620:
    addiu       $a1, $a1, -0x2
    addiu       $v1, $v1, -0x2
    addiu       $a0, $a0, -0x2
    addu        $v0, $s6, $zero
    bnez        $v0, .L800AE604
    addiu       $s6, $s6, -0x1
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
.end func_800AE5C4

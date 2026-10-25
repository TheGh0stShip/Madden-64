.text
.align 2
.set noreorder
.globl func_8002AA8C
.ent func_8002AA8C
func_8002AA8C:
    addiu       $sp, $sp, -0x38
    sw          $s6, 0x28($sp)
    addu        $s6, $zero, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCFC
    sw          $ra, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $s7, 0x0($v0)
    addu        $s3, $zero, $zero
    addu        $s5, $v0, $zero
.L8002AACC:
    addu        $s1, $zero, $zero
    andi        $s4, $s3, 0xFFFF
    addu        $s2, $s5, $zero
.L8002AAD8:
    lhu         $v1, 0x0($s2)
    ori         $v0, $zero, 0xFFFF
    beql        $v1, $v0, .L8002AB48
    addiu       $s1, $s1, 0x1
    addu        $a0, $s4, $zero
    andi        $s0, $s1, 0xFFFF
    jal         func_80022AD8
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    sltiu       $v0, $v0, 0xA
    bnel        $v0, $zero, .L8002AB48
    addiu       $s1, $s1, 0x1
    addu        $a0, $s4, $zero
    jal         func_80022AD8
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    sltiu       $v0, $v0, 0x15
    beql        $v0, $zero, .L8002AB48
    addiu       $s1, $s1, 0x1
    addu        $a0, $s3, $zero
    jal         func_8002A358
    addu        $a1, $s1, $zero
    addu        $v1, $v0, $zero
    sltu        $v0, $s6, $v1
    beqz        $v0, .L8002AB48
    addiu       $s1, $s1, 0x1
    lhu         $s7, 0x0($s2)
    addu        $s6, $v1, $zero
.L8002AB48:
    slti        $v0, $s1, 0x37
    bnez        $v0, .L8002AAD8
    addiu       $s2, $s2, 0x2
    addiu       $s3, $s3, 0x1
    slti        $v0, $s3, 0x2
    bnez        $v0, .L8002AACC
    addiu       $s5, $s5, 0x214C
    addu        $v0, $s7, $zero
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8002AA8C

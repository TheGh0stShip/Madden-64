.text
.align 2
.set noreorder
.globl func_8009C5C0
.ent func_8009C5C0
func_8009C5C0:
    addiu       $sp, $sp, -0x48
    sw          $s7, 0x3C($sp)
    addu        $s7, $a1, $zero
    sw          $s2, 0x28($sp)
    addu        $s2, $a2, $zero
    sw          $fp, 0x40($sp)
    addu        $fp, $a3, $zero
    sw          $s3, 0x2C($sp)
    sw          $ra, 0x44($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lhu         $s1, 0x0($a0)
    lbu         $t2, 0x0($s2)
    lhu         $a2, 0x4($a0)
    lhu         $a3, 0x6($a0)
    lhu         $a1, 0x2($a0)
    beqz        $t2, .L8009C75C
    addu        $s3, $zero, $zero
    sll         $s6, $a1, 24
    sll         $s5, $a2, 24
    sll         $s4, $a3, 24
    andi        $a0, $t2, 0xFF
.L8009C624:
    xori        $v1, $a0, 0x20
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a0, 0x27
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8009C648
    addiu       $s3, $s3, 0x1
    j           func_80098028
    addiu       $s1, $s1, 0x2
.L8009C648:
    addiu       $v1, $t2, -0x41
    andi        $v0, $v1, 0xFF
    sltiu       $v0, $v0, 0x1A
    beql        $v0, $zero, .L8009C664
    addiu       $v1, $t2, -0x30
    j           func_80097F70
    addu        $t2, $v1, $zero
.L8009C664:
    andi        $v0, $v1, 0xFF
    sltiu       $v0, $v0, 0xA
    beqz        $v0, .L8009C67C
    addiu       $v0, $zero, 0x2D
    j           func_80097F70
    addiu       $t2, $v1, 0x1A
.L8009C67C:
    bne         $a0, $v0, .L8009C68C
    addiu       $v0, $zero, 0x2E
    j           func_80097F70
    addiu       $t2, $zero, 0x24
.L8009C68C:
    beql        $a0, $v0, .L8009C694
    addiu       $t2, $zero, 0x25
.L8009C694:
    andi        $v0, $fp, 0x2
    bnez        $v0, .L8009C6F4
    sll         $a0, $s1, 24
    sra         $a0, $a0, 24
    sra         $a1, $s6, 24
    lui         $t0, 0x8006
    lw          $t0, 0x5450($t0)
    andi        $v0, $t2, 0xFF
    sll         $v0, $v0, 1
    sra         $a2, $s5, 24
    sra         $a3, $s4, 24
    addu        $v0, $v0, $t0
    lhu         $t1, 0x14($v0)
    lhu         $v1, 0x0($t0)
    andi        $v0, $t2, 0xFF
    addiu       $v0, $v0, 0x9
    sw          $s7, 0x10($sp)
    sw          $t0, 0x14($sp)
    sw          $v0, 0x18($sp)
    addiu       $t1, $t1, 0x2
    sll         $v1, $v1, 1
    addu        $t1, $t1, $v1
    j           func_80098018
    addu        $s0, $t0, $t1
.L8009C6F4:
    sra         $a0, $a0, 24
    sra         $a1, $s6, 24
    lui         $v1, 0x8006
    lw          $v1, 0x5454($v1)
    andi        $t0, $t2, 0xFF
    sll         $v0, $t0, 1
    addu        $v0, $v0, $v1
    lhu         $t1, 0x2($v0)
    lhu         $v0, 0x0($v1)
    sra         $a2, $s5, 24
    sra         $a3, $s4, 24
    sw          $s7, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $t0, 0x18($sp)
    addiu       $t1, $t1, 0x2
    sll         $v0, $v0, 1
    addu        $t1, $t1, $v0
    addu        $s0, $v1, $t1
    jal         func_8001E4B0
    nop
    lbu         $v0, 0x2($s0)
    addu        $s1, $s1, $v0
    addiu       $s2, $s2, 0x1
    lbu         $t2, 0x0($s2)
    bnez        $t2, .L8009C624
    andi        $a0, $t2, 0xFF
.L8009C75C:
    andi        $v0, $s3, 0xFFFF
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_8009C5C0

.text
.align 2
.set noreorder
.globl func_80061F10
.ent func_80061F10
func_80061F10:
    addiu       $sp, $sp, -0x1C8
    sw          $s4, 0x1B0($sp)
    addu        $s4, $a0, $zero
    sw          $s7, 0x1BC($sp)
    sra         $s7, $a1, 2
    sw          $s6, 0x1B8($sp)
    sra         $s6, $a2, 3
    sw          $s3, 0x1AC($sp)
    sra         $s3, $a3, 2
    sw          $s2, 0x1A8($sp)
    sll         $s2, $s7, 5
    addiu       $s2, $s2, 0x4
    addu        $a1, $s2, $zero
    sw          $s1, 0x1A4($sp)
    sll         $s1, $s6, 5
    addiu       $s1, $s1, 0x2
    addu        $a2, $s1, $zero
    sw          $ra, 0x1C4($sp)
    sw          $fp, 0x1C0($sp)
    sw          $s5, 0x1B4($sp)
    sw          $s0, 0x1A0($sp)
    lw          $v0, 0x1C8($s4)
    sll         $s0, $s3, 5
    addiu       $s0, $s0, 0x4
    addu        $a3, $s0, $zero
    sll         $s7, $s7, 2
    lw          $fp, 0x18($v0)
    sll         $s6, $s6, 3
    addiu       $s5, $sp, 0x20
    jal         func_80061B10
    sw          $s5, 0x10($sp)
    addu        $a0, $s4, $zero
    addu        $a1, $s2, $zero
    addu        $a2, $s1, $zero
    addu        $a3, $s0, $zero
    addiu       $s0, $sp, 0x120
    sw          $v0, 0x10($sp)
    sw          $s5, 0x14($sp)
    jal         func_80061D80
    sw          $s0, 0x18($sp)
    addu        $a2, $zero, $zero
    sll         $s3, $s3, 3
    addu        $a1, $zero, $zero
.L80061FBC:
    addu        $v0, $s7, $a2
    sll         $v0, $v0, 2
    addu        $a3, $v0, $fp
    addu        $a0, $zero, $zero
.L80061FCC:
    lw          $v1, 0x0($a3)
    addu        $v0, $s6, $a1
    sll         $v0, $v0, 6
    addu        $v1, $v1, $v0
    addu        $v1, $v1, $s3
.L80061FE0:
    lbu         $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
    addiu       $a0, $a0, 0x1
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x0($v1)
    slti        $v0, $a0, 0x4
    bnez        $v0, .L80061FE0
    addiu       $v1, $v1, 0x2
    addiu       $a1, $a1, 0x1
    slti        $v0, $a1, 0x8
    bnel        $v0, $zero, .L80061FCC
    addu        $a0, $zero, $zero
    addiu       $a2, $a2, 0x1
    slti        $v0, $a2, 0x4
    bnez        $v0, .L80061FBC
    addu        $a1, $zero, $zero
    lw          $ra, 0x1C4($sp)
    lw          $fp, 0x1C0($sp)
    lw          $s7, 0x1BC($sp)
    lw          $s6, 0x1B8($sp)
    lw          $s5, 0x1B4($sp)
    lw          $s4, 0x1B0($sp)
    lw          $s3, 0x1AC($sp)
    lw          $s2, 0x1A8($sp)
    lw          $s1, 0x1A4($sp)
    lw          $s0, 0x1A0($sp)
    addiu       $sp, $sp, 0x1C8
    jr          $ra
    nop
.end func_80061F10

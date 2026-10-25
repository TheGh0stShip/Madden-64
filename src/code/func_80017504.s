.text
.align 2
.set noreorder
.globl func_80017504
.ent func_80017504
func_80017504:
    addiu       $sp, $sp, -0x50
    lw          $v0, 0x64($sp)
    sw          $s1, 0x2C($sp)
    lw          $s1, 0x68($sp)
    sw          $s6, 0x40($sp)
    addu        $s6, $a0, $zero
    sw          $s3, 0x34($sp)
    addu        $s3, $a1, $zero
    sw          $s4, 0x38($sp)
    addu        $s4, $a2, $zero
    sw          $s2, 0x30($sp)
    addu        $s2, $a3, $zero
    sw          $ra, 0x48($sp)
    sw          $s7, 0x44($sp)
    sw          $s5, 0x3C($sp)
    sw          $s0, 0x28($sp)
    sh          $zero, 0x20($sp)
    sh          $zero, 0x22($sp)
    sll         $s0, $v0, 16
    sra         $s0, $s0, 16
    addu        $a0, $s0, $zero
    addu        $a1, $s1, $zero
    jal         func_80016A24
    addu        $s7, $v0, $zero
    addu        $s5, $v0, $zero
    addu        $a0, $s0, $zero
    jal         func_80016BB0
    addu        $a1, $s1, $zero
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x20
    addu        $a2, $s1, $zero
    addiu       $a3, $zero, 0x2
    jal         func_800160C4
    addu        $s0, $v0, $zero
    addu        $a0, $s6, $zero
    andi        $a1, $s5, 0xFFFF
    andi        $a2, $s0, 0xFFFF
    sll         $s4, $s4, 16
    sra         $a3, $s4, 16
    sll         $s2, $s2, 16
    sra         $s2, $s2, 16
    sll         $s3, $s3, 16
    sra         $s3, $s3, 16
    addiu       $v1, $zero, 0x4
    addu        $s0, $v0, $zero
    sw          $s2, 0x10($sp)
    sw          $s3, 0x14($sp)
    jal         func_80017840
    sw          $v1, 0x18($sp)
    andi        $v0, $s5, 0xF
    beqz        $v0, .L800175EC
    sll         $v0, $s7, 16
    addiu       $v0, $s5, 0x1
.L800175D8:
    addu        $s5, $v0, $zero
    andi        $v0, $v0, 0xF
    bnez        $v0, .L800175D8
    addiu       $v0, $s5, 0x1
    sll         $v0, $s7, 16
.L800175EC:
    sra         $v0, $v0, 16
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    sh          $s5, 0x1E($s6)
    sw          $s0, 0x4($s6)
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x73B8($at)
    sh          $zero, 0x3C($s6)
    sw          $v0, 0x8($s6)
    lw          $ra, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_80017504

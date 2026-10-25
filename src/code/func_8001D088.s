.text
.align 2
.set noreorder
.globl func_8001D088
.ent func_8001D088
func_8001D088:
    addiu       $sp, $sp, -0x40
    sw          $s4, 0x30($sp)
    addu        $s4, $a0, $zero
    sw          $s1, 0x24($sp)
    addu        $s1, $a1, $zero
    sw          $s0, 0x20($sp)
    addiu       $s0, $a2, 0x1
    sw          $ra, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    lw          $v0, 0x8($s4)
    addu        $a0, $s0, $zero
    lhu         $s2, 0x1A($v0)
    jal         func_8004DF94
    addu        $s5, $a3, $zero
    addu        $s3, $s0, $zero
    addiu       $v0, $v0, 0xC
    addu        $s0, $s0, $v0
    lbu         $v0, 0x0($s0)
    beqz        $v0, .L8001D0F4
    addiu       $a3, $zero, 0xDD
    srl         $v0, $v0, 7
    negu        $v0, $v0
    addiu       $v1, $zero, -0x23
    and         $v0, $v0, $v1
    ori         $a3, $v0, 0xCC
.L8001D0F4:
    addu        $a0, $zero, $zero
    addu        $a1, $s1, $zero
    andi        $s0, $s2, 0xFFFF
    sll         $a2, $s0, 3
    subu        $a2, $a2, $s0
    srl         $a2, $a2, 1
    jal         func_80033308
    andi        $a3, $a3, 0xFF
    addu        $a3, $zero, $zero
    andi        $v0, $a3, 0xFF
.L8001D11C:
    .word       0x00500018  # mult        $v0, $s0
    .word       0x00001012  # mflo        $v0
    addiu       $a3, $a3, 0x1
    sra         $v0, $v0, 1
    addu        $v0, $s1, $v0
    sb          $zero, 0x0($v0)
    andi        $v0, $a3, 0xFF
    sltiu       $v0, $v0, 0x7
    bnez        $v0, .L8001D11C
    andi        $v0, $a3, 0xFF
    addu        $s0, $s3, $zero
    addu        $a0, $s0, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $zero, $zero
    jal         func_8001E820
    addiu       $a3, $zero, 0x9
    andi        $v1, $v0, 0xFFFF
    sltiu       $v0, $v1, 0x58
    bnez        $v0, .L8001D174
    addiu       $v0, $zero, 0x58
    j .L8001D188
    addiu       $v0, $zero, 0x4
.L8001D174:
    subu        $v0, $v0, $v1
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addiu       $v0, $v0, 0x2
.L8001D188:
    sll         $a0, $v0, 24
    sra         $a0, $a0, 24
    addiu       $a1, $zero, 0x6
    addu        $a2, $s4, $zero
    addu        $a3, $s1, $zero
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8008
    sb          $zero, 0x5027($at)
    sw          $s0, 0x10($sp)
    sw          $s5, 0x14($sp)
    jal         func_8001E8F0
    sw          $v0, 0x18($sp)
    lw          $ra, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_8001D088

.text
.align 2
.set noreorder
.globl func_80022538
.ent func_80022538
func_80022538:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sll         $a2, $a2, 16
    sw          $s5, 0x24($sp)
    sra         $s5, $a2, 16
    sll         $a3, $a3, 16
    sw          $s4, 0x20($sp)
    sra         $s4, $a3, 16
    sw          $s1, 0x14($sp)
    andi        $s1, $a1, 0xFFFF
    andi        $a0, $a0, 0xFFFF
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x16A7
    sll         $v1, $s1, 1
    addu        $v1, $v1, $s1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s1
    addu        $v0, $v0, $a0
    sw          $s3, 0x1C($sp)
    addu        $s3, $v1, $v0
    sw          $ra, 0x28($sp)
    sw          $s0, 0x10($sp)
    addu        $a0, $s1, $zero
.L800225BC:
    andi        $s0, $s2, 0xFFFF
    jal         func_8003C6B4
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bnel        $v0, $s5, .L800225FC
    addiu       $s2, $s2, 0x1
    addu        $a0, $s1, $zero
    jal         func_8003C708
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bne         $v0, $s4, .L800225FC
    addiu       $s2, $s2, 0x1
    addu        $v0, $s3, $s0
    lbu         $v0, 0x0($v0)
    j .L80022610
    nop
.L800225FC:
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800225BC
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, -0x1
.L80022610:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80022538

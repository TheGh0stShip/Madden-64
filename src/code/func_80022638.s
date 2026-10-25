.text
.align 2
.set noreorder
.globl func_80022638
.ent func_80022638
func_80022638:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sll         $a2, $a2, 16
    sw          $s6, 0x28($sp)
    sra         $s6, $a2, 16
    sw          $s5, 0x24($sp)
    andi        $s5, $a3, 0xFFFF
    sw          $s3, 0x1C($sp)
    andi        $s3, $a1, 0xFFFF
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
    sll         $v1, $s3, 1
    addu        $v1, $v1, $s3
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s3
    addu        $v0, $v0, $a0
    sw          $s4, 0x20($sp)
    addu        $s4, $v1, $v0
    sw          $ra, 0x2C($sp)
    sw          $s0, 0x10($sp)
    andi        $s0, $s1, 0xFFFF
.L800226C0:
    addu        $a0, $s3, $zero
    jal         func_8003C6B4
    addu        $a1, $s0, $zero
    andi        $v0, $v0, 0xFF
    bnel        $v0, $s6, .L800226F8
    addiu       $s1, $s1, 0x1
    andi        $v0, $s2, 0xFFFF
    bne         $v0, $s5, .L800226F4
    addiu       $s2, $s2, 0x1
    addu        $v0, $s4, $s0
    lbu         $v0, 0x0($v0)
    j .L8002270C
    nop
.L800226F4:
    addiu       $s1, $s1, 0x1
.L800226F8:
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800226C0
    andi        $s0, $s1, 0xFFFF
    addiu       $v0, $zero, -0x1
.L8002270C:
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
.end func_80022638

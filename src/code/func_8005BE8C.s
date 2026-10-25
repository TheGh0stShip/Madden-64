.text
.align 2
.set noreorder
.globl func_8005BE8C
.ent func_8005BE8C
func_8005BE8C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v0, 0xDC($s0)
    lw          $s1, 0x1A8($s0)
    beqz        $v0, .L8005BF5C
    addu        $s2, $zero, $zero
    lw          $v0, 0xA0($s0)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lw          $v0, 0x70($s1)
    bnez        $v0, .L8005BEF0
    addu        $a0, $s0, $zero
    lw          $v0, 0x20($s0)
    lw          $v1, 0x4($s0)
    sll         $a2, $v0, 1
    addu        $a2, $a2, $v0
    lw          $v0, 0x0($v1)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    sll         $a2, $a2, 3
    sw          $v0, 0x70($s1)
.L8005BEF0:
    lw          $t0, 0x70($s1)
    lw          $v0, 0x20($s0)
    lw          $a3, 0xD8($s0)
    slt         $v0, $s2, $v0
    beqz        $v0, .L8005BFC0
    addu        $a2, $zero, $zero
.L8005BF08:
    lw          $v1, 0x4C($a3)
    beqz        $v1, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x0($v1)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x2($v1)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x10($v1)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x20($v1)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x12($v1)
    beqz        $v0, .L8005BFC4
    addu        $v0, $zero, $zero
    lhu         $v0, 0x4($v1)
    bnez        $v0, .L8005BF64
    sll         $v1, $a2, 8
.L8005BF5C:
    j .L8005BFC4
    addu        $v0, $zero, $zero
.L8005BF64:
    lw          $v0, 0xA0($s0)
    addu        $v1, $v0, $v1
    lw          $v0, 0x0($v1)
    bltz        $v0, .L8005BF5C
    addiu       $a1, $zero, 0x1
    addiu       $v1, $v1, 0x4
    addiu       $a0, $t0, 0x4
.L8005BF80:
    lw          $v0, 0x0($v1)
    sw          $v0, 0x0($a0)
    lw          $v0, 0x0($v1)
    bnel        $v0, $zero, .L8005BF94
    addiu       $s2, $zero, 0x1
.L8005BF94:
    addiu       $v1, $v1, 0x4
    addiu       $a1, $a1, 0x1
    slti        $v0, $a1, 0x6
    bnez        $v0, .L8005BF80
    addiu       $a0, $a0, 0x4
    addiu       $t0, $t0, 0x18
    lw          $v0, 0x20($s0)
    addiu       $a2, $a2, 0x1
    slt         $v0, $a2, $v0
    bnez        $v0, .L8005BF08
    addiu       $a3, $a3, 0x54
.L8005BFC0:
    addu        $v0, $s2, $zero
.L8005BFC4:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8005BE8C

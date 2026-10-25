.text
.align 2
.set noreorder
.globl func_80041438
.ent func_80041438
func_80041438:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s1, 0x8($a0)
    lw          $v0, 0x0($s1)
    lbu         $v1, 0x5($v0)
    lbu         $v0, 0x7($v0)
    addu        $v1, $v1, $v0
    addiu       $s0, $v1, -0x1
    andi        $v1, $v1, 0xFF
    beqz        $v1, .L800414B0
    nop
.L8004146C:
    andi        $v0, $s0, 0xFF
    lw          $a0, 0x10($s1)
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $a1, 0x98($v1)
    beqz        $a1, .L800414A4
    addu        $v0, $s0, $zero
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $v0, $s0, $zero
.L800414A4:
    andi        $v0, $v0, 0xFF
    bnez        $v0, .L8004146C
    addiu       $s0, $s0, -0x1
.L800414B0:
    lw          $a0, 0x4($s1)
    jal         func_8000D684
    nop
    lw          $a0, 0x8($s1)
    jal         func_8000D684
    nop
    lw          $a1, 0xC($s1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $a1, 0x10($s1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $a1, 0x0($s1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80041438

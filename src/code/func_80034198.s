.text
.align 2
.set noreorder
.globl func_80034198
.ent func_80034198
func_80034198:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    sw          $ra, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s0, 0x18($sp)
    lw          $s2, 0x8($a0)
    jal         func_80034FD8
    addu        $s1, $a1, $zero
    andi        $v0, $s1, 0xFF00
    srl         $v1, $v0, 8
    sltiu       $v0, $v1, 0x3
    beqz        $v0, .L8003422C
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8003420C
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800341EC
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800341FC
    nop
    j .L80034268
    nop
.L800341EC:
    beq         $v1, $v0, .L8003421C
    nop
    j .L80034268
    nop
.L800341FC:
    lui         $s0, 0x8009
    lw          $s0, -0x79D0($s0)
    j .L80034268
    nop
.L8003420C:
    lui         $s0, 0x8007
    lw          $s0, -0x6548($s0)
    j .L80034268
    nop
.L8003421C:
    lui         $s0, 0x8007
    lw          $s0, -0x6578($s0)
    j .L80034268
    nop
.L8003422C:
    addu        $a0, $s1, $zero
    jal         func_800349FC
    addiu       $a1, $sp, 0x10
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x2
    bne         $v0, $v1, .L80034294
    addu        $v0, $zero, $zero
    lh          $v0, 0x10($sp)
    lui         $a0, 0x8007
    lw          $a0, 0x24DC($a0)
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $s0, 0x4($v1)
.L80034268:
    lw          $v0, 0x0($s2)
    beq         $s0, $v0, .L80034290
    addu        $a0, $s0, $zero
    lw          $v0, 0xC($s0)
    sw          $v0, 0x18($s2)
    lw          $v0, 0x14($s0)
    addu        $a1, $s2, $zero
    jal         func_80034164
    sw          $v0, 0x1C($s2)
    sw          $s0, 0x0($s2)
.L80034290:
    addiu       $v0, $zero, 0x1
.L80034294:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80034198

.text
.align 2
.set noreorder
.globl func_8002C304
.ent func_8002C304
func_8002C304:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    andi        $s0, $a0, 0xFFFF
    addu        $a0, $s0, $zero
    sw          $ra, 0x18($sp)
    jal         func_80024B90
    sw          $s1, 0x14($sp)
    andi        $s1, $v0, 0xFF
    jal         func_80024BD4
    addu        $a0, $s0, $zero
    lui         $v1, 0x8007
    lhu         $v1, -0x4628($v1)
    andi        $a3, $v0, 0xFF
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L8002C360
    nop
    lui         $v0, 0x800C
    lbu         $v0, 0x4EEB($v0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x6190
    sll         $v0, $v0, 24
    j .L8002C370
    sra         $a2, $v0, 24
.L8002C360:
    lui         $a2, 0x8007
    lhu         $a2, -0x4620($a2)
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x461C
.L8002C370:
    andi        $a0, $s1, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beq         $a0, $v0, .L8002C3C4
    andi        $v0, $a2, 0xFFFF
    beqz        $v0, .L8002C3C8
    addu        $v1, $zero, $zero
    addu        $a2, $a0, $zero
    addu        $a0, $v0, $zero
    andi        $v0, $v1, 0xFFFF
.L8002C394:
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a1
    lhu         $v0, 0x0($v0)
    beql        $v0, $a2, .L8002C3C8
    addu        $s1, $v1, $zero
    addiu       $v1, $v1, 0x1
    andi        $v0, $v1, 0xFFFF
    sltu        $v0, $v0, $a0
    bnez        $v0, .L8002C394
    andi        $v0, $v1, 0xFFFF
    j .L8002C3CC
    andi        $v1, $s1, 0xFFFF
.L8002C3C4:
    addiu       $s1, $zero, 0x1E
.L8002C3C8:
    andi        $v1, $s1, 0xFFFF
.L8002C3CC:
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    subu        $v0, $v0, $v1
    addu        $a3, $a3, $v0
    andi        $v0, $a3, 0xFFFF
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8002C304

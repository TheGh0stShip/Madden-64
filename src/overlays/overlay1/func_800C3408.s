.text
.align 2
.set noreorder
.globl func_800C3408
.ent func_800C3408
func_800C3408:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lbu         $v0, 0x21($s0)
    andi        $v0, $v0, 0xBF
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s3, 0x2720($at)
    jal         func_800BD694
    nop
    addu        $a0, $s0, $zero
    jal         func_800BC004
    addu        $s2, $v0, $zero
    jal         func_800A6580
    addu        $s1, $v0, $zero
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $v0, $v1, .L800C34A4
    sll         $v1, $s1, 16
    lbu         $v0, 0x1E($s0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sra         $v1, $v1, 16
    nor         $v1, $zero, $v1
    srl         $v1, $v1, 31
    xor         $v0, $v0, $a0
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800C34A4
    addiu       $v0, $s1, 0x800
    andi        $s1, $v0, 0xFFF
.L800C34A4:
    lw          $v0, 0x98($s0)
    bltz        $v0, .L800C3528
    sll         $v0, $s1, 16
    sra         $a0, $v0, 25
    addu        $v0, $a0, $zero
    blez        $v0, .L800C34F8
    addu        $v1, $zero, $zero
    slti        $v0, $v0, 0x4
    beqz        $v0, .L800C34DC
    addiu       $v0, $a0, -0x5
    lw          $v0, 0x94($s0)
    slti        $v0, $v0, 0xF0
    sll         $v1, $v0, 4
    addiu       $v0, $a0, -0x5
.L800C34DC:
    sltiu       $v0, $v0, 0x3
    beqz        $v0, .L800C34F8
    nop
    lw          $v0, 0x94($s0)
    slti        $v0, $v0, -0xEF
    beql        $v0, $zero, .L800C34F8
    addiu       $v1, $zero, -0x10
.L800C34F8:
    lw          $v0, 0x94($s0)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    addu        $v0, $v0, $v1
    sw          $v0, 0x94($s0)
    lw          $v0, 0x8($s3)
    and         $v0, $s2, $v0
    beqz        $v0, .L800C3528
    lui         $v1, 0x8000
    lw          $v0, 0x98($s0)
    or          $v0, $v0, $v1
    sw          $v0, 0x98($s0)
.L800C3528:
    addu        $v0, $zero, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C3408

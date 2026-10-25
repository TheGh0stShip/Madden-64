.text
.align 2
.set noreorder
.globl func_8003B6AC
.ent func_8003B6AC
func_8003B6AC:
    addu        $t1, $a0, $zero
    addu        $t0, $zero, $zero
    addu        $a3, $zero, $zero
    addu        $a2, $zero, $zero
    addiu       $t4, $zero, 0x16
    addiu       $t3, $zero, 0x15
    addiu       $t2, $zero, 0x3F
    andi        $v0, $t0, 0xFFFF
.L8003B6CC:
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $t1
    lbu         $v0, 0xE($v1)
    andi        $a0, $v0, 0x3F
    beq         $a0, $t4, .L8003B714
    slti        $v0, $a0, 0x17
    beqz        $v0, .L8003B704
    nop
    beq         $a0, $t3, .L8003B714
    andi        $v0, $t0, 0xFFFF
    j .L8003B734
    nop
.L8003B704:
    beql        $a0, $t2, .L8003B784
    addiu       $t0, $t0, 0x1
    j .L8003B734
    andi        $v0, $t0, 0xFFFF
.L8003B714:
    lbu         $v0, 0x18($v1)
    lbu         $v1, 0x19($v1)
    addiu       $a3, $a3, 0x1
    addu        $v0, $v0, $v1
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    j .L8003B780
    addu        $a2, $a2, $v1
.L8003B734:
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $a1, $v1, $t1
    lbu         $v0, 0xE($a1)
    andi        $v0, $v0, 0xC0
    beql        $v0, $zero, .L8003B784
    addiu       $t0, $t0, 0x1
    lbu         $a0, 0x12($a1)
    addiu       $a3, $a3, 0x1
    lbu         $v0, 0x14($a1)
    lbu         $v1, 0x15($a1)
    sll         $a0, $a0, 1
    addu        $v0, $v0, $a0
    lbu         $a0, 0x1A($a1)
    sll         $v1, $v1, 1
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    addu        $a2, $a2, $v0
.L8003B780:
    addiu       $t0, $t0, 0x1
.L8003B784:
    andi        $v0, $t0, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L8003B6CC
    andi        $v0, $t0, 0xFFFF
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    lui         $v1, 0x8184
    ori         $v1, $v1, 0x8DA9
    .word       0x00430019  # multu       $v0, $v1
    andi        $v1, $a3, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00006810  # mfhi        $t5
    sll         $v0, $v0, 1
    srl         $a2, $t5, 7
    .word       0x00C2001B  # divu        $zero, $a2, $v0
    bnez        $v0, .L8003B7DC
    nop
    break       7
.L8003B7DC:
    .word       0x00001012  # mflo        $v0
    sll         $v0, $v0, 1
    addiu       $a2, $v0, -0x32
    sltiu       $v0, $a2, 0x65
    beql        $v0, $zero, .L8003B7F4
    addiu       $a2, $zero, 0x64
.L8003B7F4:
    jr          $ra
    andi        $v0, $a2, 0xFFFF
.end func_8003B6AC

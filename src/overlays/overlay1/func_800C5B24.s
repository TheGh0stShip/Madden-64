.text
.align 2
.set noreorder
.globl func_800C5B24
.ent func_800C5B24
func_800C5B24:
    addiu       $sp, $sp, -0x28
    lui         $a3, 0x7FFF
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    ori         $a3, $a3, 0xFFFF
    addu        $a2, $zero, $zero
    sw          $s0, 0x20($sp)
    addu        $s0, $zero, $zero
    srl         $a1, $v0, 1
    blez        $a1, .L800C5C24
    sw          $ra, 0x24($sp)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $t3, $v1, $a0
    lui         $t2, 0x8008
    lw          $t2, 0x7A70($t2)
    lui         $t1, 0x8008
    lw          $t1, 0x7A74($t1)
    addu        $t0, $a1, $zero
    sll         $v0, $a2, 16
.L800C5B90:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $t3
    lw          $a1, 0x0($v0)
    lw          $v1, 0x24($a1)
    lw          $v0, 0x1C($v1)
    lw          $v1, 0x20($v1)
    subu        $v0, $t2, $v0
    sra         $a0, $v0, 4
    subu        $v1, $t1, $v1
    bgez        $a0, .L800C5BC0
    sra         $v0, $v1, 4
    negu        $a0, $a0
.L800C5BC0:
    addu        $v1, $v0, $zero
    bltzl       $v1, .L800C5BCC
    negu        $v1, $v1
.L800C5BCC:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800C5BE8
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_800C14D4
    addu        $v1, $v1, $v0
.L800C5BE8:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    slt         $v0, $v1, $a3
    beqz        $v0, .L800C5C0C
    addiu       $v0, $a2, 0x1
    addu        $a3, $v1, $zero
    addu        $s0, $a1, $zero
.L800C5C0C:
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t0
    bnez        $v0, .L800C5B90
    sll         $v0, $a2, 16
.L800C5C24:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L800C5C4C
    lui         $v1, 0xFD80
    lui         $v0, 0x8008
    lw          $v0, 0x7A74($v0)
    slt         $v0, $v0, $v1
    bnez        $v0, .L800C5C8C
    nop
.L800C5C4C:
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800C5C74
    addiu       $v0, $zero, 0x8
    sb          $v0, 0x10($sp)
    addu        $a0, $s0, $zero
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    j           func_800C1560
    nop
.L800C5C74:
    sb          $v0, 0x10($sp)
    addu        $a0, $s0, $zero
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    lui         $at, 0x8009
    sw          $s0, -0x7F38($at)
.L800C5C8C:
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5B24

.text
.align 2
.set noreorder
.globl func_800C2190
.ent func_800C2190
func_800C2190:
    .word       0x00002012  # mflo        $a0
    nop
    nop
    subu        $v1, $v1, $a2
    sra         $v1, $v1, 4
    sra         $t6, $v1, 8
    sra         $t7, $v1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $a0, $a0, $v0
    sltu        $v0, $a0, $t2
    beqz        $v0, .L800C21D4
    addiu       $v0, $a3, 0x1
    addu        $t2, $a0, $zero
    addu        $t0, $a1, $zero
.L800C21D4:
    addu        $a3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t1
    bnez        $v0, . + 4 + (-0x28 << 2)
    sll         $v0, $a3, 16
    beqz        $t0, .L800C21FC
    addu        $a0, $t0, $zero
    jal         func_800BFF9C
    andi        $a1, $t8, 0xFFFF
.L800C21FC:
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C2190

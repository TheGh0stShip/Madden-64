.text
.align 2
.set noreorder
.globl func_800BDB28
.ent func_800BDB28
func_800BDB28:
    subu        $v0, $v1, $v0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, .L800BDB44
    addu        $v1, $a0, $zero
    addiu       $v1, $a0, 0x1
.L800BDB44:
    sll         $v0, $v1, 16
    blezl       $v0, .L800BDB50
    addiu       $v1, $zero, 0x1
.L800BDB50:
    sll         $v0, $v1, 16
    jr          $ra
    sra         $v0, $v0, 16
.end func_800BDB28

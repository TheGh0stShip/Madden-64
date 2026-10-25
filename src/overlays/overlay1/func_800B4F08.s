.text
.align 2
.set noreorder
.globl func_800B4F08
.ent func_800B4F08
func_800B4F08:
    addiu       $sp, $sp, -0x8
    addu        $t1, $zero, $zero
    addiu       $t3, $zero, 0xFF
    addu        $t2, $zero, $zero
    lbu         $t4, 0x1($a0)
    lbu         $v0, 0x0($a0)
    addu        $a3, $zero, $zero
    beqz        $v0, .L800B4F7C
    addu        $t5, $t4, $zero
    addu        $t6, $v0, $zero
    addu        $a2, $a0, $zero
    addu        $t0, $a0, $zero
.L800B4F38:
    lhu         $v1, 0xC($t0)
    andi        $a1, $v1, 0xFFFF
    sltu        $v0, $t3, $a1
    bnez        $v0, .L800B4F54
    addu        $t1, $t1, $v1
    addu        $t3, $v1, $zero
    lbu         $t4, 0x1($a2)
.L800B4F54:
    sltu        $v0, $a1, $t2
    bnel        $v0, $zero, .L800B4F6C
    addiu       $a2, $a2, 0x1
    addu        $t2, $v1, $zero
    lbu         $t5, 0x1($a2)
    addiu       $a2, $a2, 0x1
.L800B4F6C:
    addiu       $a3, $a3, 0x1
    sltu        $v0, $a3, $t6
    bnez        $v0, .L800B4F38
    addiu       $t0, $t0, 0x2
.L800B4F7C:
    sh          $t1, 0x24($a0)
    sb          $t5, 0x22($a0)
    sb          $t4, 0x23($a0)
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end func_800B4F08

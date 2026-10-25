.text
.align 2
.set noreorder
.globl func_800BE300
.ent func_800BE300
func_800BE300:
    negu        $a1, $t0
    bgez        $a0, .L800BE310
    addu        $v1, $a0, $zero
    negu        $v1, $a0
.L800BE310:
    slt         $v0, $a1, $v1
    beqz        $v0, .L800BE32C
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    j           func_800B9C18
    addu        $a1, $v1, $v0
.L800BE32C:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $a1, $a1, $v0
    lhu         $v0, 0x8($t1)
    lhu         $v1, 0x8($a3)
    sra         $a1, $a1, 16
    addu        $v0, $v0, $v1
    slt         $v0, $v0, $a1
    bnez        $v0, .L800BE3F4
    addu        $v0, $zero, $zero
    lh          $t0, 0x24($t2)
    lh          $a0, 0x24($a2)
    lh          $v1, 0x6($a3)
    lh          $v0, 0x6($t1)
    addu        $a1, $a0, $v1
    addu        $v0, $t0, $v0
    slt         $v0, $v0, $a1
    bnez        $v0, .L800BE390
    nop
    lh          $v0, 0x4($t1)
    addu        $v0, $t0, $v0
    slt         $v0, $a1, $v0
    beqz        $v0, .L800BE3F4
    addiu       $v0, $zero, 0x1
.L800BE390:
    lh          $v1, 0x4($a3)
    lh          $v0, 0x6($t1)
    addu        $a1, $a0, $v1
    addu        $v0, $t0, $v0
    slt         $v0, $v0, $a1
    bnez        $v0, .L800BE3C0
    nop
    lh          $v0, 0x4($t1)
    addu        $v0, $t0, $v0
    slt         $v0, $a1, $v0
    beqz        $v0, .L800BE3F4
    addiu       $v0, $zero, 0x1
.L800BE3C0:
    lh          $v1, 0x6($t1)
    lh          $v0, 0x6($a3)
    addu        $a1, $t0, $v1
    addu        $v0, $a0, $v0
    slt         $v0, $v0, $a1
    bnez        $v0, .L800BE3F4
    addu        $v0, $zero, $zero
    lh          $v0, 0x4($a3)
    addu        $v0, $a0, $v0
    slt         $v0, $a1, $v0
    bnez        $v0, .L800BE3F4
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x1
.L800BE3F4:
    jr          $ra
    nop
.end func_800BE300

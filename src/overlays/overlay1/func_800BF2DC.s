.text
.align 2
.set noreorder
.globl func_800BF2DC
.ent func_800BF2DC
func_800BF2DC:
    addu        $v1, $zero, $zero
    addiu       $a1, $zero, 0x13
    sll         $v0, $v1, 16
.L800BF2E8:
    sra         $v0, $v0, 14
    addu        $v0, $a0, $v0
    lbu         $v0, 0x64($v0)
    beql        $v0, $zero, .L800BF328
    addu        $v0, $zero, $zero
    bne         $v0, $a1, .L800BF30C
    addiu       $v0, $v1, 0x1
    j           func_800BAC04
    addiu       $v0, $zero, 0x1
.L800BF30C:
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xA
    bnez        $v0, .L800BF2E8
    sll         $v0, $v1, 16
    addu        $v0, $zero, $zero
.L800BF328:
    jr          $ra
    nop
.end func_800BF2DC

.text
.align 2
.set noreorder
.globl func_800BC114
.ent func_800BC114
func_800BC114:
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    sltu        $v0, $a1, $a0
    bnez        $v0, .L800BC160
    addu        $a2, $zero, $zero
    lui         $v1, 0x8007
    lw          $v1, 0x18E8($v1)
    sll         $v0, $a0, 4
    addu        $v1, $v0, $v1
.L800BC140:
    lw          $v0, 0x48($v1)
    addiu       $a0, $a0, 0x1
    srl         $v0, $v0, 7
    andi        $v0, $v0, 0xF
    addu        $a2, $a2, $v0
    sltu        $v0, $a1, $a0
    beqz        $v0, .L800BC140
    addiu       $v1, $v1, 0x10
.L800BC160:
    jr          $ra
    addu        $v0, $a2, $zero
    nop
.end func_800BC114

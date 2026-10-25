.text
.align 2
.set noreorder
.globl func_800BAEF8
.ent func_800BAEF8
func_800BAEF8:
    lui         $a2, 0x8008
    lbu         $a2, 0x4FA8($a2)
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x599C
    lhu         $v1, 0x0($a1)
    addiu       $v0, $zero, 0x500
    lui         $at, 0x8009
    sh          $v0, -0x59BC($at)
    addiu       $v0, $zero, 0x400
    andi        $a0, $a0, 0xFFFF
    lui         $at, 0x8009
    sh          $v0, -0x59C4($at)
    lui         $at, 0x8009
    sh          $zero, -0x59BA($at)
    lui         $at, 0x8009
    sh          $zero, -0x59C2($at)
    ori         $v1, $v1, 0x400
    bnez        $a0, .L800BAF4C
    sh          $v1, 0x0($a1)
    sltiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
.L800BAF4C:
    bnez        $a2, .L800BAF64
    addiu       $v0, $zero, 0x800
    lui         $at, 0x8009
    sh          $zero, -0x59B8($at)
    j           func_800B684C
    lui         $v0, 0x140
.L800BAF64:
    lui         $at, 0x8009
    sh          $v0, -0x59B8($at)
    lui         $v0, 0x140
    lui         $at, 0x8008
    sw          $v0, -0x5DB4($at)
    jr          $ra
    nop
.end func_800BAEF8

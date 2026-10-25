.text
.align 2
.set noreorder
.globl func_80099748
.ent func_80099748
func_80099748:
    lui         $v0, 0x8006
    lw          $v0, 0x5428($v0)
    addiu       $sp, $sp, -0x18
    bnez        $v0, .L80099778
    sw          $ra, 0x10($sp)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    ori         $a1, $zero, 0xC800
    lui         $at, 0x8006
    sw          $v0, 0x5428($at)
    lui         $at, 0x8006
    sw          $zero, 0x542C($at)
.L80099778:
    jal         func_80094FC0
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80099748

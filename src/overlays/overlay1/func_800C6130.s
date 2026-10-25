.text
.align 2
.set noreorder
.globl func_800C6130
.ent func_800C6130
func_800C6130:
    addiu       $v0, $s0, 0x1
    sb          $v0, 0x12($sp)
    lw          $a0, 0x0($a0)
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0x1B << 2)
    sll         $v0, $s0, 16
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C6130

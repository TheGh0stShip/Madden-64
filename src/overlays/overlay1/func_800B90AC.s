.text
.align 2
.set noreorder
.globl func_800B90AC
.ent func_800B90AC
func_800B90AC:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sll         $a1, $a2, 8
    sw          $ra, 0x14($sp)
    jal         func_80034198
    andi        $a1, $a1, 0xFF00
    andi        $v0, $v0, 0xFF
    sltu        $v0, $zero, $v0
    negu        $v0, $v0
    and         $s0, $s0, $v0
    andi        $v0, $s0, 0xFFFF
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B90AC

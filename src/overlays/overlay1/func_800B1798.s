.text
.align 2
.set noreorder
.globl func_800B1798
.ent func_800B1798
func_800B1798:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_80090C9C
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1798

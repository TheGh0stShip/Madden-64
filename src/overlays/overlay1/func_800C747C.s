.text
.align 2
.set noreorder
.globl func_800C747C
.ent func_800C747C
func_800C747C:
    addiu       $a0, $zero, 0x2D
    addu        $a0, $zero, $zero
    jal         func_80041BDC
    addiu       $a1, $zero, 0x28
    addiu       $a0, $zero, 0x2D
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    jal         func_800C1838
    nop
    lw          $ra, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800C747C

.text
.align 2
.set noreorder
.globl func_8009562C
.ent func_8009562C
func_8009562C:
    addiu       $v0, $zero, 0x3
    sw          $v0, 0x40($sp)
    addiu       $v0, $zero, 0x4
    addiu       $s0, $sp, 0x18
    addiu       $s1, $sp, 0x28
    sw          $v0, 0x50($sp)
    sw          $s0, 0x54($sp)
    sw          $s1, 0x58($sp)
    jal         func_800167FC
    sw          $a1, 0x5C($sp)
    lui         $a0, 0x8009
    lbu         $a0, -0x750D($a0)
    lui         $a1, 0x8009
    lbu         $a1, -0x750C($a1)
    jal         func_80022A3C
    nop
    addu        $a0, $s0, $zero
    jal         func_8002E65C
    addu        $a1, $v0, $zero
    lui         $a1, 0x8009
    lbu         $a1, -0x750B($a1)
    addiu       $v0, $zero, 0xFF
    beq         $a1, $v0, . + 4 + (0xA << 2)
    addiu       $v0, $zero, 0x20
    lui         $a0, 0x8009
    lbu         $a0, -0x750D($a0)
    jal         func_80022A3C
    nop
    addu        $a0, $s1, $zero
    jal         func_8002E65C
    addu        $a1, $v0, $zero
    j           func_80090F98
    addiu       $a0, $sp, 0x68
.end func_8009562C

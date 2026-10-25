.text
.align 2
.set noreorder
.globl func_800C4684
.ent func_800C4684
func_800C4684:
    addiu       $sp, $sp, -0x18
    beqz        $a0, .L800C46B0
    sw          $ra, 0x10($sp)
    lhu         $a1, 0x28($a0)
    andi        $v0, $a1, 0x1
    beqz        $v0, .L800C46B0
    sb          $zero, 0x21($a0)
    lw          $v1, 0x60($a0)
    andi        $v0, $a1, 0xFFFE
    jalr        $v1
    sh          $v0, 0x28($a0)
.L800C46B0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C4684

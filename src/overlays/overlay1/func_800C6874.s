.text
.align 2
.set noreorder
.globl func_800C6874
.ent func_800C6874
func_800C6874:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lbu         $a0, 0x21($a0)
    addiu       $v0, $zero, 0x40
    andi        $v1, $a0, 0xC0
    bne         $v1, $v0, .L800C68A4
    sll         $a1, $a1, 24
    sll         $a2, $a2, 24
    andi        $a0, $a0, 0x3F
    sra         $a1, $a1, 24
    jal         func_800317D8
    sra         $a2, $a2, 24
.L800C68A4:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C6874

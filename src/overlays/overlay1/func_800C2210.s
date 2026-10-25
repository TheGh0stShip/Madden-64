.text
.align 2
.set noreorder
.globl func_800C2210
.ent func_800C2210
func_800C2210:
    sw          $ra, 0x10($sp)
    jal         func_800A6580
    nop
    andi        $a0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $a0, $v1, .L800C223C
    addiu       $v0, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    sltiu       $v0, $v0, 0x1
.L800C223C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C2210

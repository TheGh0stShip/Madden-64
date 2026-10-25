.text
.align 2
.set noreorder
.globl func_8009BFF0
.ent func_8009BFF0
func_8009BFF0:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($a0)
    lw          $a1, 0x4($s0)
    beqz        $a1, .L8009C018
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x4($s0)
.L8009C018:
    lw          $v0, 0xC($s0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8009C040
    nop
    lw          $a1, 0x8($s0)
    beqz        $a1, .L8009C040
    nop
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x8($s0)
.L8009C040:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009BFF0

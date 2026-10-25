.text
.align 2
.set noreorder
.globl func_8009DA9C
.ent func_8009DA9C
func_8009DA9C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x18($sp)
    lw          $a1, 0x8($s0)
    lw          $v1, 0x0($a1)
    addiu       $v0, $zero, 0x1
    beql        $v1, $v0, .L8009DB20
    addu        $a0, $s1, $zero
    beqz        $v1, .L8009DAE0
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8009DB38
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8009DB38
    nop
.L8009DAE0:
    addu        $a0, $s1, $zero
    lw          $a3, 0x18($a1)
    lui         $a1, 0x800A
    addiu       $a1, $a1, -0x6BD4
    lui         $at, 0x8008
    sw          $zero, -0x7B58($at)
    lui         $at, 0x8008
    sw          $zero, -0x7B54($at)
    jal         func_80008F30
    addu        $a2, $s0, $zero
    addu        $a0, $s1, $zero
    lui         $a1, 0x8004
    addiu       $a1, $a1, 0x5620
    addu        $a2, $s0, $zero
    j           func_8009940C
    addiu       $a3, $zero, 0xF3
.L8009DB20:
    lui         $a1, 0x800A
    addiu       $a1, $a1, -0x6BD4
    addu        $a2, $s0, $zero
    addiu       $a3, $zero, 0xF7
    jal         func_80008F30
    nop
.L8009DB38:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8009DA9C

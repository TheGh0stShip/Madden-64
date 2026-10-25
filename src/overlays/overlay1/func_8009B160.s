.text
.align 2
.set noreorder
.globl func_8009B160
.ent func_8009B160
func_8009B160:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $ra, 0x20($sp)
    sw          $s0, 0x10($sp)
    lbu         $s0, 0x0($s1)
    andi        $v0, $s0, 0x80
    beqz        $v0, .L8009B1D4
    addiu       $s1, $s1, 0x1
    andi        $v0, $s0, 0x7F
    andi        $a2, $v0, 0xFF
    beqz        $a2, .L8009B1FC
    andi        $a0, $s2, 0xFFFF
    lbu         $v0, 0x1($s1)
    lbu         $a1, 0x0($s1)
    addiu       $s1, $s1, 0x2
    addu        $a0, $s3, $a0
    addiu       $a2, $a2, 0x1
    addu        $s2, $s2, $a2
    sll         $v0, $v0, 8
    or          $a1, $a1, $v0
    jal         func_8004DF68
    addu        $a1, $s3, $a1
    j           func_80096A60
    nop
.L8009B1D4:
    andi        $a0, $s2, 0xFFFF
    addu        $a0, $s3, $a0
    addu        $a1, $s1, $zero
    andi        $s0, $s0, 0x7F
    addiu       $s0, $s0, 0x1
    jal         func_8004DF68
    addu        $a2, $s0, $zero
    addu        $s2, $s2, $s0
    j           func_80096A60
    addu        $s1, $s1, $s0
.L8009B1FC:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8009B160

.text
.align 2
.set noreorder
.globl func_80097F08
.ent func_80097F08
func_80097F08:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80097F50
    nop
    addiu       $s2, $zero, -0x1
    addu        $s0, $a0, $zero
.L80097F28:
    lh          $a0, 0x2($s0)
    jal         func_80030B54
    nop
    andi        $v0, $v0, 0xFF3F
    bnez        $v0, .L80097F50
    nop
    addiu       $s0, $s0, 0x4
    lw          $v0, 0x0($s0)
    bne         $v0, $s2, .L80097F28
    addiu       $s1, $s1, 0x1
.L80097F50:
    lui         $a0, 0x8008
    lw          $a0, 0x6A2C($a0)
    sll         $v0, $s1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x6B70($at)
    lw          $v1, 0xAC($a0)
    jalr        $v1
    sw          $v0, 0xB0($a0)
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80097F08

.text
.align 2
.set noreorder
.globl func_8009A6BC
.ent func_8009A6BC
func_8009A6BC:
    addiu       $sp, $sp, -0x18
    addu        $a2, $a0, $zero
    sw          $ra, 0x10($sp)
    lw          $t0, 0x8($a2)
    lhu         $v0, 0x68($t0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L8009A730
    addu        $a0, $a1, $zero
    lw          $v1, 0x74($t0)
    beqz        $v1, .L8009A730
    nop
    lw          $v0, 0x14($v1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8009A750
    nop
    lw          $v0, 0x1C($v1)
    sw          $v0, 0x1C($a2)
    lw          $v0, 0x20($v1)
    sw          $v0, 0x20($a2)
    lhu         $a3, 0x54($v1)
    addiu       $v0, $zero, 0x6
    beq         $a3, $v0, .L8009A720
    addiu       $v0, $zero, 0x7
    bne         $a3, $v0, .L8009A730
    nop
.L8009A720:
    lw          $v0, 0x8($v1)
    lhu         $v0, 0x12($v0)
    negu        $v0, $v0
    sh          $v0, 0x12($t0)
.L8009A730:
    lui         $a1, 0x8009
    addiu       $a1, $a1, 0x603C
    lui         $at, 0x8008
    sw          $zero, -0x7BAC($at)
    lui         $at, 0x8008
    sw          $zero, -0x7BB0($at)
    jal         func_80008F30
    addiu       $a3, $zero, 0xF4
.L8009A750:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009A6BC

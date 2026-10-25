.text
.align 2
.set noreorder
.globl func_80093ABC
.ent func_80093ABC
func_80093ABC:
    nop
    beqz        $v0, .L80093B28
    addu        $v0, $zero, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    addiu       $v0, $zero, 0x6
    beq         $v1, $v0, .L80093B24
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6AE8($v1)
    bne         $v1, $v0, .L80093B08
    nop
    jal         func_8008F414
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80093B28
    addu        $v0, $zero, $zero
    j           func_8008F404
    addiu       $v0, $zero, 0x1
.L80093B08:
    jal         func_8008F414
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80093B28
    addiu       $v0, $zero, 0x1
.L80093B24:
    addu        $v0, $zero, $zero
.L80093B28:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80093ABC

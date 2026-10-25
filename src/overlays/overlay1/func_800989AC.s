.text
.align 2
.set noreorder
.globl func_800989AC
.ent func_800989AC
func_800989AC:
    lui         $v1, 0x8008
    lhu         $v1, 0x76DC($v1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    addiu       $v0, $v1, -0x7
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80098A38
    sw          $s0, 0x10($sp)
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x8
    bne         $v0, $v1, .L80098A30
    nop
    jal         func_8009321C
    addu        $a0, $zero, $zero
    addiu       $a0, $zero, 0x1
    jal         func_8009321C
    addu        $s0, $v0, $zero
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s0, $s0, $v0
    blez        $s0, .L80098A30
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lw          $v1, -0x6B70($v1)
    beq         $v1, $v0, .L80098A30
    nop
    jal         func_8009360C
    nop
    j           func_80094314
    nop
.L80098A30:
    jal         func_8008D1EC
    nop
.L80098A38:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800989AC

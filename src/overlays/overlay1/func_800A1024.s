.text
.align 2
.set noreorder
.globl func_800A1024
.ent func_800A1024
func_800A1024:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    sb          $a1, 0x4F70($at)
    lui         $at, 0x8008
    sh          $a0, 0x616A($at)
    andi        $v0, $v0, 0x400
    bnez        $v0, .L800A1058
    nop
    lui         $at, 0x8008
    sh          $a0, 0x7758($at)
.L800A1058:
    lui         $v0, 0x8008
    lhu         $v0, 0x5288($v0)
    lui         $at, 0x8008
    sh          $v0, 0x7B5E($at)
    sll         $v0, $a1, 24
    sra         $v1, $v0, 24
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800A1094
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800A10B0
    nop
    jal         func_8009CA08
    nop
    beqz        $v0, .L800A10B0
    nop
.L800A1094:
    jal         func_800AE9A4
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A10B0
    nop
    jal         func_8009C99C
    nop
.L800A10B0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A1024

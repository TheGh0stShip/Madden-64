.text
.align 2
.set noreorder
.globl func_800AD404
.ent func_800AD404
func_800AD404:
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, -0x5EA4($at)
    beqz        $a0, . + 4 + (0x2A << 2)
    andi        $s0, $a1, 0xFFFF
    lui         $v0, 0x8008
    lw          $v0, -0x5F00($v0)
    lw          $v0, 0x8($v0)
    lhu         $v1, 0x8($v0)
    addiu       $v0, $zero, 0x58
    bne         $v1, $v0, . + 4 + (0xF << 2)
    nop
    blez        $s0, . + 4 + (0x55 << 2)
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F00($v0)
    lw          $a0, 0x20($v0)
    jal         func_800A82B0
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5F00($v1)
.end func_800AD404

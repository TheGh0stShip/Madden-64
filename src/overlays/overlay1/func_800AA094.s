.text
.align 2
.set noreorder
.globl func_800AA094
.ent func_800AA094
func_800AA094:
    addiu       $sp, $sp, -0x58
    sw          $s0, 0x50($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x54($sp)
    lw          $a0, 0x14($s0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800AA0C8
    nop
    lw          $v0, 0x1C($s0)
    lw          $v1, 0x20($s0)
    j           func_800A59B0
    negu        $v0, $v0
.L800AA0C8:
    lw          $v0, 0x1C($s0)
    lw          $v1, 0x20($s0)
    negu        $v0, $v0
    negu        $v1, $v1
    sw          $v0, 0x1C($s0)
    sw          $v1, 0x20($s0)
    lw          $v0, 0x2C($s0)
    lw          $v1, 0x30($s0)
    lw          $a0, 0x3C($s0)
    lw          $a1, 0x40($s0)
    negu        $v0, $v0
    negu        $v1, $v1
    negu        $a0, $a0
    negu        $a1, $a1
    sw          $v0, 0x2C($s0)
    sw          $v1, 0x30($s0)
    sw          $a0, 0x3C($s0)
    sw          $a1, 0x40($s0)
    lw          $ra, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800AA094

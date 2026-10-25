.text
.align 2
.set noreorder
.globl func_80060F30
.ent func_80060F30
func_80060F30:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $v0, 0x4($s0)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x58
    lui         $v1, 0x8006
    addiu       $v1, $v1, 0xD7C
    sw          $v0, 0x1C8($s0)
    sw          $v1, 0x0($v0)
    lui         $v1, 0x8006
    addiu       $v1, $v1, 0xEF4
    sw          $v1, 0x8($v0)
    lui         $v1, 0x8006
    addiu       $v1, $v1, 0xEFC
    sw          $v1, 0xC($v0)
    sw          $zero, 0x44($v0)
    sw          $zero, 0x34($v0)
    lw          $v0, 0x78($s0)
    slti        $v0, $v0, 0x5
    bnez        $v0, .L80060FB8
    addiu       $v0, $zero, 0x36
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x4
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80060FB8:
    lw          $v0, 0x60($s0)
    slti        $v0, $v0, 0x101
    bnez        $v0, .L80060FEC
    addiu       $v0, $zero, 0x38
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x100
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80060FEC:
    jal         func_80060178
    addu        $a0, $s0, $zero
    jal         func_80060370
    addu        $a0, $s0, $zero
    lw          $v1, 0x58($s0)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L80061014
    nop
    jal         func_80060CF0
    addu        $a0, $s0, $zero
.L80061014:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80060F30

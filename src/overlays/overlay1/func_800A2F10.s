.text
.align 2
.set noreorder
.globl func_800A2F10
.ent func_800A2F10
func_800A2F10:
    lw          $v0, 0x4F34($v0)
    lui         $at, 0x8009
    sh          $v1, -0x6CE0($at)
    lui         $v1, 0xA0
    addu        $v0, $v0, $v1
    lui         $v1, 0x320
    lui         $at, 0x8008
    sw          $v0, 0x793C($at)
    slt         $v0, $v1, $v0
    beqz        $v0, .L800A2F44
    sll         $v0, $s1, 16
    lui         $at, 0x8008
    sw          $v1, 0x793C($at)
.L800A2F44:
    blez        $v0, .L800A2F78
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800A2F68
    andi        $v0, $a0, 0x2
    beqz        $v0, .L800A2F78
    nop
.L800A2F68:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x1D98
    jal         func_800AD77C
    nop
.L800A2F78:
    lui         $v1, 0x8009
    lh          $v1, -0x7F50($v1)
    addiu       $v0, $zero, -0x2
    beq         $v1, $v0, .L800A2FA4
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A2FB4
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x2140
    j           func_8009E888
    nop
.L800A2FA4:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x211C
    jal         func_800AD77C
    nop
.L800A2FB4:
    lui         $v1, 0x8007
    lbu         $v1, 0x18F8($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800A2FD0
    nop
    jal         func_8002B454
    nop
.L800A2FD0:
    jal         func_80025B10
    nop
    jal         func_800C5F70
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x57C4($v1)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
.end func_800A2F10

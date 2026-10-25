.text
.align 2
.set noreorder
.globl object_driver_initialize
.ent object_driver_initialize
object_driver_initialize:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $a0, 0x20($s0)
    addiu       $v0, $zero, 0x3
    beq         $a0, $v0, .L80054FD4
    slti        $v0, $a0, 0x4
    beqz        $v0, .L80054FB8
    addiu       $v0, $zero, 0x1
    beql        $a0, $v0, .L80054FCC
    sw          $a0, 0x24($s0)
    j .L80055140
    sw          $zero, 0x24($s0)
.L80054FB8:
    addiu       $v0, $zero, 0x4
    beq         $a0, $v0, .L800550DC
    nop
    j .L80055140
    sw          $zero, 0x24($s0)
.L80054FCC:
    j .L80055144
    sw          $a0, 0x28($s0)
.L80054FD4:
    lw          $v0, 0x118($s0)
    bnel        $v0, $zero, .L800550D0
    sw          $a0, 0x24($s0)
    lw          $v0, 0x124($s0)
    beqz        $v0, .L80055038
    nop
    lbu         $v1, 0x128($s0)
    beqz        $v1, .L80055008
    addiu       $v0, $zero, 0x1
    beql        $v1, $v0, .L800550D0
    sw          $a0, 0x24($s0)
    j .L80055010
    addiu       $v0, $zero, 0x6E
.L80055008:
    j .L800550CC
    addiu       $v0, $zero, 0x2
.L80055010:
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lbu         $v0, 0x128($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    j .L800550C0
    addiu       $a1, $zero, -0x1
.L80055038:
    lw          $v0, 0xD8($s0)
    lw          $a1, 0x0($v0)
    lw          $a2, 0x54($v0)
    lw          $a3, 0xA8($v0)
    xori        $v1, $a1, 0x1
    sltiu       $v1, $v1, 0x1
    xori        $v0, $a2, 0x2
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L80055074
    xori        $v1, $a1, 0x52
    bne         $a3, $a0, .L80055078
    sltiu       $v1, $v1, 0x1
    j .L800550D0
    sw          $a0, 0x24($s0)
.L80055074:
    sltiu       $v1, $v1, 0x1
.L80055078:
    xori        $v0, $a2, 0x47
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L80055094
    addiu       $v0, $zero, 0x42
    beq         $a3, $v0, .L800550CC
    addiu       $v0, $zero, 0x2
.L80055094:
    lw          $v0, 0x0($s0)
    sw          $a1, 0x18($v0)
    sw          $a2, 0x1C($v0)
    sw          $a3, 0x20($v0)
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x6B
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1
.L800550C0:
    jalr        $v0
    nop
    addiu       $v0, $zero, 0x3
.L800550CC:
    sw          $v0, 0x24($s0)
.L800550D0:
    addiu       $v0, $zero, 0x2
    j .L80055144
    sw          $v0, 0x28($s0)
.L800550DC:
    lw          $v0, 0x124($s0)
    beql        $v0, $zero, .L80055134
    sw          $a0, 0x24($s0)
    lbu         $v1, 0x128($s0)
    beqz        $v1, .L80055130
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L80055124
    addiu       $v0, $zero, 0x6E
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lbu         $v0, 0x128($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
.L80055124:
    addiu       $v0, $zero, 0x5
    j .L80055134
    sw          $v0, 0x24($s0)
.L80055130:
    sw          $a0, 0x24($s0)
.L80055134:
    addiu       $v0, $zero, 0x4
    j .L80055144
    sw          $v0, 0x28($s0)
.L80055140:
    sw          $zero, 0x28($s0)
.L80055144:
    lui         $at, 0x8000
    lwc1        $f1, 0x31E0($at)
    lwc1        $f0, 0x31E4($at)
    addiu       $v1, $zero, 0x1
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x58($s0)
    addiu       $v0, $zero, 0x100
    sw          $v1, 0x2C($s0)
    sw          $v1, 0x30($s0)
    sw          $zero, 0x40($s0)
    sw          $zero, 0x44($s0)
    sw          $zero, 0x48($s0)
    sw          $v1, 0x4C($s0)
    sw          $v1, 0x50($s0)
    sw          $zero, 0x54($s0)
    sw          $v1, 0x5C($s0)
    sw          $v0, 0x60($s0)
    sw          $zero, 0x88($s0)
    sw          $zero, 0x64($s0)
    sw          $zero, 0x68($s0)
    sw          $zero, 0x6C($s0)
    swc1        $f1, 0x38($s0)
    swc1        $f0, 0x3C($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end object_driver_initialize

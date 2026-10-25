.text
.align 2
.set noreorder
.globl func_800342B0
.ent func_800342B0
func_800342B0:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    andi        $v0, $a1, 0xFF00
    srl         $v1, $v0, 8
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x18($sp)
    beq         $v1, $v0, .L80034310
    sw          $s0, 0x10($sp)
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800342F0
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L80034300
    nop
    j .L80034370
    nop
.L800342F0:
    beq         $v1, $v0, .L80034320
    nop
    j .L80034370
    nop
.L80034300:
    lui         $s0, 0x8009
    lw          $s0, -0x79D0($s0)
    j .L80034328
    nop
.L80034310:
    lui         $s0, 0x8007
    lw          $s0, -0x6548($s0)
    j .L80034328
    nop
.L80034320:
    lui         $s0, 0x8007
    lw          $s0, -0x6578($s0)
.L80034328:
    lw          $a0, 0x0($s1)
    beq         $a0, $s0, .L80034370
    ori         $v0, $zero, 0xFE00
    beq         $a1, $v0, .L80034344
    nop
    jal         func_80034E58
    addu        $a1, $zero, $zero
.L80034344:
    lw          $v0, 0xC($s0)
    sw          $v0, 0x18($s1)
    lw          $v0, 0x14($s0)
    addu        $a0, $s0, $zero
    addu        $a1, $s1, $zero
    jal         func_80034164
    sw          $v0, 0x1C($s1)
    sh          $zero, 0x8($s1)
    sh          $zero, 0xE($s1)
    sw          $zero, 0x4($s1)
    sw          $s0, 0x0($s1)
.L80034370:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800342B0

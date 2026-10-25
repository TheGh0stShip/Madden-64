.text
.align 2
.set noreorder
.globl func_80040350
.ent func_80040350
func_80040350:
    addiu       $sp, $sp, -0x18
    beqz        $a1, .L800404AC
    sw          $ra, 0x10($sp)
    lhu         $a0, 0xC($a1)
    lw          $a1, 0x8($a1)
    andi        $v0, $a0, 0x4000
    beqz        $v0, .L80040394
    sll         $v0, $a0, 1
    andi        $a0, $a0, 0xBFFF
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $zero, -0x4F80($at)
    j .L800403B8
    nop
.L80040394:
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $a1
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0xBF
    sb          $v0, 0x0($v1)
.L800403B8:
    lui         $a2, 0x8007
    lw          $a2, 0x1308($a2)
    lw          $v1, 0x14($a2)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800403F0
    nop
    beqz        $v1, .L80040420
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L80040404
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L80040418
    nop
    j .L80040420
    nop
.L800403F0:
    lw          $v0, 0x10($a2)
    jalr        $v0
    nop
    j .L80040420
    nop
.L80040404:
    lw          $v1, 0x10($a2)
    lw          $v0, 0x0($v1)
    addiu       $v0, $v0, 0x1
    j .L80040420
    sw          $v0, 0x0($v1)
.L80040418:
    lw          $v0, 0x10($a2)
    sw          $zero, 0x0($v0)
.L80040420:
    lui         $a1, 0x8007
    lw          $a1, 0x1308($a1)
    lw          $v0, 0x0($a1)
    lui         $at, 0x8007
    sw          $v0, 0x1308($at)
    beqz        $v0, .L80040448
    nop
    sw          $zero, 0x4($v0)
    j .L80040450
    nop
.L80040448:
    lui         $at, 0x8007
    sw          $zero, 0x1304($at)
.L80040450:
    lui         $a0, 0x8007
    lw          $a0, 0x24E0($a0)
    jal         func_800332C8
    nop
    lui         $v0, 0x8007
    lw          $v0, 0x1308($v0)
    beqz        $v0, .L800404AC
    nop
    lui         $v0, 0x8007
    lbu         $v0, 0x12F8($v0)
    beqz        $v0, .L80040494
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x7F90($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800404A4
    addiu       $v0, $zero, 0x1
.L80040494:
    jal         func_80036B94
    nop
    j .L800404AC
    nop
.L800404A4:
    lui         $at, 0x8009
    sw          $v0, -0x6A20($at)
.L800404AC:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80040350

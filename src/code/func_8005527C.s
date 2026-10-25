.text
.align 2
.set noreorder
.globl func_8005527C
.ent func_8005527C
func_8005527C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v0, 0x10($s0)
    addiu       $v1, $v0, -0xC8
    sltiu       $v0, $v1, 0xB
    beqz        $v0, .L80055338
    addu        $s1, $zero, $zero
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x31E8($at)
    jr          $v0
    nop
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x14($s0)
    lw          $v0, 0x8($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0xC9
    sw          $v0, 0x10($s0)
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addu        $s1, $v0, $zero
    addiu       $v0, $zero, 0x1
    bne         $s1, $v0, .L80055364
    addu        $v0, $s1, $zero
    jal         func_80054F80
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0xCA
    j .L80055360
    sw          $v0, 0x10($s0)
    j .L80055360
    addiu       $s1, $zero, 0x1
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L80055360
    addu        $s1, $v0, $zero
.L80055338:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x12
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80055360:
    addu        $v0, $s1, $zero
.L80055364:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8005527C

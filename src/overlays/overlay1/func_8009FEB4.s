.text
.align 2
.set noreorder
.globl func_8009FEB4
.ent func_8009FEB4
func_8009FEB4:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $s0, 0x10($s1)
    lw          $v0, 0x24($s0)
    lw          $v1, 0x24($s0)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0xA8($s0)
    lw          $v0, 0x20($v1)
    addu        $a0, $s0, $zero
    lui         $at, 0x8008
    sw          $s0, 0x76CC($at)
    jal         func_800E199C
    sw          $v0, 0xAC($s0)
    lw          $v0, 0x24($s0)
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    addu        $a0, $s1, $zero
    sh          $zero, 0x32($s0)
    jal         func_800B8C90
    sh          $zero, 0x3E($v0)
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L8009FF64
    nop
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    lui         $at, 0x8008
    sw          $zero, -0x5F7C($at)
    andi        $v0, $v0, 0x100
    beqz        $v0, .L8009FF40
    nop
    jal         func_800B98F4
    addu        $a0, $s1, $zero
.L8009FF40:
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x41
    bne         $v1, $v0, .L800A001C
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
    addu        $a0, $s0, $zero
    j           func_8009B8F0
    addiu       $a1, $zero, 0x3C
.L8009FF64:
    lw          $v0, 0x24($s1)
    bnez        $v0, .L800A001C
    addiu       $v0, $zero, 0x3C
    lw          $v1, 0x2C($s0)
    bne         $v1, $v0, .L800A001C
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F7C($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x5F7C($at)
    sltiu       $v0, $v0, 0x4
    beqz        $v0, .L8009FFAC
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F88($v0)
    bnez        $v0, .L800A001C
    nop
.L8009FFAC:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v0, 0x24($s0)
    lw          $v1, 0x1C($a0)
    lw          $v0, 0x1C($v0)
    subu        $v1, $v1, $v0
    sw          $v1, 0x10($sp)
    lw          $v0, 0x24($s0)
    lw          $a0, 0x20($a0)
    lw          $v0, 0x20($v0)
    subu        $a0, $a0, $v0
    bnez        $v1, .L8009FFE8
    sw          $a0, 0x14($sp)
    beqz        $a0, .L800A0004
    addiu       $v0, $zero, 0x41
.L8009FFE8:
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    jal         func_800C16A0
    sra         $a1, $v0, 16
    addiu       $v0, $zero, 0x41
.L800A0004:
    lui         $at, 0x8008
    sw          $v0, 0x7B60($at)
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x41
    jal         func_800C0C8C
    nop
.L800A001C:
    lw          $v1, 0x24($s0)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x20
    sw          $v0, 0x14($v1)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lhu         $v0, 0x30($s0)
    sll         $v1, $v1, 1
    subu        $v0, $v0, $v1
    sh          $v0, 0x30($s0)
    sll         $v0, $v0, 16
    bltzl       $v0, .L800A0050
    sh          $zero, 0x30($s0)
.L800A0050:
    lui         $v0, 0x8009
    lw          $v0, -0x5FAC($v0)
    bne         $s0, $v0, .L800A0084
    nop
    lw          $v0, 0x24($s0)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v0, 0x1C($v0)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x24($s0)
    lw          $v0, 0x20($v0)
    jal         func_800B9820
    sw          $v0, 0x20($a0)
.L800A0084:
    lui         $at, 0x8008
    sw          $zero, 0x76CC($at)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009FEB4

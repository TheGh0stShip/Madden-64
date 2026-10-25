.text
.align 2
.set noreorder
.globl func_80037DA4
.ent func_80037DA4
func_80037DA4:
    addiu       $sp, $sp, -0x30
    sll         $v1, $a0, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v1, 0x2DC0($at)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L80037E18
    addiu       $v0, $zero, 0x10
    beq         $v1, $v0, .L80037E28
    addu        $s2, $zero, $zero
    j .L80037EE0
    nop
.L80037E18:
    lui         $s4, 0x8007
    addiu       $s4, $s4, 0x34CC
    j .L80037E30
    addu        $s2, $zero, $zero
.L80037E28:
    lui         $s4, 0x8007
    addiu       $s4, $s4, 0x34D8
.L80037E30:
    addiu       $s5, $zero, -0x1
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $s3, $v1, $a0
    sll         $v0, $s2, 16
.L80037E60:
    sra         $v0, $v0, 16
    addu        $v1, $s4, $v0
    lb          $v0, 0x0($v1)
    beql        $v0, $s5, .L80037EC8
    addiu       $v0, $s2, 0x2
    lbu         $s0, 0x1($v1)
    sll         $v0, $v0, 2
    addu        $s1, $v0, $s3
    lw          $a0, 0x0($s1)
    sll         $s0, $s0, 24
    jal         func_80037D34
    sra         $s0, $s0, 24
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    beq         $s0, $s5, .L80037EC8
    addiu       $v0, $s2, 0x2
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s3
    lw          $a0, 0x0($s0)
    jal         func_80037D34
    nop
    lw          $a0, 0x0($s1)
    lw          $a1, 0x0($s0)
    jal         func_800E1CF4
    nop
    addiu       $v0, $s2, 0x2
.L80037EC8:
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xC
    bnez        $v0, .L80037E60
    sll         $v0, $s2, 16
.L80037EE0:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80037DA4

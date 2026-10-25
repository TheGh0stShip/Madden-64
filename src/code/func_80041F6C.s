.text
.align 2
.set noreorder
.globl func_80041F6C
.ent func_80041F6C
func_80041F6C:
    addiu       $sp, $sp, -0x30
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $s2, 0x18($sp)
    sll         $s2, $s4, 2
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s2
    lhu         $s0, 0x4774($at)
    lui         $at, 0x8007
    addu        $at, $at, $s2
    lhu         $s3, 0x4776($at)
    or          $v0, $s0, $s3
    bnez        $v0, .L80041FC0
    subu        $a0, $s3, $s0
    j .L8004206C
    addu        $v0, $s0, $zero
.L80041FC0:
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    addiu       $s1, $v0, 0x1
    beqz        $s1, .L8004203C
    addu        $s5, $s1, $zero
    srl         $a2, $s0, 3
.L80041FDC:
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lbu         $v0, 0x7710($at)
    andi        $a1, $s0, 0x7
    srav        $v0, $v0, $a1
    andi        $v0, $v0, 0x1
    bnel        $v0, $zero, .L8004200C
    addiu       $s0, $s0, 0x1
    addiu       $s1, $s1, -0x1
    beqz        $s1, .L80042048
    addu        $v0, $s0, $zero
    addiu       $s0, $s0, 0x1
.L8004200C:
    sltu        $v0, $s3, $s0
    beqz        $v0, .L80042034
    nop
    lui         $at, 0x8007
    addu        $at, $at, $s2
    lhu         $s0, 0x4774($at)
    bne         $s1, $s5, .L80042034
    nop
    jal         func_80041EF8
    addu        $a0, $s4, $zero
.L80042034:
    bnez        $s1, .L80041FDC
    srl         $a2, $s0, 3
.L8004203C:
    srl         $a2, $s0, 3
    andi        $a1, $s0, 0x7
    addu        $v0, $s0, $zero
.L80042048:
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lbu         $a0, 0x7710($at)
    addiu       $v1, $zero, 0x1
    sllv        $v1, $v1, $a1
    or          $a0, $a0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sb          $a0, 0x7710($at)
.L8004206C:
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
.end func_80041F6C

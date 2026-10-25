.text
.align 2
.set noreorder
.globl func_80036268
.ent func_80036268
func_80036268:
    lui         $v0, 0x8007
    lbu         $v0, 0x12F8($v0)
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    sw          $ra, 0x20($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L800362BC
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, -0x5B00($v0)
    bnez        $v0, .L800362C0
    andi        $s1, $a0, 0xFFFF
    jal         func_800363F4
    andi        $a0, $a0, 0xFFFF
    jal         func_80036540
    addu        $a0, $zero, $zero
    j .L80036344
    nop
.L800362BC:
    andi        $s1, $a0, 0xFFFF
.L800362C0:
    addu        $a0, $s1, $zero
    jal         func_800369A0
    addu        $a1, $s2, $zero
    addu        $a0, $s1, $zero
    addu        $a1, $s2, $zero
    sll         $s0, $s1, 1
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F88($at)
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F84($at)
    lw          $a2, 0x4($v0)
    sll         $v0, $s2, 2
    addu        $v0, $v0, $v1
    jal         func_8003663C
    sw          $s3, 0x0($v0)
    addu        $a0, $s1, $zero
    jal         func_80036100
    addu        $a1, $s2, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x20
    sb          $v0, 0x0($v1)
.L80036344:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80036268

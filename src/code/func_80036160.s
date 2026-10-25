.text
.align 2
.set noreorder
.globl func_80036160
.ent func_80036160
func_80036160:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s3, 0x1C($sp)
    andi        $s3, $a0, 0xFFFF
    addu        $a0, $s3, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    jal         func_800369A0
    sw          $s0, 0x10($sp)
    sll         $s0, $s3, 1
    addu        $s0, $s0, $s3
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s1
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F88($at)
    sll         $v0, $s1, 1
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $s4, 0x4($v0)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s4, $zero
    addu        $a0, $s3, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F84($at)
    addu        $a1, $s1, $zero
    sll         $s2, $s1, 2
    addu        $a2, $s4, $zero
    addu        $v1, $s2, $v1
    jal         func_8003663C
    sw          $v0, 0x0($v1)
    addu        $a0, $s3, $zero
    jal         func_80036100
    addu        $a1, $s1, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s1
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x20
    sb          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v0, -0x4F84($at)
    addu        $s2, $s2, $v0
    lw          $v0, 0x0($s2)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80036160

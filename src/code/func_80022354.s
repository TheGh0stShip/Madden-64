.text
.align 2
.set noreorder
.globl func_80022354
.ent func_80022354
func_80022354:
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    bnez        $v0, .L800223C0
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    andi        $v1, $s1, 0xFFFF
.L8002238C:
    addiu       $s1, $s1, 0x1
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x1602($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x374E($at)
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x37
    bnez        $v0, .L8002238C
    andi        $v1, $s1, 0xFFFF
.L800223C0:
    sll         $a0, $s0, 16
    jal         func_80022C58
    sra         $a0, $a0, 16
    addu        $s1, $zero, $zero
    andi        $v0, $s0, 0xFFFF
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $s2, 0x2DC0($at)
    addu        $s3, $v0, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v0, $s3, 1
    addu        $v0, $v0, $s3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s3
    sll         $v0, $v0, 3
    addu        $s5, $v0, $a0
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x16A7
    addu        $s4, $v1, $v0
    addu        $a0, $s2, $zero
.L80022438:
    andi        $s0, $s1, 0xFFFF
    jal         func_8003C6B4
    addu        $a1, $s0, $zero
    sll         $v1, $s0, 2
    addu        $v1, $v1, $s5
    lw          $v1, 0x0($v1)
    addu        $a0, $s3, $zero
    sb          $v0, 0x20($v1)
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s2
    addu        $v0, $v0, $s4
    addu        $v0, $v0, $s0
    lbu         $a2, 0x0($v0)
    addu        $a1, $s0, $zero
    jal         func_8003B9C0
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L80022438
    addu        $a0, $s2, $zero
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
.end func_80022354

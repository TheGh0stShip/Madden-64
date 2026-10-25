.text
.align 2
.set noreorder
.globl roster_record_update
.ent roster_record_update
roster_record_update:
    addiu       $sp, $sp, -0x48
    sw          $s2, 0x40($sp)
    addu        $s2, $zero, $zero
    addiu       $v0, $zero, 0x3
    sw          $ra, 0x44($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    sw          $zero, 0x1C($sp)
    sh          $v0, 0x14($sp)
    sh          $zero, 0x16($sp)
    sh          $zero, 0x18($sp)
    sw          $zero, 0x20($sp)
    sll         $v0, $s2, 16
.L8003945C:
    sra         $v0, $v0, 16
    sll         $s0, $v0, 5
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x28($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $s1, 0xC90($at)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $s1, 0x2
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $a0, 0x2DC8($at)
    jal         func_80016FE4
    addiu       $s1, $s1, 0x88
    addiu       $v0, $zero, 0x8
    sw          $v0, 0x1C($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $v0, 0x2DC8($at)
    addu        $a0, $zero, $zero
    lw          $v0, 0x8($v0)
    addiu       $a1, $sp, 0x10
    sw          $s1, 0x10($sp)
    jal         func_8000D8DC
    sw          $v0, 0x28($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $a0, 0x2DCC($at)
    jal         func_80016FE4
    nop
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $a0, 0x2DD4($at)
    jal         func_80016FE4
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v0, 0xC90($at)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $v0, 0x1A28($at)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sw          $a0, 0x2DD0($at)
    jal         func_80016FE4
    nop
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x2
    bnez        $v0, .L8003945C
    sll         $v0, $s2, 16
    lw          $ra, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end roster_record_update

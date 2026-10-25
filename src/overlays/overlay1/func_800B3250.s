.text
.align 2
.set noreorder
.globl func_800B3250
.ent func_800B3250
func_800B3250:
    lui         $v1, 0x8008
    lh          $v1, 0x6DEA($v1)
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x2C($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x28($sp)
    addu        $s0, $zero, $zero
    addiu       $v0, $zero, -0x1
    sw          $ra, 0x30($sp)
    sh          $s1, 0x10($sp)
    sw          $a1, 0x14($sp)
    sw          $zero, 0x18($sp)
    beq         $v1, $v0, .L800B32AC
    sh          $a2, 0x20($sp)
    addiu       $a0, $zero, -0x1
.L800B328C:
    addiu       $v0, $s0, 0x1
    sll         $v1, $v0, 16
    sra         $v1, $v1, 13
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lh          $v1, 0x6DEA($at)
    bne         $v1, $a0, .L800B328C
    addu        $s0, $v0, $zero
.L800B32AC:
    lui         $a0, 0x8008
    lw          $a0, 0x7AA8($a0)
    addiu       $a1, $zero, 0x1
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    sll         $a0, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sw          $v0, 0x6DEC($at)
    addu        $v0, $v1, $zero
    addiu       $v1, $zero, 0x3
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v1, 0x6DE8($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $s1, 0x6DEA($at)
    lw          $ra, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B3250

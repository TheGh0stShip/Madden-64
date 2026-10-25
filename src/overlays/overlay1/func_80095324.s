.text
.align 2
.set noreorder
.globl func_80095324
.ent func_80095324
func_80095324:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sll         $a0, $a1, 16
    sra         $a0, $a0, 16
    addu        $a1, $s2, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    sw          $s0, 0x10($sp)
    sw          $ra, 0x1C($sp)
    jal         func_800167FC
    addu        $s0, $a3, $zero
    addu        $a0, $s2, $zero
    jal         func_8002E688
    addu        $a1, $s0, $zero
    jal         func_8004DF94
    addu        $a0, $s2, $zero
    sll         $a0, $s1, 16
    sra         $a0, $a0, 16
    jal         func_800167FC
    addu        $a1, $s2, $v0
    addiu       $v0, $zero, 0x1
    beq         $s1, $v0, .L80095394
    addu        $a0, $s2, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2490
    j           func_80090C78
    nop
.L80095394:
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2498
    jal         func_8002E688
    nop
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80095324

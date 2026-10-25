.text
.align 2
.set noreorder
.globl func_800AFB10
.ent func_800AFB10
func_800AFB10:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sra         $v0, $s1, 16
    sw          $ra, 0x18($sp)
    bnez        $v0, .L800AFB48
    sb          $zero, 0x0($s0)
    sll         $v0, $s1, 16
    bgez        $v0, .L800AFB48
    addiu       $v0, $zero, 0x2D
    sb          $v0, 0x0($s0)
    sb          $zero, 0x1($s0)
.L800AFB48:
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    sra         $a0, $s1, 16
    jal         func_800167FC
    addu        $a1, $s0, $v0
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $a1, $s0, $v0
    addiu       $v0, $zero, 0x2E
    sb          $v0, 0x0($a1)
    sll         $v0, $s1, 16
    bgez        $v0, .L800AFB88
    addu        $a0, $s1, $zero
    negu        $a0, $s1
.L800AFB88:
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    jal         func_800167FC
    addiu       $a1, $a1, 0x1
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AFB10

.text
.align 2
.set noreorder
.globl func_800B4C6C
.ent func_800B4C6C
func_800B4C6C:
    addiu       $sp, $sp, -0x10
    addu        $t5, $zero, $zero
    sw          $s2, 0x8($sp)
    lui         $s2, 0x8007
    addiu       $s2, $s2, -0x1584
    sw          $s1, 0x4($sp)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x1568
    addiu       $t9, $zero, 0x1
    addu        $t6, $zero, $zero
    addu        $t4, $zero, $zero
    sw          $s0, 0x0($sp)
.L800B4C9C:
    addu        $t2, $zero, $zero
    addiu       $s0, $t5, 0x1
.L800B4CA4:
    addiu       $t3, $zero, 0x1
    addu        $a2, $zero, $zero
    andi        $v1, $s0, 0x1
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    sll         $t8, $v0, 3
    addu        $a3, $t6, $zero
    andi        $t7, $t2, 0xFF
    addu        $t1, $s1, $zero
    addu        $t0, $s2, $zero
.L800B4CCC:
    lw          $v0, 0x0($t0)
    lui         $a1, 0x8007
    lw          $a1, -0x158C($a1)
    lw          $v1, 0x0($t1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t4
    addu        $v0, $a1, $v0
    lh          $a0, 0x8($v0)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t8
    addu        $v1, $a1, $v1
    lh          $v0, 0x8($v1)
    subu        $a0, $a0, $v0
    bgez        $a0, .L800B4D1C
    addu        $v0, $a3, $a1
    negu        $a0, $a0
    addiu       $v0, $v0, 0xA6
    addu        $v0, $v0, $a2
    j           func_800B0604
    sb          $t9, 0x0($v0)
.L800B4D1C:
    addiu       $v0, $v0, 0xA6
    addu        $v0, $v0, $a2
    sb          $zero, 0x0($v0)
    addu        $a0, $a0, $t7
    slti        $v0, $a0, 0x6
    beql        $v0, $zero, .L800B4D54
    addu        $t3, $zero, $zero
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v0, $a3, $v0
    addiu       $v0, $v0, 0x98
    addu        $v0, $v0, $a2
    j           func_800B0648
    sb          $zero, 0x0($v0)
.L800B4D54:
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v0, $a3, $v0
    addiu       $v0, $v0, 0x98
    addu        $v0, $v0, $a2
    sb          $a0, 0x0($v0)
    addiu       $t1, $t1, 0x4
    addiu       $a2, $a2, 0x1
    sltiu       $v0, $a2, 0x7
    bnez        $v0, .L800B4CCC
    addiu       $t0, $t0, 0x4
    beq         $t3, $t9, .L800B4CA4
    addiu       $t2, $t2, 0x1
    addiu       $t6, $t6, 0x7
    addiu       $t5, $t5, 0x1
    sltiu       $v0, $t5, 0x2
    bnez        $v0, .L800B4C9C
    addiu       $t4, $t4, 0x48
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end func_800B4C6C

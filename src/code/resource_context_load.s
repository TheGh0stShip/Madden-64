.text
.align 2
.set noreorder
.globl resource_context_load
.ent resource_context_load
resource_context_load:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $a2, 0x0($s0)
    lui         $a3, 0x8008
    addiu       $a3, $a3, -0x6B84
    addiu       $t0, $a2, 0x80
.L8001AC94:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8001AC94
    addiu       $a3, $a3, 0x10
    lw          $v1, 0x4($s0)
    lw          $v0, 0x8($s0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x6D68
    sw          $v0, 0x0($s1)
    lw          $v0, 0xC($s0)
    lui         $at, 0x8007
    sw          $v0, -0x6D64($at)
    lw          $a1, 0x0($s0)
    lui         $at, 0x8007
    sw          $v1, -0x6D54($at)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addu        $a1, $s0, $zero
    lui         $v0, 0x8007
    lw          $v0, -0x6D54($v0)
    beqz        $v0, .L8001AD60
    addiu       $a2, $v0, -0x1
    addiu       $t0, $s1, -0x4
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x6B84
    sll         $v0, $a2, 2
    addu        $a3, $v0, $v1
.L8001AD24:
    lw          $v0, 0x0($a3)
    lw          $a1, 0x8($v0)
    lhu         $v0, 0x8($a1)
    lui         $v1, 0x8007
    lw          $v1, -0x6D6C($v1)
    addiu       $a3, $a3, -0x4
    andi        $v0, $v0, 0xFFFC
    addu        $v0, $v0, $v1
    lw          $v0, 0x0($v0)
    lw          $v1, 0x0($t0)
    addu        $a0, $a2, $zero
    addiu       $a2, $a2, -0x1
    addu        $v0, $v0, $v1
    bnez        $a0, .L8001AD24
    sw          $v0, 0x10($a1)
.L8001AD60:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end resource_context_load

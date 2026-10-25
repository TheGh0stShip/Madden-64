.text
.align 2
.set noreorder
.globl memory_arena_finalize
.ent memory_arena_finalize
memory_arena_finalize:
    addiu       $sp, $sp, -0x10
    sw          $s3, 0xC($sp)
    sw          $s2, 0x8($sp)
    sw          $s1, 0x4($sp)
    sw          $s0, 0x0($sp)
    lw          $v0, 0x4($a0)
    bnez        $v0, .L80033F4C
    addiu       $a2, $zero, -0x1
    j .L80034084
    addiu       $v0, $zero, -0x1
.L80033F4C:
    lhu         $a0, 0x8($a0)
    addu        $t4, $v0, $zero
    ori         $t3, $zero, 0x8000
    addiu       $s3, $zero, 0x4000
    ori         $s2, $zero, 0xC000
    ori         $t2, $zero, 0x8600
    ori         $t1, $zero, 0x8200
    ori         $s1, $zero, 0x8100
    ori         $s0, $zero, 0x8400
    ori         $t9, $zero, 0x8500
    ori         $t0, $zero, 0x9200
    ori         $t8, $zero, 0x8700
    ori         $t7, $zero, 0x9100
    ori         $t6, $zero, 0xBE00
    ori         $t5, $zero, 0xBF00
    addiu       $a3, $zero, -0x1
    sll         $v0, $a0, 16
.L80033F90:
    sra         $v0, $v0, 15
    addu        $v0, $v0, $t4
    lhu         $a1, 0x2($v0)
    andi        $v1, $a1, 0xC000
    beq         $v1, $t3, .L80033FD0
    slt         $v0, $t3, $v1
    bnez        $v0, .L80033FC0
    nop
    beq         $v1, $s3, .L80034064
    sll         $v0, $a0, 16
    j .L80034064
    addu        $a2, $a1, $zero
.L80033FC0:
    beql        $v1, $s2, .L80034060
    addiu       $a0, $a0, 0x1
    j .L80034060
    addu        $a2, $a1, $zero
.L80033FD0:
    andi        $v1, $a1, 0xFF00
    beq         $v1, $t2, .L8003405C
    slt         $v0, $t2, $v1
    bnez        $v0, .L8003401C
    nop
    beq         $v1, $t1, .L8003405C
    slt         $v0, $t1, $v1
    bnez        $v0, .L80034004
    nop
    beql        $v1, $s1, .L80034060
    andi        $a0, $a1, 0xFF
    j .L80034064
    sll         $v0, $a0, 16
.L80034004:
    beql        $v1, $s0, .L80034060
    addiu       $a0, $a0, 0x1
    beql        $v1, $t9, .L80034060
    addiu       $a0, $a0, 0x1
    j .L80034064
    sll         $v0, $a0, 16
.L8003401C:
    beq         $v1, $t0, .L8003405C
    slt         $v0, $t0, $v1
    bnez        $v0, .L80034044
    nop
    beql        $v1, $t8, .L80034060
    addiu       $a0, $a0, 0x1
    beql        $v1, $t7, .L8003405C
    addiu       $a0, $a0, 0x1
    j .L80034064
    sll         $v0, $a0, 16
.L80034044:
    beql        $v1, $t6, .L80034060
    addiu       $a0, $zero, -0x1
    beql        $v1, $t5, .L80034060
    addiu       $a0, $zero, -0x1
    j .L80034064
    sll         $v0, $a0, 16
.L8003405C:
    addiu       $a0, $a0, 0x1
.L80034060:
    sll         $v0, $a0, 16
.L80034064:
    sra         $v0, $v0, 16
    beq         $v0, $a3, .L8003407C
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    beq         $v0, $a3, .L80033F90
    sll         $v0, $a0, 16
.L8003407C:
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
.L80034084:
    lw          $s3, 0xC($sp)
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end memory_arena_finalize

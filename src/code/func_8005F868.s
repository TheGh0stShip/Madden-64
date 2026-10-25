.text
.align 2
.set noreorder
.globl func_8005F868
.ent func_8005F868
func_8005F868:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v0, 0x4($s0)
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x0($v0)
    lw          $s1, 0x1C4($s0)
    jalr        $v0
    addiu       $a2, $zero, 0x400
    sw          $v0, 0x8($s1)
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x400
    sw          $v0, 0xC($s1)
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x400
    sw          $v0, 0x10($s1)
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x400
    addu        $a3, $zero, $zero
    lui         $t3, 0x2C
    ori         $t3, $t3, 0x8D00
    lui         $t2, 0x5B
    ori         $t2, $t2, 0x6900
    lui         $t1, 0xFF1D
    ori         $t1, $t1, 0xAF00
    lui         $t0, 0xFF4D
    ori         $t0, $t0, 0xB80
    sw          $v0, 0x14($s1)
.L8005F910:
    sll         $a0, $a3, 2
    addiu       $a3, $a3, 0x1
    lui         $a2, 0xFFFF
    ori         $a2, $a2, 0x492E
    lw          $v1, 0x8($s1)
    lui         $a1, 0x1
    ori         $a1, $a1, 0xC5A2
    sra         $v0, $t0, 16
    addu        $v1, $a0, $v1
    sw          $v0, 0x0($v1)
    lw          $v0, 0xC($s1)
    sra         $v1, $t1, 16
    addu        $t1, $t1, $a1
    addu        $v0, $a0, $v0
    sw          $v1, 0x0($v0)
    lw          $v0, 0x10($s1)
    lui         $v1, 0x1
    ori         $v1, $v1, 0x66E9
    addu        $v0, $a0, $v0
    sw          $t2, 0x0($v0)
    lw          $v0, 0x14($s1)
    addu        $t0, $t0, $v1
    addu        $t2, $t2, $a2
    addu        $a0, $a0, $v0
    sw          $t3, 0x0($a0)
    slti        $v0, $a3, 0x100
    bnez        $v0, .L8005F910
    addiu       $t3, $t3, -0x581A
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8005F868

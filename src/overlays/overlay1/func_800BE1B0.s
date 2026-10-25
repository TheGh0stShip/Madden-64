.text
.align 2
.set noreorder
.globl func_800BE1B0
.ent func_800BE1B0
func_800BE1B0:
    addu        $a1, $s4, $zero
    addu        $a2, $s3, $zero
    jal         func_800B9B84
    addiu       $a3, $s1, 0xA
    or          $s0, $s0, $v0
    lhu         $v0, 0x14($s4)
    andi        $v1, $s0, 0xFFFF
    sltiu       $v1, $v1, 0x1
    srl         $v0, $v0, 1
    andi        $v0, $v0, 0x1
    and         $v0, $v0, $v1
    beql        $v0, $zero, .L800BE230
    andi        $v1, $s0, 0xFFFF
    lhu         $v0, 0x14($s1)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800BE208
    addu        $a0, $s2, $zero
    addiu       $a1, $s4, 0xA
    addu        $a2, $s3, $zero
    jal         func_800B9B84
    addu        $a3, $s1, $zero
    or          $s0, $s0, $v0
.L800BE208:
    lhu         $v0, 0x14($s1)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800BE22C
    addu        $a0, $s2, $zero
    addiu       $a1, $s4, 0xA
    addu        $a2, $s3, $zero
    jal         func_800B9B84
    addiu       $a3, $s1, 0xA
    or          $s0, $s0, $v0
.L800BE22C:
    andi        $v1, $s0, 0xFFFF
.L800BE230:
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800BE284
    addu        $v0, $zero, $zero
    lw          $v0, 0x48($s2)
    lw          $a0, 0x48($s3)
    lhu         $v1, 0x16($v0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x2690
    lhu         $v0, 0x16($a0)
    sll         $v1, $v1, 4
    addu        $v1, $v1, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x0($v0)
    beqz        $v0, .L800BE280
    addu        $a0, $s2, $zero
    jalr        $v0
    addu        $a1, $s3, $zero
    j           func_800B9B60
    andi        $v0, $v0, 0xFFFF
.L800BE280:
    addu        $v0, $zero, $zero
.L800BE284:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800BE1B0

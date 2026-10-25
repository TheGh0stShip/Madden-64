.text
.align 2
.set noreorder
.globl func_8002C3FC
.ent func_8002C3FC
func_8002C3FC:
    addiu       $sp, $sp, -0x28
    addu        $a2, $zero, $zero
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x2
    andi        $a1, $a1, 0xFFFF
    slti        $v0, $a1, 0x27
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L8002C43C
    sw          $s0, 0x10($sp)
    slti        $v0, $a1, 0x24
    bnez        $v0, .L8002C43C
    nop
    addiu       $a2, $zero, 0xF0
    addiu       $s2, $zero, 0x1
.L8002C43C:
    lui         $v1, 0x8007
    lw          $v1, -0x4624($v1)
    andi        $s0, $a0, 0xFFFF
    addu        $a0, $s0, $zero
    addiu       $v0, $a2, 0x5A9C
    jal         func_80024B90
    addu        $s1, $v1, $v0
    addu        $a0, $s0, $zero
    jal         func_80024BD4
    andi        $s0, $v0, 0xFF
    andi        $s3, $v0, 0xFF
    andi        $a0, $s0, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beq         $a0, $v0, .L8002C4E0
    addu        $v0, $zero, $zero
    jal         func_80028A58
    nop
    andi        $v0, $v0, 0xFFFF
    .word       0x00520018  # mult        $v0, $s2
    .word       0x00001012  # mflo        $v0
    addu        $v1, $zero, $zero
    sll         $v0, $v0, 2
    beqz        $s2, .L8002C4C8
    addu        $s1, $s1, $v0
    andi        $a0, $s3, 0xFFFF
.L8002C4A0:
    lw          $v0, 0x0($s1)
    srl         $v0, $v0, 25
    beq         $a0, $v0, .L8002C4C8
    addiu       $v0, $v1, 0x1
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $s2
    bnez        $v0, .L8002C4A0
    addiu       $s1, $s1, 0x4
.L8002C4C8:
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    xor         $v0, $v0, $s2
    sltu        $v0, $zero, $v0
    negu        $v0, $v0
    and         $v0, $s1, $v0
.L8002C4E0:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8002C3FC

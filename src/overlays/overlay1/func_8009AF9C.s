.text
.align 2
.set noreorder
.globl func_8009AF9C
.ent func_8009AF9C
func_8009AF9C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x4F94($a0)
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x1C($sp)
    jal         func_80033298
    sw          $s2, 0x18($sp)
    addu        $a0, $zero, $zero
    addu        $s2, $v0, $zero
    sh          $s0, 0x0($s2)
    andi        $s0, $s0, 0xFFFF
    jal         func_80032E00
    sll         $a1, $s0, 1
    addu        $a0, $zero, $zero
    addu        $a2, $v0, $zero
    beqz        $s0, .L8009B018
    sw          $v0, 0x4($s2)
    addu        $a1, $s0, $zero
.L8009AFF0:
    lhu         $v1, 0x0($s1)
    andi        $v0, $a0, 0xFFFF
    addiu       $a0, $a0, 0x1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a2
    sh          $v1, 0x0($v0)
    andi        $v0, $a0, 0xFFFF
    sltu        $v0, $v0, $a1
    bnez        $v0, .L8009AFF0
    addiu       $s1, $s1, 0x2
.L8009B018:
    lui         $v0, 0x8009
    lhu         $v0, -0x503C($v0)
    beqz        $v0, .L8009B068
    addu        $a0, $zero, $zero
    lui         $a3, 0x8008
    lw          $a3, 0x7958($a3)
    addu        $a2, $v0, $zero
    andi        $a1, $a0, 0xFFFF
.L8009B038:
    sll         $v0, $a1, 2
    addu        $v1, $v0, $a3
    lw          $v0, 0x0($v1)
    bnez        $v0, .L8009B058
    addiu       $a0, $a0, 0x1
    sw          $s2, 0x0($v1)
    j           func_80096948
    addu        $v0, $a1, $zero
.L8009B058:
    andi        $v0, $a0, 0xFFFF
    sltu        $v0, $v0, $a2
    bnez        $v0, .L8009B038
    andi        $a1, $a0, 0xFFFF
.L8009B068:
    addu        $v0, $zero, $zero
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8009AF9C

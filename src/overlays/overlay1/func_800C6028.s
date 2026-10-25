.text
.align 2
.set noreorder
.globl func_800C6028
.ent func_800C6028
func_800C6028:
    addu        $s2, $v1, $a0
    sll         $v0, $s0, 16
.L800C6030:
    sra         $v0, $v0, 14
    addu        $a0, $v0, $s2
    lw          $v0, 0x0($a0)
    lhu         $v0, 0x28($v0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800C6068
    addiu       $v0, $zero, 0x19
    addiu       $v0, $zero, 0x28
    sb          $v0, 0x12($sp)
    lw          $a0, 0x0($a0)
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    j           func_800C1958
    addiu       $v0, $s0, 0x1
.L800C6068:
    sb          $v0, 0x12($sp)
    lw          $a0, 0x0($a0)
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x10
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnez        $v0, .L800C6030
    sll         $v0, $s0, 16
    addiu       $v0, $zero, 0x2
    sb          $v0, 0x11($sp)
    jal         func_8001FA38
    addiu       $a0, $zero, 0x2
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0x2D << 2)
    xori        $s1, $s1, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    beqz        $v0, . + 4 + (0x28 << 2)
    addu        $s0, $zero, $zero
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $s1, $v1, $a0
    sll         $v0, $s0, 16
    sra         $v0, $v0, 14
    addu        $a0, $v0, $s1
    lw          $v0, 0x0($a0)
    lhu         $v0, 0x28($v0)
    andi        $v0, $v0, 0x10
    bnez        $v0, . + 4 + (0x8 << 2)
    addiu       $v0, $zero, 0x19
    addiu       $v0, $zero, 0x28
    sb          $v0, 0x12($sp)
    lw          $a0, 0x0($a0)
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    j           func_800C1A24
.end func_800C6028

.text
.align 2
.set noreorder
.globl func_8009518C
.ent func_8009518C
func_8009518C:
    lw          $a0, 0x0($v0)
    jal         func_800BFF60
    addu        $s0, $s0, $s3
    lw          $a0, 0x0($s0)
    jal         func_800BFF60
    addiu       $s1, $s1, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    andi        $v0, $s1, 0xFFFF
    srl         $v1, $v1, 1
    sltu        $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0xE << 2)
    andi        $s0, $s1, 0xFFFF
    addu        $s1, $zero, $zero
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7F10
    andi        $v0, $s1, 0xFFFF
.L800951D0:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L800951D0
    andi        $v0, $s1, 0xFFFF
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    jal         func_80091E2C
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    jal         func_80091E2C
    nop
    jal         func_800A365C
    addu        $a0, $zero, $zero
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8009518C

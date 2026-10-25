.text
.align 2
.set noreorder
.globl func_800B9D38
.ent func_800B9D38
func_800B9D38:
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 4
    sll         $s0, $a0, 3
    addu        $s0, $s0, $s4
    lw          $v1, 0xB0($s0)
    addu        $s1, $v0, $s5
    lw          $v0, 0x24($s1)
    sra         $v1, $v1, 20
    sll         $v1, $v1, 16
    sw          $v1, 0x1C($v0)
    lw          $v0, 0xB0($s0)
    lw          $v1, 0x24($s1)
    sll         $v0, $v0, 12
    sra         $v0, $v0, 20
    sll         $v0, $v0, 16
    sw          $v0, 0x20($v1)
    lb          $v0, 0xB3($s0)
    lw          $v1, 0x24($s1)
    addu        $a0, $a0, $s3
    sll         $v0, $v0, 16
    sw          $v0, 0x24($v1)
    lbu         $a1, 0x16($a0)
    addu        $a0, $s1, $zero
    jal         func_800C16A0
    sll         $a1, $a1, 4
    lw          $a0, 0x24($s1)
    lw          $a1, 0xB4($s0)
    lhu         $a2, 0xB6($s0)
    jal         func_800B4988
    srl         $a1, $a1, 20
    lw          $v1, 0x24($s1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $v0, 0xFFFF
    sw          $v0, 0x18($v1)
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x4
    bnez        $v0, . + 4 + (-0x28 << 2)
    andi        $a0, $s2, 0xFFFF
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B9D38

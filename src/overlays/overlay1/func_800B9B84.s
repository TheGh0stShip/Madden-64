.text
.align 2
.set noreorder
.globl func_800B9B84
.ent func_800B9B84
func_800B9B84:
    lui         $a1, 0x1
    ori         $a1, $a1, 0x5D70
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $s5, 0x24($sp)
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x5040
    andi        $a0, $a0, 0xFFFF
    sll         $v1, $a0, 4
    subu        $v1, $v1, $a0
    lui         $a0, 0x8007
    lw          $a0, 0x18E8($a0)
    sll         $v0, $v1, 4
    addiu       $v0, $v0, 0x2540
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a1
    sw          $ra, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    addu        $s4, $a0, $v0
    addu        $s3, $a0, $v1
    andi        $a0, $s2, 0xFFFF
.L800B9BE4:
    sll         $v0, $a0, 2
    addu        $v0, $v0, $s5
    lw          $s1, 0x0($v0)
    sll         $s0, $a0, 3
    addu        $s0, $s0, $s4
    lw          $v0, 0x0($s0)
    lw          $v1, 0x24($s1)
    sra         $v0, $v0, 20
    sll         $v0, $v0, 16
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x24($s1)
    sll         $v0, $v0, 12
    sra         $v0, $v0, 20
    sll         $v0, $v0, 16
    sw          $v0, 0x20($v1)
    lb          $v0, 0x3($s0)
    lw          $v1, 0x24($s1)
    addu        $a0, $s3, $a0
    sll         $v0, $v0, 16
    sw          $v0, 0x24($v1)
    lbu         $a1, 0x0($a0)
    addu        $a0, $s1, $zero
    jal         func_800C16A0
    sll         $a1, $a1, 4
    lw          $a0, 0x24($s1)
    lw          $a1, 0x4($s0)
    lhu         $a2, 0x6($s0)
    jal         func_800B4988
    srl         $a1, $a1, 20
    lw          $v1, 0x24($s1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $v0, 0xFFFF
    sw          $v0, 0x18($v1)
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800B9BE4
    andi        $a0, $s2, 0xFFFF
    addu        $s2, $zero, $zero
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x5098
    andi        $a0, $s2, 0xFFFF
.L800B9C8C:
    sll         $v0, $a0, 2
    addu        $v0, $v0, $s5
    lw          $s1, 0x0($v0)
    sll         $s0, $a0, 3
    addu        $s0, $s0, $s4
    lw          $v0, 0x58($s0)
    lw          $v1, 0x24($s1)
    sra         $v0, $v0, 20
    sll         $v0, $v0, 16
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x58($s0)
    lw          $v1, 0x24($s1)
    sll         $v0, $v0, 12
    sra         $v0, $v0, 20
    sll         $v0, $v0, 16
    sw          $v0, 0x20($v1)
    lb          $v0, 0x5B($s0)
    lw          $v1, 0x24($s1)
    addu        $a0, $a0, $s3
    sll         $v0, $v0, 16
    sw          $v0, 0x24($v1)
    lbu         $a1, 0xB($a0)
    addu        $a0, $s1, $zero
    jal         func_800C16A0
    sll         $a1, $a1, 4
    lw          $a0, 0x24($s1)
    lw          $a1, 0x5C($s0)
    lhu         $a2, 0x5E($s0)
    jal         func_800B4988
    srl         $a1, $a1, 20
    lw          $v1, 0x24($s1)
    addiu       $s2, $s2, 0x1
    andi        $v0, $v0, 0xFFFF
    sw          $v0, 0x18($v1)
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800B9C8C
    andi        $a0, $s2, 0xFFFF
    addu        $s2, $zero, $zero
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x7138
    andi        $a0, $s2, 0xFFFF
    sll         $v0, $a0, 1
.end func_800B9B84

.text
.align 2
.set noreorder
.globl func_800B7DE0
.ent func_800B7DE0
func_800B7DE0:
    lw          $v0, 0x0($s0)
    lui         $v1, 0x3E
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E53($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7E1C
    lui         $v1, 0xFFFE
    lw          $v0, 0x0($s0)
    ori         $v1, $v1, 0xFFF
    and         $v0, $v0, $v1
    andi        $v1, $a0, 0x1F
    j           func_800B3704
    sll         $v1, $v1, 12
.L800B7E1C:
    lw          $v0, 0x0($s0)
    lui         $v1, 0x1
    ori         $v1, $v1, 0xF000
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E54($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7E58
    lui         $v1, 0x7FF
    lw          $v0, 0x4($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j           func_800B373C
    sll         $v1, $a0, 27
.L800B7E58:
    lw          $v0, 0x4($s0)
    lui         $v1, 0xF800
    or          $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E55($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7E94
    lui         $v1, 0xF83F
    lw          $v0, 0x4($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    andi        $v1, $a0, 0x1F
    j           func_800B3778
    sll         $v1, $v1, 22
.L800B7E94:
    lw          $v0, 0x4($s0)
    lui         $v1, 0x7C0
    or          $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E56($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7ED0
    lui         $v1, 0xFFC1
    lw          $v0, 0x4($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    andi        $v1, $a0, 0x1F
    j           func_800B37B4
    sll         $v1, $v1, 17
.L800B7ED0:
    lw          $v0, 0x4($s0)
    lui         $v1, 0x3E
    or          $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E57($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7F0C
    lui         $v1, 0xFFFE
    lw          $v0, 0x4($s0)
    ori         $v1, $v1, 0xFFF
    and         $v0, $v0, $v1
    andi        $v1, $a0, 0x1F
    j           func_800B37F4
    sll         $v1, $v1, 12
.L800B7F0C:
    lw          $v0, 0x4($s0)
    lui         $v1, 0x1
    ori         $v1, $v1, 0xF000
    or          $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E58($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B7F4C
    addiu       $v1, $zero, -0xF81
    lw          $v0, 0x4($s0)
    and         $v0, $v0, $v1
    andi        $v1, $a0, 0x1F
    sll         $v1, $v1, 7
    j           func_800B3830
    or          $v0, $v0, $v1
.L800B7F4C:
    lw          $v0, 0x4($s0)
    ori         $v0, $v0, 0xF80
    sw          $v0, 0x4($s0)
    lui         $a1, 0x8009
    lw          $a1, -0x5FA8($a1)
    beqz        $a1, .L800B8008
    lui         $a0, 0x1F
    lw          $v0, 0x24($a1)
    lw          $v1, 0x8($s0)
    lh          $v0, 0x1C($v0)
    ori         $a0, $a0, 0xFFFF
    and         $v1, $v1, $a0
    sll         $v0, $v0, 21
    or          $v1, $v1, $v0
    sw          $v1, 0x8($s0)
    lw          $v1, 0x24($a1)
    lw          $v0, 0x0($s0)
    lh          $v1, 0x20($v1)
    addiu       $a0, $zero, -0x1000
    and         $v0, $v0, $a0
    andi        $v1, $v1, 0xFFF
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x24($a1)
    lui         $a0, 0xFFE0
    lw          $v1, 0x8($s0)
    lh          $v0, 0x24($v0)
    ori         $a0, $a0, 0x7FF
    and         $v1, $v1, $a0
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 11
    or          $v1, $v1, $v0
    sw          $v1, 0x8($s0)
    lbu         $v1, 0x1E($a1)
    lbu         $v0, 0x0($t1)
    sll         $v1, $v1, 6
    andi        $v0, $v0, 0x3F
    or          $v0, $v0, $v1
    sb          $v0, 0x0($t1)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    lbu         $v1, 0x1F($v1)
    andi        $v0, $v0, 0xC3
    andi        $v1, $v1, 0xF
    sll         $v1, $v1, 2
    j           func_800B3950
    or          $v0, $v0, $v1
.L800B8008:
    lw          $v1, 0x8($s0)
    lui         $a2, 0x8008
    lw          $a2, 0x6178($a2)
    ori         $a0, $a0, 0xFFFF
    lw          $a1, 0x0($s0)
    lh          $v0, 0x1C($a2)
    lui         $a3, 0xFFE0
    and         $v1, $v1, $a0
    sll         $v0, $v0, 21
    or          $v1, $v1, $v0
    sw          $v1, 0x8($s0)
    lh          $v1, 0x20($a2)
    addiu       $v0, $zero, -0x1000
    and         $a1, $a1, $v0
    lw          $a0, 0x8($s0)
    andi        $v1, $v1, 0xFFF
    or          $a1, $a1, $v1
    sw          $a1, 0x0($s0)
    lh          $v0, 0x24($a2)
    ori         $a3, $a3, 0x7FF
    and         $a0, $a0, $a3
    andi        $v0, $v0, 0x3FF
    sll         $v0, $v0, 11
    or          $a0, $a0, $v0
    sw          $a0, 0x8($s0)
    lbu         $v0, 0x0($t1)
    ori         $v0, $v0, 0xC0
    sb          $v0, 0x0($t1)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800B80D4
    lui         $a0, 0x1F
    lw          $v1, 0x8($s0)
    ori         $a0, $a0, 0xFFFF
    lw          $v0, 0x0($s0)
    and         $a0, $v1, $a0
    sra         $v1, $v1, 21
    negu        $v1, $v1
    sll         $v1, $v1, 21
    or          $a0, $a0, $v1
    addiu       $v1, $zero, -0x1000
    and         $v1, $v0, $v1
    sll         $v0, $v0, 20
    sra         $v0, $v0, 20
    negu        $v0, $v0
    andi        $v0, $v0, 0xFFF
    or          $v1, $v1, $v0
    sw          $a0, 0x8($s0)
    sw          $v1, 0x0($s0)
.L800B80D4:
    lw          $v1, 0xC($s0)
    lui         $a0, 0x3F
    ori         $a0, $a0, 0xFFFF
    lui         $v0, 0x8008
    lhu         $v0, 0x76E0($v0)
    lui         $a1, 0xFFC0
    and         $v1, $v1, $a0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 18
    sll         $v0, $v0, 22
    or          $v1, $v1, $v0
    sw          $v1, 0xC($s0)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E2($v0)
    ori         $a1, $a1, 0xFFF
    and         $v1, $v1, $a1
    sll         $v0, $v0, 20
    srl         $v0, $v0, 22
    sll         $v0, $v0, 12
    or          $v1, $v1, $v0
    sw          $v1, 0xC($s0)
    lui         $a0, 0x8008
    lhu         $a0, 0x76E4($a0)
    addiu       $v0, $zero, -0xFFD
    and         $v1, $v1, $v0
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    andi        $a0, $a0, 0xFFC
    or          $v1, $v1, $a0
    sw          $v1, 0xC($s0)
    lw          $v0, 0x14($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L800B8164
    ori         $v0, $v1, 0x2
    addiu       $v0, $zero, -0x3
    and         $v0, $v1, $v0
.L800B8164:
    sw          $v0, 0xC($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B7DE0

.text
.align 2
.set noreorder
.globl func_800B7C80
.ent func_800B7C80
func_800B7C80:
    andi        $a0, $a0, 0xFFFF
    lui         $t1, 0x8007
    lw          $t1, 0x18E8($t1)
    sll         $v0, $a0, 4
    addiu       $v0, $v0, 0x40
    lui         $a3, 0x8008
    lhu         $a3, -0x5DBC($a3)
    addiu       $v1, $zero, -0x781
    addu        $a0, $a0, $t2
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8009
    sw          $zero, -0x4734($at)
    addu        $s0, $t1, $v0
    lw          $a1, 0x8($s0)
    lw          $a2, 0x4($s0)
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    andi        $t0, $t0, 0xF
    srl         $t0, $t0, 1
    and         $a1, $a1, $v1
    addu        $v0, $v0, $a3
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 7
    or          $a1, $a1, $v0
    lui         $v1, 0x8008
    lw          $v1, 0x5108($v1)
    addiu       $v0, $zero, -0x80
    and         $a2, $a2, $v0
    sw          $a1, 0x8($s0)
    lw          $a1, 0x8($s0)
    addiu       $v0, $zero, -0x8
    andi        $v1, $v1, 0x7F
    and         $a1, $a1, $v0
    or          $a1, $a1, $t0
    sw          $a1, 0x8($s0)
    lw          $a1, 0x8($s0)
    lui         $v0, 0x8009
    lb          $v0, -0x7F8A($v0)
    or          $a2, $a2, $v1
    addiu       $v1, $zero, -0x79
    sw          $a2, 0x4($s0)
    and         $a1, $a1, $v1
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 3
    or          $a1, $a1, $v0
    sw          $a1, 0x8($s0)
    lui         $a1, 0x8008
    lb          $a1, 0x5E50($a1)
    addiu       $v0, $zero, -0x1
    beq         $a1, $v0, .L800B7D68
    addu        $t1, $t1, $a0
    lw          $v0, 0x0($s0)
    lui         $v1, 0x7FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j           func_800B364C
    sll         $v1, $a1, 27
.L800B7D68:
    lw          $v0, 0x0($s0)
    lui         $v1, 0xF800
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lui         $a0, 0x8008
    lb          $a0, 0x5E51($a0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, . + 4 + (0x7 << 2)
    lui         $v1, 0xF83F
    lw          $v0, 0x0($s0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
.end func_800B7C80

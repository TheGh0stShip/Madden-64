.text
.align 2
.set noreorder
.globl func_80092FDC
.ent func_80092FDC
func_80092FDC:
    lw          $a0, 0x0($a3)
    lw          $v1, 0x0($v1)
    nor         $v0, $zero, $v0
    and         $v0, $a0, $v0
    and         $v1, $v0, $v1
    beqz        $v1, .L80093064
    andi        $v0, $v0, 0x10
    addiu       $v0, $zero, -0x1
    sh          $v0, 0x0($t2)
    lw          $v1, 0x0($a3)
    sll         $v0, $a2, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $v1, -0x4CA0($at)
    jal         func_800AE7F0
    andi        $a0, $t0, 0xFFFF
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    and         $v0, $v0, $s2
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v1, $v0, $s1
    lw          $a0, 0x0($v1)
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    addu        $v0, $v0, $s0
    sll         $v1, $v1, 1
    sw          $a0, 0x0($v0)
    addiu       $v0, $zero, 0xF0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x6C24($at)
    j           func_8008EE04
    nop
.L80093064:
    beqz        $v0, . + 4 + (0x130 << 2)
    nop
    lui         $v0, 0x8008
    lb          $v0, 0x76B8($v0)
    bne         $v0, $t1, .L8009308C
    sw          $a0, 0x0($a1)
    jal         func_800D61A0
    nop
    j           func_8008EE04
    nop
.L8009308C:
    jal         func_800D6118
    nop
    j           func_8008EE04
    nop
.end func_80092FDC

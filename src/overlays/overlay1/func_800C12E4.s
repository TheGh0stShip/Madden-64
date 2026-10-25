.text
.align 2
.set noreorder
.globl func_800C12E4
.ent func_800C12E4
func_800C12E4:
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x7AD0
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, 0x5E50($at)
    andi        $v0, $s2, 0xFFFF
.L800C1300:
    sll         $s0, $v0, 2
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s6
    lh          $v0, 0x0($v0)
    addu        $s1, $s0, $s7
    lw          $a0, 0x0($s1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s5
    lhu         $a1, 0x0($v0)
    jal         func_80096A00
    addu        $s0, $s0, $s4
    lw          $a0, 0x0($s0)
    lw          $a1, 0x0($s1)
    jal         func_80097578
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x4
    bnez        $v0, .L800C1300
    andi        $v0, $s2, 0xFFFF
    lui         $v1, 0x8009
    lh          $v1, -0x7F84($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, . + 4 + (0x6B << 2)
    addiu       $v0, $zero, 0x8
    lhu         $v1, 0x3C($s3)
    beq         $v1, $v0, . + 4 + (0x46 << 2)
.end func_800C12E4

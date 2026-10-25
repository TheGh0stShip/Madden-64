.text
.align 2
.set noreorder
.globl func_8009506C
.ent func_8009506C
func_8009506C:
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    jal         func_80038150
    addu        $a0, $zero, $zero
    jal         func_80038150
    addiu       $a0, $zero, 0x1
    jal         func_800BE784
    addu        $s1, $zero, $zero
    jal         func_800BCFAC
    nop
    jal         func_800E1EF8
    addu        $a0, $zero, $zero
    jal         func_800E1EF8
    addiu       $a0, $zero, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    beql        $v0, $zero, . + 4 + (0x15 << 2)
    addu        $s1, $zero, $zero
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5040
    addiu       $s3, $s2, 0x58
    andi        $s0, $s1, 0xFFFF
    sll         $s0, $s0, 2
    addu        $v0, $s0, $s2
    lw          $a0, 0x0($v0)
    jal         func_800BFF60
    addu        $s0, $s0, $s3
    lw          $a0, 0x0($s0)
.end func_8009506C

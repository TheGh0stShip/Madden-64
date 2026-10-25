.text
.align 2
.set noreorder
.globl func_80096964
.ent func_80096964
func_80096964:
    andi        $a1, $s2, 0xFF3F
    jal         func_800DD6EC
    addiu       $s0, $zero, -0xC1
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x7F10
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $v1, 0x8008
    lhu         $v1, 0x57B2($v1)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $s1, 0x5040($at)
    and         $v1, $v1, $s0
    sll         $v1, $v1, 16
    sra         $v1, $v1, 14
    lbu         $v0, 0x21($s1)
    addu        $v1, $v1, $a2
    lw          $a0, 0x0($v1)
    and         $s2, $v0, $s0
    addu        $a1, $s2, $zero
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a2
    sw          $zero, 0x0($v0)
    jal         func_800BFF9C
.end func_80096964

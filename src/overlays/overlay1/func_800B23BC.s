.text
.align 2
.set noreorder
.globl func_800B23BC
.ent func_800B23BC
func_800B23BC:
    jal         func_8002C9B0
    andi        $a1, $s4, 0xFFFF
    addu        $a0, $s1, $s0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s5
    jal         func_800AB3EC
    addu        $a1, $v0, $zero
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $a0, $v1, 3
    addu        $a0, $a0, $s7
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s5
    sw          $v0, 0x0($a0)
    lw          $v0, -0x10($s7)
    addiu       $v0, $v0, 0x2
    sw          $v0, -0x10($s7)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, . + 4 + (-0x53 << 2)
    sll         $v0, $s2, 16
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    lhu         $t1, 0x16($sp)
    sll         $a1, $s3, 16
    sra         $a1, $a1, 16
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x4674
    lui         $v1, 0x8007
    lw          $v1, -0x4674($v1)
    lw          $t0, 0x4($s6)
    addu        $a3, $v0, $zero
    sll         $a0, $t1, 16
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    sw          $t0, -0x4674($at)
    jal         func_800AEFF8
    sra         $a0, $a0, 16
    j           func_800ADD98
    sll         $v0, $v0, 16
.end func_800B23BC

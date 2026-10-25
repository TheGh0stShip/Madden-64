.text
.align 2
.set noreorder
.globl func_80096878
.ent func_80096878
func_80096878:
    lui         $at, 0x8007
    sh          $v1, -0x4856($at)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $a0, 0x4($v1)
    lhu         $v1, 0x0($a2)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, 0x2DBC($at)
    lui         $at, 0x8008
    addu        $at, $at, $a1
    lhu         $v0, 0x2DA6($at)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sh          $v0, 0x0($a2)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, . + 4 + (0x4D << 2)
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2
    beqz        $v0, . + 4 + (0x48 << 2)
    sll         $v0, $a3, 1
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a3
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x5040($at)
    lbu         $v0, 0x21($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, . + 4 + (0x1A << 2)
    nop
    jal         func_800DD6EC
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    andi        $v0, $v0, 0xFF3F
    sll         $v0, $v0, 16
    sra         $s2, $v0, 16
    sll         $v0, $s2, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $a0, -0x7F10($at)
    jal         func_800BFF60
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5040($at)
    j           func_800922C8
.end func_80096878

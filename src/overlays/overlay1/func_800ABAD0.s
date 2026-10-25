.text
.align 2
.set noreorder
.globl func_800ABAD0
.ent func_800ABAD0
func_800ABAD0:
    sw          $s0, 0x10($sp)
    andi        $s0, $a0, 0xFFFF
    sll         $v1, $s0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $a0, -0x5EB4($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5EB8
    addu        $v0, $v1, $v0
    sh          $a0, 0x0($v0)
    sll         $a0, $s0, 2
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lw          $a1, -0x5EC4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $zero, -0x5EAC($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sw          $a1, -0x5EE0($at)
    lhu         $a0, 0x0($v0)
    jal         func_800A84E0
    addu        $a1, $s0, $zero
    addu        $a0, $s0, $zero
    j           func_800A74F0
    addu        $a1, $zero, $zero
.end func_800ABAD0

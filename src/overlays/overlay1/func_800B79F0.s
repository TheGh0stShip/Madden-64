.text
.align 2
.set noreorder
.globl func_800B79F0
.ent func_800B79F0
func_800B79F0:
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($v1)
    lhu         $s1, 0x6($a1)
    lw          $s3, 0x24($v0)
    jal         func_80031964
    nop
    addu        $s0, $v0, $zero
    andi        $v0, $s0, 0x20
    bnez        $v0, .L800B7A20
    addiu       $v0, $zero, -0x1
    addiu       $v0, $zero, 0x1
.L800B7A20:
    lui         $at, 0x8008
    sw          $v0, -0x5DE0($at)
    addiu       $v0, $zero, 0x500
    lui         $at, 0x8008
    sw          $v0, -0x5DF0($at)
    andi        $v0, $s0, 0x100
    bnez        $v0, . + 4 + (0x5 << 2)
    addiu       $v0, $zero, 0x800
    lui         $at, 0x8008
    sw          $v0, -0x5DE8($at)
.end func_800B79F0

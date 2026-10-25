.text
.align 2
.set noreorder
.globl func_800373B4
.ent func_800373B4
func_800373B4:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sw          $ra, 0x18($sp)
    addu        $a0, $zero, $zero
.L800373D0:
    andi        $v1, $s0, 0xFFFF
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $a1, $v0, 2
    andi        $v0, $a0, 0xFFFF
.L800373FC:
    addiu       $a0, $a0, 0x1
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    addu        $v1, $v1, $a1
    andi        $v0, $a0, 0xFFFF
    sltiu       $v0, $v0, 0x37
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x1602($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x1603($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x1604($at)
    bnez        $v0, .L800373FC
    andi        $v0, $a0, 0xFFFF
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnel        $v0, $zero, .L800373D0
    addu        $a0, $zero, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    beqz        $v0, .L80037498
    addu        $s0, $zero, $zero
    andi        $a1, $s0, 0xFFFF
.L8003746C:
    andi        $a0, $s1, 0xFFFF
    jal         func_8003B9C0
    addu        $a2, $a1, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    srl         $v1, $v1, 1
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8003746C
    andi        $a1, $s0, 0xFFFF
.L80037498:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800373B4

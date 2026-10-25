.text
.align 2
.set noreorder
.globl func_800C61E8
.ent func_800C61E8
func_800C61E8:
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lbu         $v1, 0x1F($a1)
    sll         $s1, $v0, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x1860
    addu        $v0, $s1, $v0
    sll         $v1, $v1, 1
    addu        $v1, $v1, $v0
    lhu         $s0, 0x0($v1)
    jal         func_80031A1C
    nop
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800C6268
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    addu        $a0, $v0, $s1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v1, 0x1603($at)
    sltiu       $v0, $v1, 0xFF
    beqz        $v0, .L800C6268
    addiu       $v0, $v1, 0xA
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x1603($at)
.L800C6268:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C61E8

.text
.align 2
.set noreorder
.globl func_800C0114
.ent func_800C0114
func_800C0114:
    lbu         $v0, 0x21($a0)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    andi        $a1, $v0, 0x3F
    lui         $v0, 0x100
    and         $v1, $v1, $v0
    bnez        $v1, .L800C0174
    sll         $v1, $a1, 2
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6C80
    addu        $a1, $v1, $v0
    lw          $v0, 0x0($a1)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $v1, 0x78A8($at)
    nor         $v0, $zero, $v0
    ori         $v0, $v0, 0xF00
    and         $v0, $v1, $v0
    andi        $v0, $v0, 0xEF3F
    beql        $v0, $zero, .L800C0180
    sw          $v1, 0x0($a1)
    lhu         $v0, 0x28($a0)
    j           func_800BBA58
    ori         $v0, $v0, 0x1
.L800C0174:
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0xFFFE
    sh          $v0, 0x28($a0)
.L800C0180:
    jr          $ra
    nop
.end func_800C0114

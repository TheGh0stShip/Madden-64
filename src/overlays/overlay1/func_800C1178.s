.text
.align 2
.set noreorder
.globl func_800C1178
.ent func_800C1178
func_800C1178:
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x5
    bnez        $v0, . + 4 + (-0x22 << 2)
    andi        $v1, $s1, 0xFFFF
    lui         $v1, 0x8009
    lbu         $v1, -0x5C02($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800C11E0
    addu        $a1, $zero, $zero
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x270C
    lw          $a0, 0x0($s0)
    jal         func_80097D28
    addu        $a2, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    lw          $a1, 0x0($s0)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lw          $a1, 0x0($s0)
    jal         func_8000D834
    nop
    sw          $zero, 0x0($s0)
.L800C11E0:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, -0x11
.end func_800C1178

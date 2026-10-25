.text
.align 2
.set noreorder
.globl func_800BAB08
.ent func_800BAB08
func_800BAB08:
    nop
    lw          $v0, 0x4($s0)
    beqz        $v0, . + 4 + (0x83 << 2)
    addu        $a1, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x18F4($a0)
    jal         func_80097D28
    addu        $a2, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, 0x18F4($a0)
    jal         func_80098158
    addu        $a1, $zero, $zero
    j           func_800B65FC
    nop
.end func_800BAB08

.text
.align 2
.set noreorder
.globl func_800B07E4
.ent func_800B07E4
func_800B07E4:
    sw          $v0, -0x4664($at)
    addiu       $v0, $zero, 0x68
    beq         $a0, $v0, .L800B0804
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x57E4($a1)
    jal         func_800AD3A8
    nop
.L800B0804:
    bnez        $s0, . + 4 + (0x10B << 2)
    addiu       $a0, $zero, 0x2
    lui         $a2, 0x8008
    lw          $a2, 0x57E4($a2)
    j           func_800AC388
    addiu       $a1, $zero, 0x6
.end func_800B07E4

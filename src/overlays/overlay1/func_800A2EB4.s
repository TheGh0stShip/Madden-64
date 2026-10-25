.text
.align 2
.set noreorder
.globl func_800A2EB4
.ent func_800A2EB4
func_800A2EB4:
    bnez        $v0, .L800A2EC4
    nop
    jal         func_800293CC
    nop
.L800A2EC4:
    lui         $v1, 0x8008
    lh          $v1, 0x7AF0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800A2EE8
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x2134
    jal         func_800AD77C
    nop
.L800A2EE8:
    lui         $a0, 0x8009
    lhu         $a0, -0x7F3C($a0)
    andi        $v0, $a0, 0x8
    beqz        $v0, . + 4 + (0x20 << 2)
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    blez        $v0, . + 4 + (0x1C << 2)
    addiu       $v1, $zero, 0x1
    lui         $v0, 0x8008
.end func_800A2EB4

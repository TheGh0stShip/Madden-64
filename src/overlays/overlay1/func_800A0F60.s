.text
.align 2
.set noreorder
.globl func_800A0F60
.ent func_800A0F60
func_800A0F60:
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x4F34($a0)
    jal         func_80029494
    nop
    jal         func_8001FA20
    nop
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800A0FD8
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FAC($v0)
    bnez        $v0, .L800A0FD8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F30($v1)
    lw          $v0, 0x1C($a0)
    bne         $v1, $v0, .L800A0FD0
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    lw          $v0, 0x20($a0)
    beq         $v1, $v0, .L800A0FD8
    nop
.L800A0FD0:
    jal         func_8009EDB0
    nop
.L800A0FD8:
    jal         func_800AE8E4
    nop
    j           func_8009C8E8
    nop
.end func_800A0F60

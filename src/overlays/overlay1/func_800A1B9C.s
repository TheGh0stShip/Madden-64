.text
.align 2
.set noreorder
.globl func_800A1B9C
.ent func_800A1B9C
func_800A1B9C:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800A1BC4
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beqz        $v0, .L800A1BD4
    addiu       $a0, $zero, 0x3A
    j           func_8009D508
    addiu       $a1, $zero, 0xE
.L800A1BC4:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A1C04
    nop
.L800A1BD4:
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
    j           func_8009D7A0
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800A1C14
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beqz        $v0, .L800A1C24
    addiu       $fp, $zero, 0x1
.L800A1C04:
    jal         menu_sound_play
    addiu       $a0, $zero, 0x1
    j           func_8009D7A0
    addiu       $s1, $s1, 0x1
.L800A1C14:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, . + 4 + (0xA8 << 2)
    addiu       $fp, $zero, 0x3
.L800A1C24:
    addiu       $a0, $zero, 0x3A
    addiu       $a1, $zero, 0xF
    jal         func_80041DD4
    addiu       $a2, $zero, 0xF0
    j           func_8009D7A0
    addiu       $s1, $s1, 0x1
.end func_800A1B9C

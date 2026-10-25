.text
.align 2
.set noreorder
.globl func_800988AC
.ent func_800988AC
func_800988AC:
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    beqz        $v1, . + 4 + (0x38 << 2)
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    beqz        $v0, . + 4 + (0x34 << 2)
    nop
    lw          $v0, 0x24($v1)
    lw          $v0, 0x20($v0)
    sra         $v0, $v0, 20
    slti        $v0, $v0, 0x32
    bnez        $v0, . + 4 + (0x2E << 2)
    addiu       $a0, $zero, 0x3C
    addiu       $a1, $zero, 0xF
    jal         func_80041DD4
    addiu       $a2, $zero, 0xF0
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, 0x712E($at)
    j           func_80094278
    nop
.end func_800988AC

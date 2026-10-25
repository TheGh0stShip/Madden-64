.text
.align 2
.set noreorder
.globl func_800BD79C
.ent func_800BD79C
func_800BD79C:
    .word       0x00003010  # mfhi        $a2
    srl         $v0, $a2, 1
    andi        $s0, $v0, 0xFFFF
    slti        $v0, $s0, 0x4C
    bnel        $v0, $zero, .L800BD7B4
    addiu       $s0, $zero, 0x4C
.L800BD7B4:
    bgez        $s0, .L800BD7C0
    addu        $a0, $s0, $zero
    addiu       $a0, $s0, 0x7
.L800BD7C0:
    sra         $a0, $a0, 3
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    addu        $a0, $s0, $zero
    bgez        $s0, .L800BD7DC
    andi        $a1, $v0, 0xFFFF
    addiu       $a0, $s0, 0xF
.L800BD7DC:
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    sra         $v0, $a0, 4
    subu        $v0, $a1, $v0
    subu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x4A4E($at)
    andi        $v1, $v1, 0xFFFF
    sltiu       $v1, $v1, 0xA
    beqz        $v1, .L800BD810
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8006
    sh          $v0, 0x4A4E($at)
.L800BD810:
    lui         $v0, 0x8006
    lhu         $v0, 0x4A50($v0)
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    addu        $v0, $v0, $s0
    slt         $v0, $v0, $v1
    beqz        $v0, .L800BD850
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x14
    lui         $v1, 0x8006
    lhu         $v1, 0x4A50($v1)
    addu        $v1, $v1, $s0
    subu        $v1, $v1, $v0
    lui         $at, 0x8006
    sh          $v1, 0x4A4E($at)
.L800BD850:
    lui         $v0, 0x8006
.end func_800BD79C
